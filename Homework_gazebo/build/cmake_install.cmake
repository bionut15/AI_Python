# Install script for directory: /home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/src

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
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/install" TYPE PROGRAM FILES "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/catkin_generated/installspace/_setup_util.py")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/install" TYPE PROGRAM FILES "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/catkin_generated/installspace/env.sh")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/install/setup.bash;/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/install" TYPE FILE FILES
    "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/catkin_generated/installspace/setup.bash"
    "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/catkin_generated/installspace/local_setup.bash"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/install/setup.sh;/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/install" TYPE FILE FILES
    "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/catkin_generated/installspace/setup.sh"
    "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/catkin_generated/installspace/local_setup.sh"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/install/setup.zsh;/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/install" TYPE FILE FILES
    "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/catkin_generated/installspace/setup.zsh"
    "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/install" TYPE FILE FILES "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/turtlebot3/turtlebot3/cmake_install.cmake")
  include("/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/turtlebot3_msgs/cmake_install.cmake")
  include("/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/turtlebot3/turtlebot3_navigation/cmake_install.cmake")
  include("/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/turtlebot3_simulations/turtlebot3_simulations/cmake_install.cmake")
  include("/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/turtlebot3/turtlebot3_bringup/cmake_install.cmake")
  include("/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/turtlebot3/turtlebot3_example/cmake_install.cmake")
  include("/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/turtlebot3_simulations/turtlebot3_fake/cmake_install.cmake")
  include("/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/turtlebot3_simulations/turtlebot3_gazebo/cmake_install.cmake")
  include("/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/turtlebot3/turtlebot3_slam/cmake_install.cmake")
  include("/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/turtlebot3/turtlebot3_teleop/cmake_install.cmake")
  include("/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/wall_follower/cmake_install.cmake")
  include("/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/turtlebot3/turtlebot3_description/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
