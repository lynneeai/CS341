# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.2

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.2.3/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.2.3/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/wangmengjie/Desktop/graphics/icg2hw

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/wangmengjie/Desktop/graphics/icg2hw-build

# Utility rule file for copy_shaders_hw2p1_spiral.

# Include the progress variables for this target.
include hw2p1_spiral/CMakeFiles/copy_shaders_hw2p1_spiral.dir/progress.make

copy_shaders_hw2p1_spiral: hw2p1_spiral/CMakeFiles/copy_shaders_hw2p1_spiral.dir/build.make
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Copying /Users/wangmengjie/Desktop/graphics/icg2hw/hw2p1_spiral/triangle/triangle_vshader.glsl to build folder"
	cd /Users/wangmengjie/Desktop/graphics/icg2hw-build/hw2p1_spiral && /usr/local/Cellar/cmake/3.2.3/bin/cmake -E copy /Users/wangmengjie/Desktop/graphics/icg2hw/hw2p1_spiral/triangle/triangle_vshader.glsl /Users/wangmengjie/Desktop/graphics/icg2hw-build/hw2p1_spiral
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Copying /Users/wangmengjie/Desktop/graphics/icg2hw/hw2p1_spiral/triangle/triangle_fshader.glsl to build folder"
	cd /Users/wangmengjie/Desktop/graphics/icg2hw-build/hw2p1_spiral && /usr/local/Cellar/cmake/3.2.3/bin/cmake -E copy /Users/wangmengjie/Desktop/graphics/icg2hw/hw2p1_spiral/triangle/triangle_fshader.glsl /Users/wangmengjie/Desktop/graphics/icg2hw-build/hw2p1_spiral
.PHONY : copy_shaders_hw2p1_spiral

# Rule to build all files generated by this target.
hw2p1_spiral/CMakeFiles/copy_shaders_hw2p1_spiral.dir/build: copy_shaders_hw2p1_spiral
.PHONY : hw2p1_spiral/CMakeFiles/copy_shaders_hw2p1_spiral.dir/build

hw2p1_spiral/CMakeFiles/copy_shaders_hw2p1_spiral.dir/clean:
	cd /Users/wangmengjie/Desktop/graphics/icg2hw-build/hw2p1_spiral && $(CMAKE_COMMAND) -P CMakeFiles/copy_shaders_hw2p1_spiral.dir/cmake_clean.cmake
.PHONY : hw2p1_spiral/CMakeFiles/copy_shaders_hw2p1_spiral.dir/clean

hw2p1_spiral/CMakeFiles/copy_shaders_hw2p1_spiral.dir/depend:
	cd /Users/wangmengjie/Desktop/graphics/icg2hw-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/wangmengjie/Desktop/graphics/icg2hw /Users/wangmengjie/Desktop/graphics/icg2hw/hw2p1_spiral /Users/wangmengjie/Desktop/graphics/icg2hw-build /Users/wangmengjie/Desktop/graphics/icg2hw-build/hw2p1_spiral /Users/wangmengjie/Desktop/graphics/icg2hw-build/hw2p1_spiral/CMakeFiles/copy_shaders_hw2p1_spiral.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : hw2p1_spiral/CMakeFiles/copy_shaders_hw2p1_spiral.dir/depend

