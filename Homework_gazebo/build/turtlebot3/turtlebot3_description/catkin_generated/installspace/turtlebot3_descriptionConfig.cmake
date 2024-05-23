# generated from catkin/cmake/template/pkgConfig.cmake.in

# append elements to a list and remove existing duplicates from the list
# copied from catkin/cmake/list_append_deduplicate.cmake to keep pkgConfig
# self contained
macro(_list_append_deduplicate listname)
  if(NOT "${ARGN}" STREQUAL "")
    if(${listname})
      list(REMOVE_ITEM ${listname} ${ARGN})
    endif()
    list(APPEND ${listname} ${ARGN})
  endif()
endmacro()

# append elements to a list if they are not already in the list
# copied from catkin/cmake/list_append_unique.cmake to keep pkgConfig
# self contained
macro(_list_append_unique listname)
  foreach(_item ${ARGN})
    list(FIND ${listname} ${_item} _index)
    if(_index EQUAL -1)
      list(APPEND ${listname} ${_item})
    endif()
  endforeach()
endmacro()

# pack a list of libraries with optional build configuration keywords
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_pack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  set(_argn ${ARGN})
  list(LENGTH _argn _count)
  set(_index 0)
  while(${_index} LESS ${_count})
    list(GET _argn ${_index} lib)
    if("${lib}" MATCHES "^(debug|optimized|general)$")
      math(EXPR _index "${_index} + 1")
      if(${_index} EQUAL ${_count})
        message(FATAL_ERROR "_pack_libraries_with_build_configuration() the list of libraries '${ARGN}' ends with '${lib}' which is a build configuration keyword and must be followed by a library")
      endif()
      list(GET _argn ${_index} library)
      list(APPEND ${VAR} "${lib}${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}${library}")
    else()
      list(APPEND ${VAR} "${lib}")
    endif()
    math(EXPR _index "${_index} + 1")
  endwhile()
endmacro()

# unpack a list of libraries with optional build configuration keyword prefixes
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_unpack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  foreach(lib ${ARGN})
    string(REGEX REPLACE "^(debug|optimized|general)${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}(.+)$" "\\1;\\2" lib "${lib}")
    list(APPEND ${VAR} "${lib}")
  endforeach()
endmacro()


if(turtlebot3_description_CONFIG_INCLUDED)
  return()
endif()
set(turtlebot3_description_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("FALSE" STREQUAL "TRUE")
  set(turtlebot3_description_SOURCE_PREFIX /home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/src/turtlebot3/turtlebot3_description)
  set(turtlebot3_description_DEVEL_PREFIX /home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/devel)
  set(turtlebot3_description_INSTALL_PREFIX "")
  set(turtlebot3_description_PREFIX ${turtlebot3_description_DEVEL_PREFIX})
else()
  set(turtlebot3_description_SOURCE_PREFIX "")
  set(turtlebot3_description_DEVEL_PREFIX "")
  set(turtlebot3_description_INSTALL_PREFIX /home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/install)
  set(turtlebot3_description_PREFIX ${turtlebot3_description_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'turtlebot3_description' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(turtlebot3_description_FOUND_CATKIN_PROJECT TRUE)

if(NOT " " STREQUAL " ")
  set(turtlebot3_description_INCLUDE_DIRS "")
  set(_include_dirs "")
  if(NOT "https://github.com/ROBOTIS-GIT/turtlebot3/issues " STREQUAL " ")
    set(_report "Check the issue tracker 'https://github.com/ROBOTIS-GIT/turtlebot3/issues' and consider creating a ticket if the problem has not been reported yet.")
  elseif(NOT "http://wiki.ros.org/turtlebot3_description " STREQUAL " ")
    set(_report "Check the website 'http://wiki.ros.org/turtlebot3_description' for information and consider reporting the problem.")
  else()
    set(_report "Report the problem to the maintainer 'Will Son <willson@robotis.com>' and request to fix the problem.")
  endif()
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir} " STREQUAL "include ")
      get_filename_component(include "${turtlebot3_description_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'turtlebot3_description' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  ${_report}")
      endif()
    else()
      message(FATAL_ERROR "Project 'turtlebot3_description' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '\${prefix}/${idir}'.  ${_report}")
    endif()
    _list_append_unique(turtlebot3_description_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^(debug|optimized|general)$")
    list(APPEND turtlebot3_description_LIBRARIES ${library})
  elseif(${library} MATCHES "^-l")
    list(APPEND turtlebot3_description_LIBRARIES ${library})
  elseif(${library} MATCHES "^-")
    # This is a linker flag/option (like -pthread)
    # There's no standard variable for these, so create an interface library to hold it
    if(NOT turtlebot3_description_NUM_DUMMY_TARGETS)
      set(turtlebot3_description_NUM_DUMMY_TARGETS 0)
    endif()
    # Make sure the target name is unique
    set(interface_target_name "catkin::turtlebot3_description::wrapped-linker-option${turtlebot3_description_NUM_DUMMY_TARGETS}")
    while(TARGET "${interface_target_name}")
      math(EXPR turtlebot3_description_NUM_DUMMY_TARGETS "${turtlebot3_description_NUM_DUMMY_TARGETS}+1")
      set(interface_target_name "catkin::turtlebot3_description::wrapped-linker-option${turtlebot3_description_NUM_DUMMY_TARGETS}")
    endwhile()
    add_library("${interface_target_name}" INTERFACE IMPORTED)
    if("${CMAKE_VERSION}" VERSION_LESS "3.13.0")
      set_property(
        TARGET
        "${interface_target_name}"
        APPEND PROPERTY
        INTERFACE_LINK_LIBRARIES "${library}")
    else()
      target_link_options("${interface_target_name}" INTERFACE "${library}")
    endif()
    list(APPEND turtlebot3_description_LIBRARIES "${interface_target_name}")
  elseif(TARGET ${library})
    list(APPEND turtlebot3_description_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND turtlebot3_description_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/install/lib;/nix/store/v7gamjkjhkqkxd9dc827wshnhszgvflm-ros-noetic-turtlesim-0.10.2-r1/lib;/nix/store/kc3pl0aly2nrjmqq5ccnawwvhga7my17-ros-noetic-geometry-msgs-1.13.1-r1/lib;/nix/store/gpxkf984w0990hjr324jb6nza18j7kzl-ros-noetic-message-runtime-0.4.13-r1/lib;/nix/store/ap8sw25invfbkb6f2wrs48md52slxr4r-ros-noetic-cpp-common-0.7.3-r1/lib;/nix/store/9qjwx2qsf5r1lqw7bhzxkvdx2am5x5vl-ros-noetic-genpy-0.6.15-r1/lib;/nix/store/qjislxf6xd8crx106x912kk9majkiifa-ros-noetic-genmsg-0.6.0-r1/lib;/nix/store/pnn4anan4vqbcjzf8r5yrbx655vdsfnd-ros-noetic-catkin-0.8.10-r1/lib;/nix/store/jdfkajvz7qhdyrvrs1jh4zx50mzlr1jl-ros-noetic-roscpp-serialization-0.7.3-r1/lib;/nix/store/jjsphljrxqfjss2d5jy75zipcpln17k5-ros-noetic-roscpp-traits-0.7.3-r1/lib;/nix/store/id072szbyyjb6bwak7jcc4dvas76bfm6-ros-noetic-rostime-0.7.3-r1/lib;/nix/store/m1hc2f59d6bybk1mp6g59wsxnavvarrh-ros-noetic-std-msgs-0.5.13-r1/lib;/nix/store/lihrmbh39fkhj4mbmh5w3skm5chnz6g3-ros-noetic-rosconsole-1.14.3-r1/lib;/nix/store/m6qi4sg28bdl1a6avc8zrc7p9bf9mmxh-ros-noetic-rosbuild-1.15.8-r1/lib;/nix/store/l2mxm49gdg6wm0d00ck4jfchmpf7kavj-ros-noetic-message-generation-0.4.1-r1/lib;/nix/store/zchp1a8axyblm6pck2p1hdzkag57mdx9-ros-noetic-gencpp-0.7.0-r1/lib;/nix/store/6dbw0hpdb8h4izidkvgd28byrd9q4jrh-ros-noetic-geneus-3.0.0-r1/lib;/nix/store/h29x6i311xb1yg69i7hhrannrz8yvwbi-ros-noetic-genlisp-0.4.18-r1/lib;/nix/store/mvqksyprrrhvf7810zsx76c0kvw6x8zi-ros-noetic-gennodejs-2.0.2-r1/lib;/nix/store/3wabmag91va0i32iyyrgq2j9s065r1xc-ros-noetic-roscpp-1.16.0-r1/lib;/nix/store/bg2d7cip95dv553ilincq5s6jyx6a5n6-ros-noetic-rosgraph-msgs-1.11.3-r1/lib;/nix/store/zpv9kigr75lh1x9hxxzv39abniwg5zsi-ros-noetic-xmlrpcpp-1.16.0-r1/lib;/nix/store/wdim7acrhwzcfbx1sp0mxl7fpqzk1ls6-ros-noetic-roslib-1.15.8-r1/lib;/nix/store/4w3b5l5rr7daiga9zcsk2cj0wjmxnm2g-ros-noetic-ros-environment-1.3.2-r1/lib;/nix/store/zs0agvdca33mvh827wjkn20vpiyfv45n-ros-noetic-rospack-2.6.2-r1/lib;/nix/store/142gghbqfvjc14y96cpncz1mkzwxxm0p-ros-noetic-std-srvs-1.11.3-r1/lib;/nix/store/is6mwgln824f4b1cxs55343glncpz3rv-ros-noetic-ros-core-1.5.0-r1/lib;/nix/store/5n5nfxqi893qfy31aaw15h91w5mpdhka-ros-noetic-class-loader-0.5.0-r1/lib;/nix/store/8dyx46hk47q47gbswm7v4n3rywiyzvdm-ros-noetic-cmake-modules-0.5.0-r1/lib;/nix/store/a86k7z0m8jl07ixxll5a120501agsqq8-ros-noetic-common-msgs-1.13.1-r1/lib;/nix/store/ha00xryl25b0yf7isqspvivimiqgv4fz-ros-noetic-actionlib-msgs-1.13.1-r1/lib;/nix/store/54q488f8ar7qx2xycy85vkwz8zmj97yy-ros-noetic-diagnostic-msgs-1.13.1-r1/lib;/nix/store/14ch7h2csl95m8y3245xymp44nqn1gc4-ros-noetic-nav-msgs-1.13.1-r1/lib;/nix/store/i7skmnnjv6k1lzld41k93bwif0r39jbc-ros-noetic-sensor-msgs-1.13.1-r1/lib;/nix/store/0zbfw16hxn495yngabqn9v9h9l6vl9pa-ros-noetic-shape-msgs-1.13.1-r1/lib;/nix/store/3ip42x7fyfg360pcskq3sxiw4did7and-ros-noetic-stereo-msgs-1.13.1-r1/lib;/nix/store/lacq0hzcvl5qkza1zl21i399zvixhlbn-ros-noetic-trajectory-msgs-1.13.1-r1/lib;/nix/store/k0abqqn1gjr0aar70ybskxidsxangjj0-ros-noetic-rosbag-migration-rule-1.0.1-r1/lib;/nix/store/6x9lz0j0dnzprjxx9g4gnnpbgkwlgq7m-ros-noetic-visualization-msgs-1.13.1-r1/lib;/nix/store/kzwnclg9cq50fniix4drzc3jxmvrk364-ros-noetic-pluginlib-1.13.0-r1/lib;/nix/store/qhcxqhkpz20aisyhphdpqq8479gzrqh0-ros-noetic-ros-1.15.8-r1/lib;/nix/store/y9za0zaf10f8fwpg7g5mmzh6ww6qai5d-ros-noetic-mk-1.15.8-r1/lib;/nix/store/lv39i0533x83r5avrb0qwgr6znci8gk2-ros-noetic-rosbash-1.15.8-r1/lib;/nix/store/kafkapc1p5ss8aakr85rddlwgp9pa2yw-ros-noetic-rosboost-cfg-1.15.8-r1/lib;/nix/store/9bxyih89z069kgrk8siwnc270qznxvhb-ros-noetic-rosclean-1.15.8-r1/lib;/nix/store/92ljzaxyf5hl3bdwvcgzvii1frgjarzg-ros-noetic-roscreate-1.15.8-r1/lib;/nix/store/rk3bgqgvd42wc45ry3kc60lbgr45s93g-ros-noetic-roslang-1.15.8-r1/lib;/nix/store/hs5qzql2abhlk9fl4qzsr4yf2azgphdr-ros-noetic-rosmake-1.15.8-r1/lib;/nix/store/qhvf7cg8yq2hrycd1gabdy5y7386jfrj-ros-noetic-rosunit-1.15.8-r1/lib;/nix/store/ryw4ryivjfiq6md5gjlhxxlxfpx9n3km-ros-noetic-ros-comm-1.16.0-r1/lib;/nix/store/1rgfv555gz95jnh59g148d7bjd1r0a3s-ros-noetic-message-filters-1.16.0-r1/lib;/nix/store/b0hzhsc3awzkzasc5c9zib177615bjga-ros-noetic-rosbag-1.16.0-r1/lib;/nix/store/av2xkcgc7bnyzrg0gk0vp5pbx7731j1l-ros-noetic-rosbag-storage-1.16.0-r1/lib;/nix/store/kpk48v94fzvxz0lmn833vygjys6zllfb-ros-noetic-roslz4-1.16.0-r1/lib;/nix/store/j289720fr7myvzpi95jdh0x3b4ra8nzg-ros-noetic-rospy-1.16.0-r1/lib;/nix/store/397yqw9lhr1w5gl12ywa5j3cf8ay6rlj-ros-noetic-rosgraph-1.16.0-r1/lib;/nix/store/yygf4jxqjnkmzl99a69fxa84yhcj5009-ros-noetic-topic-tools-1.16.0-r1/lib;/nix/store/9phv73i51jzyidsha689z4pqs07lnhq7-ros-noetic-roslaunch-1.16.0-r1/lib;/nix/store/ylq48s0ibxkqyb1g98sxv232fmrk6xxd-ros-noetic-rosmaster-1.16.0-r1/lib;/nix/store/by4danw92ma77qzaazqm4yz4rd2xi3g7-ros-noetic-rosout-1.16.0-r1/lib;/nix/store/qhja98fhcgh2q51gsg3bkqkzrv9l4q6f-ros-noetic-rosparam-1.16.0-r1/lib;/nix/store/jp59k6d7vkg3xhn92shljnfs409p7asr-ros-noetic-roslisp-1.9.25-r1/lib;/nix/store/0yb348p728w89n3rqa4n2rhwqhyccxgz-ros-noetic-rosmsg-1.16.0-r1/lib;/nix/store/frm1i0g8m47r631r6dhsyqnsz3piczf5-ros-noetic-rosnode-1.16.0-r1/lib;/nix/store/kdwdz2rssm8why8xv0g08ap14b264bdh-ros-noetic-rostopic-1.16.0-r1/lib;/nix/store/1xq1jq1hl8zsidgbl9i1v46q1mv3p1bh-ros-noetic-rosservice-1.16.0-r1/lib;/nix/store/2amhnbrxvslby42nczz57jq1zc0s3ral-ros-noetic-rostest-1.16.0-r1/lib;/nix/store/yjaw4gagak3rjn7plc37xsvanxaf00v7-ros-noetic-roswtf-1.16.0-r1/lib;/nix/store/m4j4i5vrhsx2hvv6ql7qx39w3dk8gqjh-ros-noetic-rosconsole-bridge-0.5.4-r1/lib;/nix/store/jmv32zda83d73ym2yw3q5ngzmkbvqz23-ros-noetic-roscpp-core-0.7.3-r1/lib;/nix/store/lh07n6vrpdq4zb11z65xd6gakfrjfflb-ros-noetic-gazebo-ros-2.9.2-r1/lib;/nix/store/q5wsdmk4bdi2abs7w22y4wgjhpwjjvlp-ros-noetic-dynamic-reconfigure-1.7.3-r1/lib;/nix/store/1frx2zg6p0gprxs6ij6bb3k9dxdspvdk-ros-noetic-gazebo-dev-2.9.2-r1/lib;/nix/store/g4mlb73bc62cp70rh971iwz6h75cw1c0-ros-noetic-gazebo-msgs-2.9.2-r1/lib;/nix/store/fwffiq2g2cb40g97ixiiy5kd1bxlpxma-ros-noetic-tf-1.13.2-r1/lib;/nix/store/m92hq5wk63mc3hyqdzqakh3sp3xismjm-ros-noetic-tf2-ros-0.7.7-r1/lib;/nix/store/zkajvv8scsynfjxviv285y4cpyfa375n-ros-noetic-actionlib-1.14.0-r1/lib;/nix/store/adzwaxz3cxdpsl4whc384c328407wr2l-ros-noetic-tf2-0.7.7-r1/lib;/nix/store/xfp843kn5fzxmy4qx8ishbc9x5nwf6g8-ros-noetic-tf2-msgs-0.7.7-r1/lib;/nix/store/zmibrk49fcwifxr37pmclgcdvyhjhax5-ros-noetic-tf2-py-0.7.7-r1/lib;/nix/store/y568wx0xfvjzh9q3ylgqxc902jpcfnnl-ros-noetic-urdf-1.13.2-r1/lib;/nix/store/zi6qs8xbvdgj8bj6kls1s0kssc2p2qby-ros-noetic-interactive-markers-1.12.0-r1/lib;/nix/store/l41ry1m2kc7xrgmvkxqc0x1cqk32qb0y-ros-noetic-tf2-geometry-msgs-0.7.7-r1/lib;/nix/store/4m6jn0w4jh8wgziz9w9sr7z1rdx673s8-ros-noetic-xacro-1.14.18-r1/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(turtlebot3_description_LIBRARY_DIRS ${lib_path})
      list(APPEND turtlebot3_description_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'turtlebot3_description'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND turtlebot3_description_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(turtlebot3_description_EXPORTED_TARGETS "")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${turtlebot3_description_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "urdf;xacro")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 turtlebot3_description_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${turtlebot3_description_dep}_FOUND)
      find_package(${turtlebot3_description_dep} REQUIRED NO_MODULE)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${turtlebot3_description_dep} REQUIRED NO_MODULE ${depend_list})
  endif()
  _list_append_unique(turtlebot3_description_INCLUDE_DIRS ${${turtlebot3_description_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(turtlebot3_description_LIBRARIES ${turtlebot3_description_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${turtlebot3_description_dep}_LIBRARIES})
  _list_append_deduplicate(turtlebot3_description_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(turtlebot3_description_LIBRARIES ${turtlebot3_description_LIBRARIES})

  _list_append_unique(turtlebot3_description_LIBRARY_DIRS ${${turtlebot3_description_dep}_LIBRARY_DIRS})
  _list_append_deduplicate(turtlebot3_description_EXPORTED_TARGETS ${${turtlebot3_description_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${turtlebot3_description_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
