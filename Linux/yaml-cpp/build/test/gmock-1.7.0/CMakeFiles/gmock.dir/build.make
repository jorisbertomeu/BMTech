# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/build

# Include any dependencies generated for this target.
include test/gmock-1.7.0/CMakeFiles/gmock.dir/depend.make

# Include the progress variables for this target.
include test/gmock-1.7.0/CMakeFiles/gmock.dir/progress.make

# Include the compile flags for this target's objects.
include test/gmock-1.7.0/CMakeFiles/gmock.dir/flags.make

test/gmock-1.7.0/CMakeFiles/gmock.dir/gtest/src/gtest-all.cc.o: test/gmock-1.7.0/CMakeFiles/gmock.dir/flags.make
test/gmock-1.7.0/CMakeFiles/gmock.dir/gtest/src/gtest-all.cc.o: ../test/gmock-1.7.0/gtest/src/gtest-all.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object test/gmock-1.7.0/CMakeFiles/gmock.dir/gtest/src/gtest-all.cc.o"
	cd /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/build/test/gmock-1.7.0 && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS)  -Wall -Wshadow -DGTEST_HAS_PTHREAD=1 -fexceptions -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -o CMakeFiles/gmock.dir/gtest/src/gtest-all.cc.o -c /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/test/gmock-1.7.0/gtest/src/gtest-all.cc

test/gmock-1.7.0/CMakeFiles/gmock.dir/gtest/src/gtest-all.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gmock.dir/gtest/src/gtest-all.cc.i"
	cd /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/build/test/gmock-1.7.0 && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS)  -Wall -Wshadow -DGTEST_HAS_PTHREAD=1 -fexceptions -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -E /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/test/gmock-1.7.0/gtest/src/gtest-all.cc > CMakeFiles/gmock.dir/gtest/src/gtest-all.cc.i

test/gmock-1.7.0/CMakeFiles/gmock.dir/gtest/src/gtest-all.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gmock.dir/gtest/src/gtest-all.cc.s"
	cd /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/build/test/gmock-1.7.0 && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS)  -Wall -Wshadow -DGTEST_HAS_PTHREAD=1 -fexceptions -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -S /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/test/gmock-1.7.0/gtest/src/gtest-all.cc -o CMakeFiles/gmock.dir/gtest/src/gtest-all.cc.s

test/gmock-1.7.0/CMakeFiles/gmock.dir/gtest/src/gtest-all.cc.o.requires:
.PHONY : test/gmock-1.7.0/CMakeFiles/gmock.dir/gtest/src/gtest-all.cc.o.requires

test/gmock-1.7.0/CMakeFiles/gmock.dir/gtest/src/gtest-all.cc.o.provides: test/gmock-1.7.0/CMakeFiles/gmock.dir/gtest/src/gtest-all.cc.o.requires
	$(MAKE) -f test/gmock-1.7.0/CMakeFiles/gmock.dir/build.make test/gmock-1.7.0/CMakeFiles/gmock.dir/gtest/src/gtest-all.cc.o.provides.build
.PHONY : test/gmock-1.7.0/CMakeFiles/gmock.dir/gtest/src/gtest-all.cc.o.provides

test/gmock-1.7.0/CMakeFiles/gmock.dir/gtest/src/gtest-all.cc.o.provides.build: test/gmock-1.7.0/CMakeFiles/gmock.dir/gtest/src/gtest-all.cc.o

test/gmock-1.7.0/CMakeFiles/gmock.dir/src/gmock-all.cc.o: test/gmock-1.7.0/CMakeFiles/gmock.dir/flags.make
test/gmock-1.7.0/CMakeFiles/gmock.dir/src/gmock-all.cc.o: ../test/gmock-1.7.0/src/gmock-all.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object test/gmock-1.7.0/CMakeFiles/gmock.dir/src/gmock-all.cc.o"
	cd /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/build/test/gmock-1.7.0 && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS)  -Wall -Wshadow -DGTEST_HAS_PTHREAD=1 -fexceptions -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -o CMakeFiles/gmock.dir/src/gmock-all.cc.o -c /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/test/gmock-1.7.0/src/gmock-all.cc

test/gmock-1.7.0/CMakeFiles/gmock.dir/src/gmock-all.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gmock.dir/src/gmock-all.cc.i"
	cd /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/build/test/gmock-1.7.0 && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS)  -Wall -Wshadow -DGTEST_HAS_PTHREAD=1 -fexceptions -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -E /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/test/gmock-1.7.0/src/gmock-all.cc > CMakeFiles/gmock.dir/src/gmock-all.cc.i

test/gmock-1.7.0/CMakeFiles/gmock.dir/src/gmock-all.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gmock.dir/src/gmock-all.cc.s"
	cd /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/build/test/gmock-1.7.0 && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS)  -Wall -Wshadow -DGTEST_HAS_PTHREAD=1 -fexceptions -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -S /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/test/gmock-1.7.0/src/gmock-all.cc -o CMakeFiles/gmock.dir/src/gmock-all.cc.s

test/gmock-1.7.0/CMakeFiles/gmock.dir/src/gmock-all.cc.o.requires:
.PHONY : test/gmock-1.7.0/CMakeFiles/gmock.dir/src/gmock-all.cc.o.requires

test/gmock-1.7.0/CMakeFiles/gmock.dir/src/gmock-all.cc.o.provides: test/gmock-1.7.0/CMakeFiles/gmock.dir/src/gmock-all.cc.o.requires
	$(MAKE) -f test/gmock-1.7.0/CMakeFiles/gmock.dir/build.make test/gmock-1.7.0/CMakeFiles/gmock.dir/src/gmock-all.cc.o.provides.build
.PHONY : test/gmock-1.7.0/CMakeFiles/gmock.dir/src/gmock-all.cc.o.provides

test/gmock-1.7.0/CMakeFiles/gmock.dir/src/gmock-all.cc.o.provides.build: test/gmock-1.7.0/CMakeFiles/gmock.dir/src/gmock-all.cc.o

# Object files for target gmock
gmock_OBJECTS = \
"CMakeFiles/gmock.dir/gtest/src/gtest-all.cc.o" \
"CMakeFiles/gmock.dir/src/gmock-all.cc.o"

# External object files for target gmock
gmock_EXTERNAL_OBJECTS =

test/gmock-1.7.0/libgmock.a: test/gmock-1.7.0/CMakeFiles/gmock.dir/gtest/src/gtest-all.cc.o
test/gmock-1.7.0/libgmock.a: test/gmock-1.7.0/CMakeFiles/gmock.dir/src/gmock-all.cc.o
test/gmock-1.7.0/libgmock.a: test/gmock-1.7.0/CMakeFiles/gmock.dir/build.make
test/gmock-1.7.0/libgmock.a: test/gmock-1.7.0/CMakeFiles/gmock.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library libgmock.a"
	cd /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/build/test/gmock-1.7.0 && $(CMAKE_COMMAND) -P CMakeFiles/gmock.dir/cmake_clean_target.cmake
	cd /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/build/test/gmock-1.7.0 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gmock.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/gmock-1.7.0/CMakeFiles/gmock.dir/build: test/gmock-1.7.0/libgmock.a
.PHONY : test/gmock-1.7.0/CMakeFiles/gmock.dir/build

test/gmock-1.7.0/CMakeFiles/gmock.dir/requires: test/gmock-1.7.0/CMakeFiles/gmock.dir/gtest/src/gtest-all.cc.o.requires
test/gmock-1.7.0/CMakeFiles/gmock.dir/requires: test/gmock-1.7.0/CMakeFiles/gmock.dir/src/gmock-all.cc.o.requires
.PHONY : test/gmock-1.7.0/CMakeFiles/gmock.dir/requires

test/gmock-1.7.0/CMakeFiles/gmock.dir/clean:
	cd /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/build/test/gmock-1.7.0 && $(CMAKE_COMMAND) -P CMakeFiles/gmock.dir/cmake_clean.cmake
.PHONY : test/gmock-1.7.0/CMakeFiles/gmock.dir/clean

test/gmock-1.7.0/CMakeFiles/gmock.dir/depend:
	cd /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/test/gmock-1.7.0 /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/build /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/build/test/gmock-1.7.0 /home/Dieu/Desktop/Work/BMTech/Linux/yaml-cpp/build/test/gmock-1.7.0/CMakeFiles/gmock.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/gmock-1.7.0/CMakeFiles/gmock.dir/depend

