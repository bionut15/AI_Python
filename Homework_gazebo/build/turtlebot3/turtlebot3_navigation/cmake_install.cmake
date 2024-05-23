# Install script for directory: /home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/src/turtlebot3/turtlebot3_navigation

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/turtlebot3/turtlebot3_navigation/catkin_generated/installspace/turtlebot3_navigation.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot3_navigation/cmake" TYPE FILE FILES
    "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/turtlebot3/turtlebot3_navigation/catkin_generated/installspace/turtlebot3_navigationConfig.cmake"
    "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/turtlebot3/turtlebot3_navigation/catkin_generated/installspace/turtlebot3_navigationConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot3_navigation" TYPE FILE FILES "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/src/turtlebot3/turtlebot3_navigation/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/turtlebot3_navigation" TYPE DIRECTORY FILES
    "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/src/turtlebot3/turtlebot3_navigation/launch"
    "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/src/turtlebot3/turtlebot3_navigation/maps"
    "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/src/turtlebot3/turtlebot3_navigation/param"
    "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/src/turtlebot3/turtlebot3_navigation/rviz"
    )
endif()

