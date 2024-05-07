#!/nix/store/w4fvvhkzb0ssv0fw5j34pw09f0qw84w8-python3-3.11.7/bin/python3
# -*- coding: utf-8 -*-

# Software License Agreement (BSD License)
#
# Copyright (c) 2012, Willow Garage, Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#  * Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above
#    copyright notice, this list of conditions and the following
#    disclaimer in the documentation and/or other materials provided
#    with the distribution.
#  * Neither the name of Willow Garage, Inc. nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

"""This file generates shell code for the setup.SHELL scripts to set environment variables."""

from __future__ import print_function

import argparse
import copy
import errno
import os
import platform
import sys

CATKIN_MARKER_FILE = '.catkin'

system = platform.system()
IS_DARWIN = (system == 'Darwin')
IS_WINDOWS = (system == 'Windows')

PATH_TO_ADD_SUFFIX = ['bin']
if IS_WINDOWS:
    # while catkin recommends putting dll's into bin, 3rd party packages often put dll's into lib
    # since Windows finds dll's via the PATH variable, prepend it with path to lib
    PATH_TO_ADD_SUFFIX.extend(['lib'])

# subfolder of workspace prepended to CMAKE_PREFIX_PATH
ENV_VAR_SUBFOLDERS = {
    'CMAKE_PREFIX_PATH': '',
    'LD_LIBRARY_PATH' if not IS_DARWIN else 'DYLD_LIBRARY_PATH': 'lib',
    'PATH': PATH_TO_ADD_SUFFIX,
    'PKG_CONFIG_PATH': os.path.join('lib', 'pkgconfig'),
    'PYTHONPATH': 'lib/python3.11/site-packages',
}


def rollback_env_variables(environ, env_var_subfolders):
    """
    Generate shell code to reset environment variables.

    by unrolling modifications based on all workspaces in CMAKE_PREFIX_PATH.
    This does not cover modifications performed by environment hooks.
    """
    lines = []
    unmodified_environ = copy.copy(environ)
    for key in sorted(env_var_subfolders.keys()):
        subfolders = env_var_subfolders[key]
        if not isinstance(subfolders, list):
            subfolders = [subfolders]
        value = _rollback_env_variable(unmodified_environ, key, subfolders)
        if value is not None:
            environ[key] = value
            lines.append(assignment(key, value))
    if lines:
        lines.insert(0, comment('reset environment variables by unrolling modifications based on all workspaces in CMAKE_PREFIX_PATH'))
    return lines


def _rollback_env_variable(environ, name, subfolders):
    """
    For each catkin workspace in CMAKE_PREFIX_PATH remove the first entry from env[NAME] matching workspace + subfolder.

    :param subfolders: list of str '' or subfoldername that may start with '/'
    :returns: the updated value of the environment variable.
    """
    value = environ[name] if name in environ else ''
    env_paths = [path for path in value.split(os.pathsep) if path]
    value_modified = False
    for subfolder in subfolders:
        if subfolder:
            if subfolder.startswith(os.path.sep) or (os.path.altsep and subfolder.startswith(os.path.altsep)):
                subfolder = subfolder[1:]
            if subfolder.endswith(os.path.sep) or (os.path.altsep and subfolder.endswith(os.path.altsep)):
                subfolder = subfolder[:-1]
        for ws_path in _get_workspaces(environ, include_fuerte=True, include_non_existing=True):
            path_to_find = os.path.join(ws_path, subfolder) if subfolder else ws_path
            path_to_remove = None
            for env_path in env_paths:
                env_path_clean = env_path[:-1] if env_path and env_path[-1] in [os.path.sep, os.path.altsep] else env_path
                if env_path_clean == path_to_find:
                    path_to_remove = env_path
                    break
            if path_to_remove:
                env_paths.remove(path_to_remove)
                value_modified = True
    new_value = os.pathsep.join(env_paths)
    return new_value if value_modified else None


def _get_workspaces(environ, include_fuerte=False, include_non_existing=False):
    """
    Based on CMAKE_PREFIX_PATH return all catkin workspaces.

    :param include_fuerte: The flag if paths starting with '/opt/ros/fuerte' should be considered workspaces, ``bool``
    """
    # get all cmake prefix paths
    env_name = 'CMAKE_PREFIX_PATH'
    value = environ[env_name] if env_name in environ else ''
    paths = [path for path in value.split(os.pathsep) if path]
    # remove non-workspace paths
    workspaces = [path for path in paths if os.path.isfile(os.path.join(path, CATKIN_MARKER_FILE)) or (include_fuerte and path.startswith('/opt/ros/fuerte')) or (include_non_existing and not os.path.exists(path))]
    return workspaces


def prepend_env_variables(environ, env_var_subfolders, workspaces):
    """Generate shell code to prepend environment variables for the all workspaces."""
    lines = []
    lines.append(comment('prepend folders of workspaces to environment variables'))

    paths = [path for path in workspaces.split(os.pathsep) if path]

    prefix = _prefix_env_variable(environ, 'CMAKE_PREFIX_PATH', paths, '')
    lines.append(prepend(environ, 'CMAKE_PREFIX_PATH', prefix))

    for key in sorted(key for key in env_var_subfolders.keys() if key != 'CMAKE_PREFIX_PATH'):
        subfolder = env_var_subfolders[key]
        prefix = _prefix_env_variable(environ, key, paths, subfolder)
        lines.append(prepend(environ, key, prefix))
    return lines


def _prefix_env_variable(environ, name, paths, subfolders):
    """
    Return the prefix to prepend to the environment variable NAME.

    Adding any path in NEW_PATHS_STR without creating duplicate or empty items.
    """
    value = environ[name] if name in environ else ''
    environ_paths = [path for path in value.split(os.pathsep) if path]
    checked_paths = []
    for path in paths:
        if not isinstance(subfolders, list):
            subfolders = [subfolders]
        for subfolder in subfolders:
            path_tmp = path
            if subfolder:
                path_tmp = os.path.join(path_tmp, subfolder)
            # skip nonexistent paths
            if not os.path.exists(path_tmp):
                continue
            # exclude any path already in env and any path we already added
            if path_tmp not in environ_paths and path_tmp not in checked_paths:
                checked_paths.append(path_tmp)
    prefix_str = os.pathsep.join(checked_paths)
    if prefix_str != '' and environ_paths:
        prefix_str += os.pathsep
    return prefix_str


def assignment(key, value):
    if not IS_WINDOWS:
        return 'export %s="%s"' % (key, value)
    else:
        return 'set %s=%s' % (key, value)


def comment(msg):
    if not IS_WINDOWS:
        return '# %s' % msg
    else:
        return 'REM %s' % msg


def prepend(environ, key, prefix):
    if key not in environ or not environ[key]:
        return assignment(key, prefix)
    if not IS_WINDOWS:
        return 'export %s="%s$%s"' % (key, prefix, key)
    else:
        return 'set %s=%s%%%s%%' % (key, prefix, key)


def find_env_hooks(environ, cmake_prefix_path):
    """Generate shell code with found environment hooks for the all workspaces."""
    lines = []
    lines.append(comment('found environment hooks in workspaces'))

    generic_env_hooks = []
    generic_env_hooks_workspace = []
    specific_env_hooks = []
    specific_env_hooks_workspace = []
    generic_env_hooks_by_filename = {}
    specific_env_hooks_by_filename = {}
    generic_env_hook_ext = 'bat' if IS_WINDOWS else 'sh'
    specific_env_hook_ext = environ['CATKIN_SHELL'] if not IS_WINDOWS and 'CATKIN_SHELL' in environ and environ['CATKIN_SHELL'] else None
    # remove non-workspace paths
    workspaces = [path for path in cmake_prefix_path.split(os.pathsep) if path and os.path.isfile(os.path.join(path, CATKIN_MARKER_FILE))]
    for workspace in reversed(workspaces):
        env_hook_dir = os.path.join(workspace, 'etc', 'catkin', 'profile.d')
        if os.path.isdir(env_hook_dir):
            for filename in sorted(os.listdir(env_hook_dir)):
                if filename.endswith('.%s' % generic_env_hook_ext):
                    # remove previous env hook with same name if present
                    if filename in generic_env_hooks_by_filename:
                        i = generic_env_hooks.index(generic_env_hooks_by_filename[filename])
                        generic_env_hooks.pop(i)
                        generic_env_hooks_workspace.pop(i)
                    # append env hook
                    generic_env_hooks.append(os.path.join(env_hook_dir, filename))
                    generic_env_hooks_workspace.append(workspace)
                    generic_env_hooks_by_filename[filename] = generic_env_hooks[-1]
                elif specific_env_hook_ext is not None and filename.endswith('.%s' % specific_env_hook_ext):
                    # remove previous env hook with same name if present
                    if filename in specific_env_hooks_by_filename:
                        i = specific_env_hooks.index(specific_env_hooks_by_filename[filename])
                        specific_env_hooks.pop(i)
                        specific_env_hooks_workspace.pop(i)
                    # append env hook
                    specific_env_hooks.append(os.path.join(env_hook_dir, filename))
                    specific_env_hooks_workspace.append(workspace)
                    specific_env_hooks_by_filename[filename] = specific_env_hooks[-1]
    env_hooks = generic_env_hooks + specific_env_hooks
    env_hooks_workspace = generic_env_hooks_workspace + specific_env_hooks_workspace
    count = len(env_hooks)
    lines.append(assignment('_CATKIN_ENVIRONMENT_HOOKS_COUNT', count))
    for i in range(count):
        lines.append(assignment('_CATKIN_ENVIRONMENT_HOOKS_%d' % i, env_hooks[i]))
        lines.append(assignment('_CATKIN_ENVIRONMENT_HOOKS_%d_WORKSPACE' % i, env_hooks_workspace[i]))
    return lines


def _parse_arguments(args=None):
    parser = argparse.ArgumentParser(description='Generates code blocks for the setup.SHELL script.')
    parser.add_argument('--extend', action='store_true', help='Skip unsetting previous environment variables to extend context')
    parser.add_argument('--local', action='store_true', help='Only consider this prefix path and ignore other prefix path in the environment')
    return parser.parse_known_args(args=args)[0]


if __name__ == '__main__':
    try:
        try:
            args = _parse_arguments()
        except Exception as e:
            print(e, file=sys.stderr)
            sys.exit(1)

        if not args.local:
            # environment at generation time
            CMAKE_PREFIX_PATH = r'/nix/store/rvdg50acavz34qb72ivc0svl7r6895vx-colcon-0.12.1;/nix/store/w4fvvhkzb0ssv0fw5j34pw09f0qw84w8-python3-3.11.7;/nix/store/v7gamjkjhkqkxd9dc827wshnhszgvflm-ros-noetic-turtlesim-0.10.2-r1;/nix/store/1wrra984jf62n6hvgd3vkycppcmnv7bl-boost-1.81.0-dev;/nix/store/qbzl9v51i90m53fslkpn2dckr4d9gf81-boost-1.81.0;/nix/store/kc3pl0aly2nrjmqq5ccnawwvhga7my17-ros-noetic-geometry-msgs-1.13.1-r1;/nix/store/gpxkf984w0990hjr324jb6nza18j7kzl-ros-noetic-message-runtime-0.4.13-r1;/nix/store/ap8sw25invfbkb6f2wrs48md52slxr4r-ros-noetic-cpp-common-0.7.3-r1;/nix/store/95388cxxjjxl2dfj3rfn9bxrv1wfxvif-console-bridge-1.0.2;/nix/store/9qjwx2qsf5r1lqw7bhzxkvdx2am5x5vl-ros-noetic-genpy-0.6.15-r1;/nix/store/qjislxf6xd8crx106x912kk9majkiifa-ros-noetic-genmsg-0.6.0-r1;/nix/store/pnn4anan4vqbcjzf8r5yrbx655vdsfnd-ros-noetic-catkin-0.8.10-r1;/nix/store/jacf2kn4dfj99c3ywbvfyg6w53xvxsfl-cmake-3.27.8;/nix/store/6p4g6xifrgxj85bszxi479jkmgqg2902-catkin-setup-hook;/nix/store/949zhry8xxj9qy9cv00bx5r3wxv64sk5-wrap-python-hook;/nix/store/29hriahhv4sx5aagdh9k188p5kg5r4x0-make-shell-wrapper-hook;/nix/store/v0i3pgvjwrk3q5qbmpqpa2czr4rscg8g-die-hook;/nix/store/jp89dszyb61j89s40rd1v6k8b2kv1njb-gtest-1.12.1-dev;/nix/store/cdk38qqzrqpqkv0fkacg8zzy35fdz0vm-gtest-1.12.1;/nix/store/9mjcpxqlkl4d4ns8xqj9x57n69haw7ps-python3.11-catkin_pkg-0.5.2;/nix/store/22aqiw681cgxwxb41hz5c3asrf4s390g-python3.11-python-dateutil-2.8.2;/nix/store/9wwmhf5ny13lrni9k6pylcs5381z7c4h-python3.11-six-1.16.0;/nix/store/kms9vhdvj5hj6m0afsslbzahiyvfkan0-python3.11-docutils-0.20.1;/nix/store/pv8miyv9vb6mkdqz09y77084pr50slb7-python3.11-pyparsing-3.1.1;/nix/store/dyl7f7v3cfi7j9d4z42pn2ss0bgw0r33-python3.11-setuptools-69.0.2;/nix/store/mvij49mi6niiwjkqsyga5p30mjp7zhs4-python3.11-empy-4.0.1;/nix/store/q7izs2092m7l91cfqlj6kcphs04xgpld-python3.11-nose-1.3.7;/nix/store/ymrs2akjxp4vcyjqrw24kg0k3bslcj3s-python3.11-coverage-7.3.2;/nix/store/bws3mszvkqpf0rbdcm0k1xclyvv77yzh-python3.11-pyyaml-6.0.1;/nix/store/jdfkajvz7qhdyrvrs1jh4zx50mzlr1jl-ros-noetic-roscpp-serialization-0.7.3-r1;/nix/store/jjsphljrxqfjss2d5jy75zipcpln17k5-ros-noetic-roscpp-traits-0.7.3-r1;/nix/store/id072szbyyjb6bwak7jcc4dvas76bfm6-ros-noetic-rostime-0.7.3-r1;/nix/store/m1hc2f59d6bybk1mp6g59wsxnavvarrh-ros-noetic-std-msgs-0.5.13-r1;/nix/store/fz4wz0arjak0n9ma3ld0ybg9mlmyrm7b-qtbase-5.15.12-dev;/nix/store/8vf56va5f848yf39cj0ikdpbycm3gzia-libxml2-2.12.3-unstable-2023-12-14-dev;/nix/store/0lhpp01fk804wx7y9lxcnbzpnllw37pk-zlib-1.3-dev;/nix/store/4znq11s8j9d29kj2l4qivl5pyhbbzy8q-zlib-1.3;/nix/store/nzzhvvgpsfyrypd1xrmd4grydyvg2fbs-find-xml-catalogs-hook;/nix/store/99a4bak87cnxhr8ym5dw3ya37li6rvxb-libxml2-2.12.3-unstable-2023-12-14-bin;/nix/store/6czin0a2djhmkssv8fjwqzmc3d8w53lz-libxml2-2.12.3-unstable-2023-12-14;/nix/store/nxfwbqy21w7a7kz0q8y0bp0iazpc0qkg-libxslt-1.1.39-dev;/nix/store/aak5nyhl4jh7ly52699lywxdkygvq5x5-libxslt-1.1.39-bin;/nix/store/l1ggaribcvzv7ndwydyhqylkfk4wd0wr-libxslt-1.1.39;/nix/store/j7yb0yjmrmjx7a8lyh8yqniywm0l1jwr-openssl-3.0.12-dev;/nix/store/59z0rpla6hj12f4f4w3d9wnw67p5nk9p-openssl-3.0.12-bin;/nix/store/1l3a02nqq5b5v7rhchj89hi7plmbza5r-openssl-3.0.12;/nix/store/jpayxpky3s4qnwn7l61s9x256rs54356-sqlite-3.44.2-dev;/nix/store/za82xraz7bqqb6drw3f38w1g3yq0ri31-sqlite-3.44.2-bin;/nix/store/9yzvlh5vqjpf27h697ch1ajk9bqp2h13-sqlite-3.44.2;/nix/store/wknhqjkkdyqr26kxg2bwxa8pys3i7fgi-harfbuzz-7.3.0-dev;/nix/store/k0znpxvjpivyr1m4r655g8xwsxr3pd9x-graphite2-1.3.14-dev;/nix/store/2p1azsamsaksql5pgdpmlsr4b7pz50kx-graphite2-1.3.14;/nix/store/yigjjj9bfm0bdq3pcjqir1jvkg2wy5ai-harfbuzz-7.3.0;/nix/store/wm09bqgi15lqaraldx2jhb5k200381w8-icu4c-73.2-dev;/nix/store/v3bkb7jmz1d4q2wf3zzd3r8d4y5bndp7-icu4c-73.2;/nix/store/ry6rkhbkih7q9kly7crvfvxdjy9iikbb-libjpeg-turbo-2.1.5.1-dev;/nix/store/q5bqk3925j64kzhc9apniw4s0nf4lv3l-libjpeg-turbo-2.1.5.1-bin;/nix/store/n42jy8q586rkcvr80850mm4zd75vzdg6-libjpeg-turbo-2.1.5.1;/nix/store/pz788np7xff6cyg1cmhch0j0cqi6w62z-libpng-apng-1.6.40-dev;/nix/store/954azsd5c9fzkbywi67dcfx7d9zs6zn8-libpng-apng-1.6.40;/nix/store/yq7lmz00mgg87s5g6s12l43h25qq6njv-pcre2-10.42-dev;/nix/store/f85h6pqbdsyn96bpyxip78nqqr2kzyxc-pcre2-10.42-bin;/nix/store/w0q7xgwb18fdfrmsbzalxdbrhvzfrn5i-pcre2-10.42;/nix/store/c69j333svfnf70jawx94v17zd9sw20ln-dbus-1.14.10-dev;/nix/store/gmq2vvrj0a2h7jq9kjjdx33hz7v4z95w-expat-2.5.0-dev;/nix/store/8ah0ykrhnb24rppms5dp8nzg1z9n8r40-expat-2.5.0;/nix/store/vw8rfrcf4rqc72a5z6lzy4sgn7p6c11z-dbus-1.14.10-lib;/nix/store/vl5zykxl49zan3dkq8yhqfinyxg30lhh-dbus-1.14.10;/nix/store/vdaqdd9l32mnpxlv645y4sjslm82yv9x-glib-2.78.3-dev;/nix/store/fbzikmvl4bd4gxpvsrvillkgl731mxnk-libffi-3.4.4-dev;/nix/store/npfpil5nswlaqy7y56dwp0csj91pjiyd-libffi-3.4.4;/nix/store/ikzbzni2gni5581vdkkm4x67d0mlnxi0-gettext-0.21.1;/nix/store/cbzzpbnwl9hw5v7jrglq60y1wjjngd8s-glibc-iconv-2.38;/nix/store/1qjvqh6yl4cdrw48xwj5yb16v22ps39d-glib-2.78.3-bin;/nix/store/nynq8wryq2lzq92mcj0niiwady33qhss-glib-2.78.3;/nix/store/w8fnbncn09blpkb1jd03dv9j2k7zmihi-systemd-minimal-libs-255.2-dev;/nix/store/p29wd6v1nr9c11w58x45pcykrllc88rn-systemd-minimal-libs-255.2;/nix/store/jd5508ddxb88pkx10wqml605j2qx9qi3-fontconfig-2.15.0-dev;/nix/store/r8r0w1v8qrhgvj04mds3fsskx6li418i-freetype-2.13.2-dev;/nix/store/ihx7qgcs6vlnnpqrgimxaqx502nd9sc1-bzip2-1.0.8-dev;/nix/store/zd07lalq650lv09xkkp2yc9ahx66lm25-bzip2-1.0.8-bin;/nix/store/rmnl7cvvr3gfx4g821xbcaqy3x0g6v6r-bzip2-1.0.8;/nix/store/b8p3yly5vacr4prsqcm7b63srsba2dvg-brotli-1.1.0-dev;/nix/store/9nsd8bhgzb7ar3366lvlycj9lr0wldpx-brotli-1.1.0-lib;/nix/store/qrhsbf13r08bjrgkg11s6jf8a76nv0bn-brotli-1.1.0;/nix/store/a08037rgj7gam8qp1ma134n1pqbdfisa-freetype-2.13.2;/nix/store/bpsvz58sh1hbrvrjcyjnx6xvx0bd74a6-fontconfig-2.15.0-bin;/nix/store/2l7n2j174m0r2w6g3fa3yhw959d8nsx1-fontconfig-2.15.0-lib;/nix/store/gc06bbnjqh4a7gn8p9b7vk4yxzy1l9mj-libdrm-2.4.120-dev;/nix/store/2gag9kkhcl6105r0kfzacna1ws64fz66-libdrm-2.4.120-bin;/nix/store/lmqz8wx07avf4c5d0qqf0h5hwjni9yrj-libdrm-2.4.120;/nix/store/77gsvp9449ydvnz2j91dyvh8d58gdwg7-libX11-1.8.7-dev;/nix/store/nymgy9hw32mavimh1ghnw0s8nkwsg71k-xorgproto-2023.2;/nix/store/a03irllzpb61zwcrm7hp5v2n0mxlxpg3-libxcb-1.16-dev;/nix/store/d34xzgg5adx5l4ps79ppyb98lvyhkgm5-libxcb-1.16;/nix/store/x51ly05chwj47xgz5grn48rz5k2mvzlg-libX11-1.8.7;/nix/store/5l8zhxmqkn94fl839chx287wwwypyqyn-libXcomposite-0.4.6-dev;/nix/store/2g5x8plq5gk8khg7l7hjyk58ljayh14r-libXfixes-6.0.1-dev;/nix/store/91i5azhpqrbhggpkrh7z23plh47gg8qi-libXfixes-6.0.1;/nix/store/swgqynjda7lnl8iivd821nymz9rwvwxz-libXcomposite-0.4.6;/nix/store/shkyhxd90rs8l9c7c7fvzxqhr6h353qs-libXext-1.3.5-dev;/nix/store/mcgbrihx6mxv6ppgf5qnfcxk6j2179v0-libXau-1.0.11-dev;/nix/store/y83n31linby6r3j74qmrx07p4j3cvn3n-libXau-1.0.11;/nix/store/8a30syk0pipph0m1baz281as60q2d33m-libXext-1.3.5;/nix/store/ikjksvw2fis8jgc6ry0mwi8fc36ahnh7-libXi-1.8.1-dev;/nix/store/0r4jvkv443slsbw4qw0nhfk7hmkprv51-libXi-1.8.1;/nix/store/5jf4wjcyk7gzx6241q02cw6f8h7vpp93-libXrender-0.9.11-dev;/nix/store/f3gn7hqahmqgk9pxhl85irmbn1jjhswv-libXrender-0.9.11;/nix/store/hkcrf40q709k5xjmibnyd1655rzr69rk-libxkbcommon-1.5.0-dev;/nix/store/pav3ikskqx8nzynjr09pnd4js0v0hanp-libxkbcommon-1.5.0;/nix/store/9dlvndka7wfrfhv2lm9i25rb7wddcvnd-xcb-util-0.4.1-dev;/nix/store/rwraj6q5xak27mry3x7qw85mspvbxmfx-xcb-util-0.4.1;/nix/store/w224gqf9hqj5yd66q95vdicy9wk4qi4b-xcb-util-image-0.4.1-dev;/nix/store/ax8zcfk0lfbd41g8aykh5q5ixbwlqnp2-xcb-util-image-0.4.1;/nix/store/nqacai9s7iglrxcw8rwjvmsr0ssipwv8-xcb-util-keysyms-0.4.1-dev;/nix/store/y51n9yflcbj1f2g0898v2l8mhbpfaq3j-xcb-util-keysyms-0.4.1;/nix/store/d0mcxixlkm1hbqihpfv7a2nj3lgvprkp-xcb-util-renderutil-0.3.10-dev;/nix/store/alffy7wll81a7mv5ysh13r8bfbwjizgb-xcb-util-renderutil-0.3.10;/nix/store/ggi372zx85sc63jkl9mjvyn144w2r2gv-xcb-util-wm-0.4.2-dev;/nix/store/4wc8bl4ngx8glah0ji5d9saysnzly97f-xcb-util-wm-0.4.2;/nix/store/3bqj2qk67b2b5wcrng8yavz3aqfhan99-libGL-1.7.0-dev;/nix/store/g2k6pslg3dy4jn2hnz3aahsjvdbfyfgv-libGL-1.7.0;/nix/store/k203rr7im6rhbqpdravvzp92y2fn9mkn-libglvnd-1.7.0;/nix/store/wbpvny50nv0b5m8bhfyvi36vmrl092ly-libglvnd-1.7.0-dev;/nix/store/3sf9jhn4br2giddq8366rx3iczl3s995-qtbase-5.15.12-bin;/nix/store/y88jh47z8whm3x075ahjklv1m3i2lg21-qtbase-5.15.12;/nix/store/lihrmbh39fkhj4mbmh5w3skm5chnz6g3-ros-noetic-rosconsole-1.14.3-r1;/nix/store/rg37yzxnvx9j7p0dml1arn3k251v41xq-apr-1.7.4-dev;/nix/store/qrdvwhrdyj1sxrpsm2jjajrgzxrda8k2-apr-1.7.4;/nix/store/a3gy0kwwr7gw5pb4j19g1qrczqd5v18a-log4cxx-1.2.0;/nix/store/m6qi4sg28bdl1a6avc8zrc7p9bf9mmxh-ros-noetic-rosbuild-1.15.8-r1;/nix/store/l2mxm49gdg6wm0d00ck4jfchmpf7kavj-ros-noetic-message-generation-0.4.1-r1;/nix/store/zchp1a8axyblm6pck2p1hdzkag57mdx9-ros-noetic-gencpp-0.7.0-r1;/nix/store/6dbw0hpdb8h4izidkvgd28byrd9q4jrh-ros-noetic-geneus-3.0.0-r1;/nix/store/h29x6i311xb1yg69i7hhrannrz8yvwbi-ros-noetic-genlisp-0.4.18-r1;/nix/store/mvqksyprrrhvf7810zsx76c0kvw6x8zi-ros-noetic-gennodejs-2.0.2-r1;/nix/store/3wabmag91va0i32iyyrgq2j9s065r1xc-ros-noetic-roscpp-1.16.0-r1;/nix/store/bg2d7cip95dv553ilincq5s6jyx6a5n6-ros-noetic-rosgraph-msgs-1.11.3-r1;/nix/store/zpv9kigr75lh1x9hxxzv39abniwg5zsi-ros-noetic-xmlrpcpp-1.16.0-r1;/nix/store/wdim7acrhwzcfbx1sp0mxl7fpqzk1ls6-ros-noetic-roslib-1.15.8-r1;/nix/store/1vq2i3aykn5npiclifj6qxyyvkbg1ari-python3.11-rospkg-1.4.0;/nix/store/l2mnfqf5y9c550h2yxv40xm9n6ccqqq7-python3.11-distro-1.8.0;/nix/store/4w3b5l5rr7daiga9zcsk2cj0wjmxnm2g-ros-noetic-ros-environment-1.3.2-r1;/nix/store/zs0agvdca33mvh827wjkn20vpiyfv45n-ros-noetic-rospack-2.6.2-r1;/nix/store/01nygk9550khsba4msxd751bvgs8jj23-pkg-config-wrapper-0.29.2;/nix/store/hp9fs5fbdm1xvwiqx1wcg5m2q6zw68km-python3.11-rosdep-0.22.1;/nix/store/yj6ys640b5ahffnjm4f98j17xhhf1i6a-python3.11-rosdistro-0.9.0;/nix/store/v710l549nycprz3mplwbfkj3b956i3p6-tinyxml2-10.0.0;/nix/store/142gghbqfvjc14y96cpncz1mkzwxxm0p-ros-noetic-std-srvs-1.11.3-r1;/nix/store/is6mwgln824f4b1cxs55343glncpz3rv-ros-noetic-ros-core-1.5.0-r1;/nix/store/5n5nfxqi893qfy31aaw15h91w5mpdhka-ros-noetic-class-loader-0.5.0-r1;/nix/store/wwz044yqy1lfj9jiqml84lddpaf3b3bc-poco-1.12.5p2-dev;/nix/store/c02rgxywj8aqh282q7lj0v9ybm59k1wi-poco-1.12.5p2;/nix/store/8dyx46hk47q47gbswm7v4n3rywiyzvdm-ros-noetic-cmake-modules-0.5.0-r1;/nix/store/a86k7z0m8jl07ixxll5a120501agsqq8-ros-noetic-common-msgs-1.13.1-r1;/nix/store/ha00xryl25b0yf7isqspvivimiqgv4fz-ros-noetic-actionlib-msgs-1.13.1-r1;/nix/store/54q488f8ar7qx2xycy85vkwz8zmj97yy-ros-noetic-diagnostic-msgs-1.13.1-r1;/nix/store/14ch7h2csl95m8y3245xymp44nqn1gc4-ros-noetic-nav-msgs-1.13.1-r1;/nix/store/i7skmnnjv6k1lzld41k93bwif0r39jbc-ros-noetic-sensor-msgs-1.13.1-r1;/nix/store/0zbfw16hxn495yngabqn9v9h9l6vl9pa-ros-noetic-shape-msgs-1.13.1-r1;/nix/store/3ip42x7fyfg360pcskq3sxiw4did7and-ros-noetic-stereo-msgs-1.13.1-r1;/nix/store/lacq0hzcvl5qkza1zl21i399zvixhlbn-ros-noetic-trajectory-msgs-1.13.1-r1;/nix/store/k0abqqn1gjr0aar70ybskxidsxangjj0-ros-noetic-rosbag-migration-rule-1.0.1-r1;/nix/store/6x9lz0j0dnzprjxx9g4gnnpbgkwlgq7m-ros-noetic-visualization-msgs-1.13.1-r1;/nix/store/kzwnclg9cq50fniix4drzc3jxmvrk364-ros-noetic-pluginlib-1.13.0-r1;/nix/store/qhcxqhkpz20aisyhphdpqq8479gzrqh0-ros-noetic-ros-1.15.8-r1;/nix/store/y9za0zaf10f8fwpg7g5mmzh6ww6qai5d-ros-noetic-mk-1.15.8-r1;/nix/store/lv39i0533x83r5avrb0qwgr6znci8gk2-ros-noetic-rosbash-1.15.8-r1;/nix/store/kafkapc1p5ss8aakr85rddlwgp9pa2yw-ros-noetic-rosboost-cfg-1.15.8-r1;/nix/store/9bxyih89z069kgrk8siwnc270qznxvhb-ros-noetic-rosclean-1.15.8-r1;/nix/store/92ljzaxyf5hl3bdwvcgzvii1frgjarzg-ros-noetic-roscreate-1.15.8-r1;/nix/store/rk3bgqgvd42wc45ry3kc60lbgr45s93g-ros-noetic-roslang-1.15.8-r1;/nix/store/hs5qzql2abhlk9fl4qzsr4yf2azgphdr-ros-noetic-rosmake-1.15.8-r1;/nix/store/qhvf7cg8yq2hrycd1gabdy5y7386jfrj-ros-noetic-rosunit-1.15.8-r1;/nix/store/ryw4ryivjfiq6md5gjlhxxlxfpx9n3km-ros-noetic-ros-comm-1.16.0-r1;/nix/store/1rgfv555gz95jnh59g148d7bjd1r0a3s-ros-noetic-message-filters-1.16.0-r1;/nix/store/b0hzhsc3awzkzasc5c9zib177615bjga-ros-noetic-rosbag-1.16.0-r1;/nix/store/wq3m6af8gy452xz2cqv9ll8338l8s6k8-python3.11-pycryptodome-3.19.1;/nix/store/1vwf9i68vnpxhph0pqwm5rdfxccp77mq-python3.11-python-gnupg-0.5.1;/nix/store/av2xkcgc7bnyzrg0gk0vp5pbx7731j1l-ros-noetic-rosbag-storage-1.16.0-r1;/nix/store/78s9qjldwsygkgj9jpslg2zd0ib3bv9k-gpgme-1.23.2-dev;/nix/store/bhd3hn7ybvhjnb4v5j34hg2byr3xzvmb-libassuan-2.5.6-dev;/nix/store/j70xr5cpfdaal9102wl4zypcvcq1xdlk-libassuan-2.5.6;/nix/store/wv7fkdnk4pjwa9xiaky2jshbrhwkd63b-libgpg-error-1.47-dev;/nix/store/wqigl7a7nv4v0494s6qx7mlnngmpb6v0-libgpg-error-1.47;/nix/store/9r1gi64h7l7dli65zkf9732w8ms3m9mp-pth-2.0.7;/nix/store/hbnrzq9rx4qni94dq2i2xfv13zhjb1zd-gpgme-1.23.2;/nix/store/kpk48v94fzvxz0lmn833vygjys6zllfb-ros-noetic-roslz4-1.16.0-r1;/nix/store/wzm92hpkm780hsiykj1pamypd94hcrg7-lz4-1.9.4-dev;/nix/store/jc8dfvxjhmcqajam2aprz45zgsf4jaz2-lz4-1.9.4-bin;/nix/store/7i6r1zwzrbc6da8wmqcm1ab3q2i1apk4-lz4-1.9.4;/nix/store/j289720fr7myvzpi95jdh0x3b4ra8nzg-ros-noetic-rospy-1.16.0-r1;/nix/store/vglknnlh6wjnpy9zmdmp8lphv0515339-python3.11-numpy-1.26.2;/nix/store/397yqw9lhr1w5gl12ywa5j3cf8ay6rlj-ros-noetic-rosgraph-1.16.0-r1;/nix/store/szs5zrrg258cfa4zmk3xkyn6p06n7n8h-python3.11-netifaces-0.11.0;/nix/store/yygf4jxqjnkmzl99a69fxa84yhcj5009-ros-noetic-topic-tools-1.16.0-r1;/nix/store/9phv73i51jzyidsha689z4pqs07lnhq7-ros-noetic-roslaunch-1.16.0-r1;/nix/store/ynap1cl3cc82ascwj4d7zh93nzaisrsx-python3.11-paramiko-3.3.1;/nix/store/4fyiybq01cp4jx7nd6wjh6li8r3wf7b2-python3.11-bcrypt-4.0.1;/nix/store/ma66azi7zqxhv09fj03pbhqvgpjnrlxz-python3.11-cryptography-41.0.7;/nix/store/7xzc7j1n99fy40ri7h9aya5smifylilm-python3.11-cffi-1.16.0;/nix/store/f06k6cp26mabc8mx1ljlybsrsqm530d7-python3.11-pycparser-2.21;/nix/store/hm4kp4p9x5pyilqp5534dfqh81ri2db9-python3.11-pyasn1-0.5.1;/nix/store/3qmjmzjgd7f56rjm4rmd0s77wk41l9fl-python3.11-pynacl-1.5.0;/nix/store/ylq48s0ibxkqyb1g98sxv232fmrk6xxd-ros-noetic-rosmaster-1.16.0-r1;/nix/store/jk3pahp2jd2m2j9grc132d7hhv0xw2gd-python3.11-defusedxml-0.7.1;/nix/store/by4danw92ma77qzaazqm4yz4rd2xi3g7-ros-noetic-rosout-1.16.0-r1;/nix/store/qhja98fhcgh2q51gsg3bkqkzrv9l4q6f-ros-noetic-rosparam-1.16.0-r1;/nix/store/jp59k6d7vkg3xhn92shljnfs409p7asr-ros-noetic-roslisp-1.9.25-r1;/nix/store/nh8qlhp9gwgr2jnlj0d8z9yi8slf748s-sbcl-2.4.1;/nix/store/0yb348p728w89n3rqa4n2rhwqhyccxgz-ros-noetic-rosmsg-1.16.0-r1;/nix/store/frm1i0g8m47r631r6dhsyqnsz3piczf5-ros-noetic-rosnode-1.16.0-r1;/nix/store/kdwdz2rssm8why8xv0g08ap14b264bdh-ros-noetic-rostopic-1.16.0-r1;/nix/store/1xq1jq1hl8zsidgbl9i1v46q1mv3p1bh-ros-noetic-rosservice-1.16.0-r1;/nix/store/2amhnbrxvslby42nczz57jq1zc0s3ral-ros-noetic-rostest-1.16.0-r1;/nix/store/yjaw4gagak3rjn7plc37xsvanxaf00v7-ros-noetic-roswtf-1.16.0-r1;/nix/store/m4j4i5vrhsx2hvv6ql7qx39w3dk8gqjh-ros-noetic-rosconsole-bridge-0.5.4-r1;/nix/store/jmv32zda83d73ym2yw3q5ngzmkbvqz23-ros-noetic-roscpp-core-0.7.3-r1;/nix/store/44pqwx8bjngjpkbk1y2dd8pzs49s14w9-patchelf-0.15.0;/nix/store/a82kpq668k0iqj8qwcsfg5qfys24zpc1-update-autotools-gnu-config-scripts-hook;/nix/store/khkhbch4p1wjfl1g89gw1mszvvr7bzv0-gcc-wrapper-13.2.0;/nix/store/6zhs433c4cyaih7l65c11zm743sava5a-binutils-wrapper-2.40'.split(';')
        else:
            # don't consider any other prefix path than this one
            CMAKE_PREFIX_PATH = []
        # prepend current workspace if not already part of CPP
        base_path = os.path.dirname(__file__)
        # CMAKE_PREFIX_PATH uses forward slash on all platforms, but __file__ is platform dependent
        # base_path on Windows contains backward slashes, need to be converted to forward slashes before comparison
        if os.path.sep != '/':
            base_path = base_path.replace(os.path.sep, '/')

        if base_path not in CMAKE_PREFIX_PATH:
            CMAKE_PREFIX_PATH.insert(0, base_path)
        CMAKE_PREFIX_PATH = os.pathsep.join(CMAKE_PREFIX_PATH)

        environ = dict(os.environ)
        lines = []
        if not args.extend:
            lines += rollback_env_variables(environ, ENV_VAR_SUBFOLDERS)
        lines += prepend_env_variables(environ, ENV_VAR_SUBFOLDERS, CMAKE_PREFIX_PATH)
        lines += find_env_hooks(environ, CMAKE_PREFIX_PATH)
        print('\n'.join(lines))

        # need to explicitly flush the output
        sys.stdout.flush()
    except IOError as e:
        # and catch potential "broken pipe" if stdout is not writable
        # which can happen when piping the output to a file but the disk is full
        if e.errno == errno.EPIPE:
            print(e, file=sys.stderr)
            sys.exit(2)
        raise

    sys.exit(0)
