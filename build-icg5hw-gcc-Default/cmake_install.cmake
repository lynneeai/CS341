# Install script for directory: /Users/Lynnee/Documents/Lynnee/EPFL/Courses/CS-341 Computer Graphics/CS341/icg5hw

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
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

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/Lynnee/Documents/Lynnee/EPFL/Courses/CS-341 Computer Graphics/CS341/build-icg5hw-gcc-Default/hw5p1_fastsmooth/cmake_install.cmake")
  include("/Users/Lynnee/Documents/Lynnee/EPFL/Courses/CS-341 Computer Graphics/CS341/build-icg5hw-gcc-Default/hw5p2_mirrorfloor/cmake_install.cmake")
  include("/Users/Lynnee/Documents/Lynnee/EPFL/Courses/CS-341 Computer Graphics/CS341/build-icg5hw-gcc-Default/hw5p3_motionblur/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/Users/Lynnee/Documents/Lynnee/EPFL/Courses/CS-341 Computer Graphics/CS341/build-icg5hw-gcc-Default/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")