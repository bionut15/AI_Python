# generated from catkin/cmake/template/order_packages.context.py.in
source_root_dir = '/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/src'
whitelisted_packages = ''.split(';') if '' != '' else []
blacklisted_packages = ''.split(';') if '' != '' else []
underlay_workspaces = '/nix/store/v7gamjkjhkqkxd9dc827wshnhszgvflm-ros-noetic-turtlesim-0.10.2-r1;/nix/store/kc3pl0aly2nrjmqq5ccnawwvhga7my17-ros-noetic-geometry-msgs-1.13.1-r1;/nix/store/gpxkf984w0990hjr324jb6nza18j7kzl-ros-noetic-message-runtime-0.4.13-r1;/nix/store/ap8sw25invfbkb6f2wrs48md52slxr4r-ros-noetic-cpp-common-0.7.3-r1;/nix/store/9qjwx2qsf5r1lqw7bhzxkvdx2am5x5vl-ros-noetic-genpy-0.6.15-r1;/nix/store/qjislxf6xd8crx106x912kk9majkiifa-ros-noetic-genmsg-0.6.0-r1;/nix/store/pnn4anan4vqbcjzf8r5yrbx655vdsfnd-ros-noetic-catkin-0.8.10-r1;/nix/store/jdfkajvz7qhdyrvrs1jh4zx50mzlr1jl-ros-noetic-roscpp-serialization-0.7.3-r1;/nix/store/jjsphljrxqfjss2d5jy75zipcpln17k5-ros-noetic-roscpp-traits-0.7.3-r1;/nix/store/id072szbyyjb6bwak7jcc4dvas76bfm6-ros-noetic-rostime-0.7.3-r1;/nix/store/m1hc2f59d6bybk1mp6g59wsxnavvarrh-ros-noetic-std-msgs-0.5.13-r1;/nix/store/lihrmbh39fkhj4mbmh5w3skm5chnz6g3-ros-noetic-rosconsole-1.14.3-r1;/nix/store/m6qi4sg28bdl1a6avc8zrc7p9bf9mmxh-ros-noetic-rosbuild-1.15.8-r1;/nix/store/l2mxm49gdg6wm0d00ck4jfchmpf7kavj-ros-noetic-message-generation-0.4.1-r1;/nix/store/zchp1a8axyblm6pck2p1hdzkag57mdx9-ros-noetic-gencpp-0.7.0-r1;/nix/store/6dbw0hpdb8h4izidkvgd28byrd9q4jrh-ros-noetic-geneus-3.0.0-r1;/nix/store/h29x6i311xb1yg69i7hhrannrz8yvwbi-ros-noetic-genlisp-0.4.18-r1;/nix/store/mvqksyprrrhvf7810zsx76c0kvw6x8zi-ros-noetic-gennodejs-2.0.2-r1;/nix/store/3wabmag91va0i32iyyrgq2j9s065r1xc-ros-noetic-roscpp-1.16.0-r1;/nix/store/bg2d7cip95dv553ilincq5s6jyx6a5n6-ros-noetic-rosgraph-msgs-1.11.3-r1;/nix/store/zpv9kigr75lh1x9hxxzv39abniwg5zsi-ros-noetic-xmlrpcpp-1.16.0-r1;/nix/store/wdim7acrhwzcfbx1sp0mxl7fpqzk1ls6-ros-noetic-roslib-1.15.8-r1;/nix/store/4w3b5l5rr7daiga9zcsk2cj0wjmxnm2g-ros-noetic-ros-environment-1.3.2-r1;/nix/store/zs0agvdca33mvh827wjkn20vpiyfv45n-ros-noetic-rospack-2.6.2-r1;/nix/store/142gghbqfvjc14y96cpncz1mkzwxxm0p-ros-noetic-std-srvs-1.11.3-r1;/nix/store/is6mwgln824f4b1cxs55343glncpz3rv-ros-noetic-ros-core-1.5.0-r1;/nix/store/5n5nfxqi893qfy31aaw15h91w5mpdhka-ros-noetic-class-loader-0.5.0-r1;/nix/store/8dyx46hk47q47gbswm7v4n3rywiyzvdm-ros-noetic-cmake-modules-0.5.0-r1;/nix/store/a86k7z0m8jl07ixxll5a120501agsqq8-ros-noetic-common-msgs-1.13.1-r1;/nix/store/ha00xryl25b0yf7isqspvivimiqgv4fz-ros-noetic-actionlib-msgs-1.13.1-r1;/nix/store/54q488f8ar7qx2xycy85vkwz8zmj97yy-ros-noetic-diagnostic-msgs-1.13.1-r1;/nix/store/14ch7h2csl95m8y3245xymp44nqn1gc4-ros-noetic-nav-msgs-1.13.1-r1;/nix/store/i7skmnnjv6k1lzld41k93bwif0r39jbc-ros-noetic-sensor-msgs-1.13.1-r1;/nix/store/0zbfw16hxn495yngabqn9v9h9l6vl9pa-ros-noetic-shape-msgs-1.13.1-r1;/nix/store/3ip42x7fyfg360pcskq3sxiw4did7and-ros-noetic-stereo-msgs-1.13.1-r1;/nix/store/lacq0hzcvl5qkza1zl21i399zvixhlbn-ros-noetic-trajectory-msgs-1.13.1-r1;/nix/store/k0abqqn1gjr0aar70ybskxidsxangjj0-ros-noetic-rosbag-migration-rule-1.0.1-r1;/nix/store/6x9lz0j0dnzprjxx9g4gnnpbgkwlgq7m-ros-noetic-visualization-msgs-1.13.1-r1;/nix/store/kzwnclg9cq50fniix4drzc3jxmvrk364-ros-noetic-pluginlib-1.13.0-r1;/nix/store/qhcxqhkpz20aisyhphdpqq8479gzrqh0-ros-noetic-ros-1.15.8-r1;/nix/store/y9za0zaf10f8fwpg7g5mmzh6ww6qai5d-ros-noetic-mk-1.15.8-r1;/nix/store/lv39i0533x83r5avrb0qwgr6znci8gk2-ros-noetic-rosbash-1.15.8-r1;/nix/store/kafkapc1p5ss8aakr85rddlwgp9pa2yw-ros-noetic-rosboost-cfg-1.15.8-r1;/nix/store/9bxyih89z069kgrk8siwnc270qznxvhb-ros-noetic-rosclean-1.15.8-r1;/nix/store/92ljzaxyf5hl3bdwvcgzvii1frgjarzg-ros-noetic-roscreate-1.15.8-r1;/nix/store/rk3bgqgvd42wc45ry3kc60lbgr45s93g-ros-noetic-roslang-1.15.8-r1;/nix/store/hs5qzql2abhlk9fl4qzsr4yf2azgphdr-ros-noetic-rosmake-1.15.8-r1;/nix/store/qhvf7cg8yq2hrycd1gabdy5y7386jfrj-ros-noetic-rosunit-1.15.8-r1;/nix/store/ryw4ryivjfiq6md5gjlhxxlxfpx9n3km-ros-noetic-ros-comm-1.16.0-r1;/nix/store/1rgfv555gz95jnh59g148d7bjd1r0a3s-ros-noetic-message-filters-1.16.0-r1;/nix/store/b0hzhsc3awzkzasc5c9zib177615bjga-ros-noetic-rosbag-1.16.0-r1;/nix/store/av2xkcgc7bnyzrg0gk0vp5pbx7731j1l-ros-noetic-rosbag-storage-1.16.0-r1;/nix/store/kpk48v94fzvxz0lmn833vygjys6zllfb-ros-noetic-roslz4-1.16.0-r1;/nix/store/j289720fr7myvzpi95jdh0x3b4ra8nzg-ros-noetic-rospy-1.16.0-r1;/nix/store/397yqw9lhr1w5gl12ywa5j3cf8ay6rlj-ros-noetic-rosgraph-1.16.0-r1;/nix/store/yygf4jxqjnkmzl99a69fxa84yhcj5009-ros-noetic-topic-tools-1.16.0-r1;/nix/store/9phv73i51jzyidsha689z4pqs07lnhq7-ros-noetic-roslaunch-1.16.0-r1;/nix/store/ylq48s0ibxkqyb1g98sxv232fmrk6xxd-ros-noetic-rosmaster-1.16.0-r1;/nix/store/by4danw92ma77qzaazqm4yz4rd2xi3g7-ros-noetic-rosout-1.16.0-r1;/nix/store/qhja98fhcgh2q51gsg3bkqkzrv9l4q6f-ros-noetic-rosparam-1.16.0-r1;/nix/store/jp59k6d7vkg3xhn92shljnfs409p7asr-ros-noetic-roslisp-1.9.25-r1;/nix/store/0yb348p728w89n3rqa4n2rhwqhyccxgz-ros-noetic-rosmsg-1.16.0-r1;/nix/store/frm1i0g8m47r631r6dhsyqnsz3piczf5-ros-noetic-rosnode-1.16.0-r1;/nix/store/kdwdz2rssm8why8xv0g08ap14b264bdh-ros-noetic-rostopic-1.16.0-r1;/nix/store/1xq1jq1hl8zsidgbl9i1v46q1mv3p1bh-ros-noetic-rosservice-1.16.0-r1;/nix/store/2amhnbrxvslby42nczz57jq1zc0s3ral-ros-noetic-rostest-1.16.0-r1;/nix/store/yjaw4gagak3rjn7plc37xsvanxaf00v7-ros-noetic-roswtf-1.16.0-r1;/nix/store/m4j4i5vrhsx2hvv6ql7qx39w3dk8gqjh-ros-noetic-rosconsole-bridge-0.5.4-r1;/nix/store/jmv32zda83d73ym2yw3q5ngzmkbvqz23-ros-noetic-roscpp-core-0.7.3-r1;/nix/store/lh07n6vrpdq4zb11z65xd6gakfrjfflb-ros-noetic-gazebo-ros-2.9.2-r1;/nix/store/q5wsdmk4bdi2abs7w22y4wgjhpwjjvlp-ros-noetic-dynamic-reconfigure-1.7.3-r1;/nix/store/1frx2zg6p0gprxs6ij6bb3k9dxdspvdk-ros-noetic-gazebo-dev-2.9.2-r1;/nix/store/g4mlb73bc62cp70rh971iwz6h75cw1c0-ros-noetic-gazebo-msgs-2.9.2-r1;/nix/store/fwffiq2g2cb40g97ixiiy5kd1bxlpxma-ros-noetic-tf-1.13.2-r1;/nix/store/m92hq5wk63mc3hyqdzqakh3sp3xismjm-ros-noetic-tf2-ros-0.7.7-r1;/nix/store/zkajvv8scsynfjxviv285y4cpyfa375n-ros-noetic-actionlib-1.14.0-r1;/nix/store/adzwaxz3cxdpsl4whc384c328407wr2l-ros-noetic-tf2-0.7.7-r1;/nix/store/xfp843kn5fzxmy4qx8ishbc9x5nwf6g8-ros-noetic-tf2-msgs-0.7.7-r1;/nix/store/zmibrk49fcwifxr37pmclgcdvyhjhax5-ros-noetic-tf2-py-0.7.7-r1;/nix/store/y568wx0xfvjzh9q3ylgqxc902jpcfnnl-ros-noetic-urdf-1.13.2-r1;/nix/store/zi6qs8xbvdgj8bj6kls1s0kssc2p2qby-ros-noetic-interactive-markers-1.12.0-r1;/nix/store/l41ry1m2kc7xrgmvkxqc0x1cqk32qb0y-ros-noetic-tf2-geometry-msgs-0.7.7-r1;/nix/store/4m6jn0w4jh8wgziz9w9sr7z1rdx673s8-ros-noetic-xacro-1.14.18-r1'.split(';') if '/nix/store/v7gamjkjhkqkxd9dc827wshnhszgvflm-ros-noetic-turtlesim-0.10.2-r1;/nix/store/kc3pl0aly2nrjmqq5ccnawwvhga7my17-ros-noetic-geometry-msgs-1.13.1-r1;/nix/store/gpxkf984w0990hjr324jb6nza18j7kzl-ros-noetic-message-runtime-0.4.13-r1;/nix/store/ap8sw25invfbkb6f2wrs48md52slxr4r-ros-noetic-cpp-common-0.7.3-r1;/nix/store/9qjwx2qsf5r1lqw7bhzxkvdx2am5x5vl-ros-noetic-genpy-0.6.15-r1;/nix/store/qjislxf6xd8crx106x912kk9majkiifa-ros-noetic-genmsg-0.6.0-r1;/nix/store/pnn4anan4vqbcjzf8r5yrbx655vdsfnd-ros-noetic-catkin-0.8.10-r1;/nix/store/jdfkajvz7qhdyrvrs1jh4zx50mzlr1jl-ros-noetic-roscpp-serialization-0.7.3-r1;/nix/store/jjsphljrxqfjss2d5jy75zipcpln17k5-ros-noetic-roscpp-traits-0.7.3-r1;/nix/store/id072szbyyjb6bwak7jcc4dvas76bfm6-ros-noetic-rostime-0.7.3-r1;/nix/store/m1hc2f59d6bybk1mp6g59wsxnavvarrh-ros-noetic-std-msgs-0.5.13-r1;/nix/store/lihrmbh39fkhj4mbmh5w3skm5chnz6g3-ros-noetic-rosconsole-1.14.3-r1;/nix/store/m6qi4sg28bdl1a6avc8zrc7p9bf9mmxh-ros-noetic-rosbuild-1.15.8-r1;/nix/store/l2mxm49gdg6wm0d00ck4jfchmpf7kavj-ros-noetic-message-generation-0.4.1-r1;/nix/store/zchp1a8axyblm6pck2p1hdzkag57mdx9-ros-noetic-gencpp-0.7.0-r1;/nix/store/6dbw0hpdb8h4izidkvgd28byrd9q4jrh-ros-noetic-geneus-3.0.0-r1;/nix/store/h29x6i311xb1yg69i7hhrannrz8yvwbi-ros-noetic-genlisp-0.4.18-r1;/nix/store/mvqksyprrrhvf7810zsx76c0kvw6x8zi-ros-noetic-gennodejs-2.0.2-r1;/nix/store/3wabmag91va0i32iyyrgq2j9s065r1xc-ros-noetic-roscpp-1.16.0-r1;/nix/store/bg2d7cip95dv553ilincq5s6jyx6a5n6-ros-noetic-rosgraph-msgs-1.11.3-r1;/nix/store/zpv9kigr75lh1x9hxxzv39abniwg5zsi-ros-noetic-xmlrpcpp-1.16.0-r1;/nix/store/wdim7acrhwzcfbx1sp0mxl7fpqzk1ls6-ros-noetic-roslib-1.15.8-r1;/nix/store/4w3b5l5rr7daiga9zcsk2cj0wjmxnm2g-ros-noetic-ros-environment-1.3.2-r1;/nix/store/zs0agvdca33mvh827wjkn20vpiyfv45n-ros-noetic-rospack-2.6.2-r1;/nix/store/142gghbqfvjc14y96cpncz1mkzwxxm0p-ros-noetic-std-srvs-1.11.3-r1;/nix/store/is6mwgln824f4b1cxs55343glncpz3rv-ros-noetic-ros-core-1.5.0-r1;/nix/store/5n5nfxqi893qfy31aaw15h91w5mpdhka-ros-noetic-class-loader-0.5.0-r1;/nix/store/8dyx46hk47q47gbswm7v4n3rywiyzvdm-ros-noetic-cmake-modules-0.5.0-r1;/nix/store/a86k7z0m8jl07ixxll5a120501agsqq8-ros-noetic-common-msgs-1.13.1-r1;/nix/store/ha00xryl25b0yf7isqspvivimiqgv4fz-ros-noetic-actionlib-msgs-1.13.1-r1;/nix/store/54q488f8ar7qx2xycy85vkwz8zmj97yy-ros-noetic-diagnostic-msgs-1.13.1-r1;/nix/store/14ch7h2csl95m8y3245xymp44nqn1gc4-ros-noetic-nav-msgs-1.13.1-r1;/nix/store/i7skmnnjv6k1lzld41k93bwif0r39jbc-ros-noetic-sensor-msgs-1.13.1-r1;/nix/store/0zbfw16hxn495yngabqn9v9h9l6vl9pa-ros-noetic-shape-msgs-1.13.1-r1;/nix/store/3ip42x7fyfg360pcskq3sxiw4did7and-ros-noetic-stereo-msgs-1.13.1-r1;/nix/store/lacq0hzcvl5qkza1zl21i399zvixhlbn-ros-noetic-trajectory-msgs-1.13.1-r1;/nix/store/k0abqqn1gjr0aar70ybskxidsxangjj0-ros-noetic-rosbag-migration-rule-1.0.1-r1;/nix/store/6x9lz0j0dnzprjxx9g4gnnpbgkwlgq7m-ros-noetic-visualization-msgs-1.13.1-r1;/nix/store/kzwnclg9cq50fniix4drzc3jxmvrk364-ros-noetic-pluginlib-1.13.0-r1;/nix/store/qhcxqhkpz20aisyhphdpqq8479gzrqh0-ros-noetic-ros-1.15.8-r1;/nix/store/y9za0zaf10f8fwpg7g5mmzh6ww6qai5d-ros-noetic-mk-1.15.8-r1;/nix/store/lv39i0533x83r5avrb0qwgr6znci8gk2-ros-noetic-rosbash-1.15.8-r1;/nix/store/kafkapc1p5ss8aakr85rddlwgp9pa2yw-ros-noetic-rosboost-cfg-1.15.8-r1;/nix/store/9bxyih89z069kgrk8siwnc270qznxvhb-ros-noetic-rosclean-1.15.8-r1;/nix/store/92ljzaxyf5hl3bdwvcgzvii1frgjarzg-ros-noetic-roscreate-1.15.8-r1;/nix/store/rk3bgqgvd42wc45ry3kc60lbgr45s93g-ros-noetic-roslang-1.15.8-r1;/nix/store/hs5qzql2abhlk9fl4qzsr4yf2azgphdr-ros-noetic-rosmake-1.15.8-r1;/nix/store/qhvf7cg8yq2hrycd1gabdy5y7386jfrj-ros-noetic-rosunit-1.15.8-r1;/nix/store/ryw4ryivjfiq6md5gjlhxxlxfpx9n3km-ros-noetic-ros-comm-1.16.0-r1;/nix/store/1rgfv555gz95jnh59g148d7bjd1r0a3s-ros-noetic-message-filters-1.16.0-r1;/nix/store/b0hzhsc3awzkzasc5c9zib177615bjga-ros-noetic-rosbag-1.16.0-r1;/nix/store/av2xkcgc7bnyzrg0gk0vp5pbx7731j1l-ros-noetic-rosbag-storage-1.16.0-r1;/nix/store/kpk48v94fzvxz0lmn833vygjys6zllfb-ros-noetic-roslz4-1.16.0-r1;/nix/store/j289720fr7myvzpi95jdh0x3b4ra8nzg-ros-noetic-rospy-1.16.0-r1;/nix/store/397yqw9lhr1w5gl12ywa5j3cf8ay6rlj-ros-noetic-rosgraph-1.16.0-r1;/nix/store/yygf4jxqjnkmzl99a69fxa84yhcj5009-ros-noetic-topic-tools-1.16.0-r1;/nix/store/9phv73i51jzyidsha689z4pqs07lnhq7-ros-noetic-roslaunch-1.16.0-r1;/nix/store/ylq48s0ibxkqyb1g98sxv232fmrk6xxd-ros-noetic-rosmaster-1.16.0-r1;/nix/store/by4danw92ma77qzaazqm4yz4rd2xi3g7-ros-noetic-rosout-1.16.0-r1;/nix/store/qhja98fhcgh2q51gsg3bkqkzrv9l4q6f-ros-noetic-rosparam-1.16.0-r1;/nix/store/jp59k6d7vkg3xhn92shljnfs409p7asr-ros-noetic-roslisp-1.9.25-r1;/nix/store/0yb348p728w89n3rqa4n2rhwqhyccxgz-ros-noetic-rosmsg-1.16.0-r1;/nix/store/frm1i0g8m47r631r6dhsyqnsz3piczf5-ros-noetic-rosnode-1.16.0-r1;/nix/store/kdwdz2rssm8why8xv0g08ap14b264bdh-ros-noetic-rostopic-1.16.0-r1;/nix/store/1xq1jq1hl8zsidgbl9i1v46q1mv3p1bh-ros-noetic-rosservice-1.16.0-r1;/nix/store/2amhnbrxvslby42nczz57jq1zc0s3ral-ros-noetic-rostest-1.16.0-r1;/nix/store/yjaw4gagak3rjn7plc37xsvanxaf00v7-ros-noetic-roswtf-1.16.0-r1;/nix/store/m4j4i5vrhsx2hvv6ql7qx39w3dk8gqjh-ros-noetic-rosconsole-bridge-0.5.4-r1;/nix/store/jmv32zda83d73ym2yw3q5ngzmkbvqz23-ros-noetic-roscpp-core-0.7.3-r1;/nix/store/lh07n6vrpdq4zb11z65xd6gakfrjfflb-ros-noetic-gazebo-ros-2.9.2-r1;/nix/store/q5wsdmk4bdi2abs7w22y4wgjhpwjjvlp-ros-noetic-dynamic-reconfigure-1.7.3-r1;/nix/store/1frx2zg6p0gprxs6ij6bb3k9dxdspvdk-ros-noetic-gazebo-dev-2.9.2-r1;/nix/store/g4mlb73bc62cp70rh971iwz6h75cw1c0-ros-noetic-gazebo-msgs-2.9.2-r1;/nix/store/fwffiq2g2cb40g97ixiiy5kd1bxlpxma-ros-noetic-tf-1.13.2-r1;/nix/store/m92hq5wk63mc3hyqdzqakh3sp3xismjm-ros-noetic-tf2-ros-0.7.7-r1;/nix/store/zkajvv8scsynfjxviv285y4cpyfa375n-ros-noetic-actionlib-1.14.0-r1;/nix/store/adzwaxz3cxdpsl4whc384c328407wr2l-ros-noetic-tf2-0.7.7-r1;/nix/store/xfp843kn5fzxmy4qx8ishbc9x5nwf6g8-ros-noetic-tf2-msgs-0.7.7-r1;/nix/store/zmibrk49fcwifxr37pmclgcdvyhjhax5-ros-noetic-tf2-py-0.7.7-r1;/nix/store/y568wx0xfvjzh9q3ylgqxc902jpcfnnl-ros-noetic-urdf-1.13.2-r1;/nix/store/zi6qs8xbvdgj8bj6kls1s0kssc2p2qby-ros-noetic-interactive-markers-1.12.0-r1;/nix/store/l41ry1m2kc7xrgmvkxqc0x1cqk32qb0y-ros-noetic-tf2-geometry-msgs-0.7.7-r1;/nix/store/4m6jn0w4jh8wgziz9w9sr7z1rdx673s8-ros-noetic-xacro-1.14.18-r1' != '' else []
