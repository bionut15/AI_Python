# Install script for directory: /home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/src/turtlebot3_simulations/turtlebot3_fake

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/nix/store/khkhbch4p1wjfl1g89gw1mszvvr7bzv0-gcc-wrapper-13.2.0/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/turtlebot3_simulations/turtlebot3_fake/catkin_generated/installspace/turtlebot3_fake.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot3_fake/cmake" TYPE FILE FILES
    "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/turtlebot3_simulations/turtlebot3_fake/catkin_generated/installspace/turtlebot3_fakeConfig.cmake"
    "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/turtlebot3_simulations/turtlebot3_fake/catkin_generated/installspace/turtlebot3_fakeConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot3_fake" TYPE FILE FILES "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/src/turtlebot3_simulations/turtlebot3_fake/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot3_fake/turtlebot3_fake_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot3_fake/turtlebot3_fake_node")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot3_fake/turtlebot3_fake_node"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/turtlebot3_fake" TYPE EXECUTABLE FILES "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/devel/lib/turtlebot3_fake/turtlebot3_fake_node")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot3_fake/turtlebot3_fake_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot3_fake/turtlebot3_fake_node")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot3_fake/turtlebot3_fake_node"
         OLD_RPATH "/nix/store/fwffiq2g2cb40g97ixiiy5kd1bxlpxma-ros-noetic-tf-1.13.2-r1/lib:/nix/store/m92hq5wk63mc3hyqdzqakh3sp3xismjm-ros-noetic-tf2-ros-0.7.7-r1/lib:/nix/store/zkajvv8scsynfjxviv285y4cpyfa375n-ros-noetic-actionlib-1.14.0-r1/lib:/nix/store/adzwaxz3cxdpsl4whc384c328407wr2l-ros-noetic-tf2-0.7.7-r1/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/nix/store/khkhbch4p1wjfl1g89gw1mszvvr7bzv0-gcc-wrapper-13.2.0/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/turtlebot3_fake/turtlebot3_fake_node")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/turtlebot3_fake" TYPE DIRECTORY FILES "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/src/turtlebot3_simulations/turtlebot3_fake/include/turtlebot3_fake/")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot3_fake" TYPE DIRECTORY FILES
    "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/src/turtlebot3_simulations/turtlebot3_fake/launch"
    "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/src/turtlebot3_simulations/turtlebot3_fake/rviz"
    )
endif()

