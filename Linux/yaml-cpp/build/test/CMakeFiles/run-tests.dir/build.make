# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.0

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

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jbertomeu/Work/BMTech/yaml-cpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jbertomeu/Work/BMTech/yaml-cpp/build

# Include any dependencies generated for this target.
include test/CMakeFiles/run-tests.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/run-tests.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/run-tests.dir/flags.make

test/CMakeFiles/run-tests.dir/ostream_wrapper_test.cpp.o: test/CMakeFiles/run-tests.dir/flags.make
test/CMakeFiles/run-tests.dir/ostream_wrapper_test.cpp.o: ../test/ostream_wrapper_test.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jbertomeu/Work/BMTech/yaml-cpp/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object test/CMakeFiles/run-tests.dir/ostream_wrapper_test.cpp.o"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/run-tests.dir/ostream_wrapper_test.cpp.o -c /home/jbertomeu/Work/BMTech/yaml-cpp/test/ostream_wrapper_test.cpp

test/CMakeFiles/run-tests.dir/ostream_wrapper_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/run-tests.dir/ostream_wrapper_test.cpp.i"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/jbertomeu/Work/BMTech/yaml-cpp/test/ostream_wrapper_test.cpp > CMakeFiles/run-tests.dir/ostream_wrapper_test.cpp.i

test/CMakeFiles/run-tests.dir/ostream_wrapper_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/run-tests.dir/ostream_wrapper_test.cpp.s"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/jbertomeu/Work/BMTech/yaml-cpp/test/ostream_wrapper_test.cpp -o CMakeFiles/run-tests.dir/ostream_wrapper_test.cpp.s

test/CMakeFiles/run-tests.dir/ostream_wrapper_test.cpp.o.requires:
.PHONY : test/CMakeFiles/run-tests.dir/ostream_wrapper_test.cpp.o.requires

test/CMakeFiles/run-tests.dir/ostream_wrapper_test.cpp.o.provides: test/CMakeFiles/run-tests.dir/ostream_wrapper_test.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/run-tests.dir/build.make test/CMakeFiles/run-tests.dir/ostream_wrapper_test.cpp.o.provides.build
.PHONY : test/CMakeFiles/run-tests.dir/ostream_wrapper_test.cpp.o.provides

test/CMakeFiles/run-tests.dir/ostream_wrapper_test.cpp.o.provides.build: test/CMakeFiles/run-tests.dir/ostream_wrapper_test.cpp.o

test/CMakeFiles/run-tests.dir/main.cpp.o: test/CMakeFiles/run-tests.dir/flags.make
test/CMakeFiles/run-tests.dir/main.cpp.o: ../test/main.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jbertomeu/Work/BMTech/yaml-cpp/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object test/CMakeFiles/run-tests.dir/main.cpp.o"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/run-tests.dir/main.cpp.o -c /home/jbertomeu/Work/BMTech/yaml-cpp/test/main.cpp

test/CMakeFiles/run-tests.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/run-tests.dir/main.cpp.i"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/jbertomeu/Work/BMTech/yaml-cpp/test/main.cpp > CMakeFiles/run-tests.dir/main.cpp.i

test/CMakeFiles/run-tests.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/run-tests.dir/main.cpp.s"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/jbertomeu/Work/BMTech/yaml-cpp/test/main.cpp -o CMakeFiles/run-tests.dir/main.cpp.s

test/CMakeFiles/run-tests.dir/main.cpp.o.requires:
.PHONY : test/CMakeFiles/run-tests.dir/main.cpp.o.requires

test/CMakeFiles/run-tests.dir/main.cpp.o.provides: test/CMakeFiles/run-tests.dir/main.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/run-tests.dir/build.make test/CMakeFiles/run-tests.dir/main.cpp.o.provides.build
.PHONY : test/CMakeFiles/run-tests.dir/main.cpp.o.provides

test/CMakeFiles/run-tests.dir/main.cpp.o.provides.build: test/CMakeFiles/run-tests.dir/main.cpp.o

test/CMakeFiles/run-tests.dir/integration/emitter_test.cpp.o: test/CMakeFiles/run-tests.dir/flags.make
test/CMakeFiles/run-tests.dir/integration/emitter_test.cpp.o: ../test/integration/emitter_test.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jbertomeu/Work/BMTech/yaml-cpp/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object test/CMakeFiles/run-tests.dir/integration/emitter_test.cpp.o"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/run-tests.dir/integration/emitter_test.cpp.o -c /home/jbertomeu/Work/BMTech/yaml-cpp/test/integration/emitter_test.cpp

test/CMakeFiles/run-tests.dir/integration/emitter_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/run-tests.dir/integration/emitter_test.cpp.i"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/jbertomeu/Work/BMTech/yaml-cpp/test/integration/emitter_test.cpp > CMakeFiles/run-tests.dir/integration/emitter_test.cpp.i

test/CMakeFiles/run-tests.dir/integration/emitter_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/run-tests.dir/integration/emitter_test.cpp.s"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/jbertomeu/Work/BMTech/yaml-cpp/test/integration/emitter_test.cpp -o CMakeFiles/run-tests.dir/integration/emitter_test.cpp.s

test/CMakeFiles/run-tests.dir/integration/emitter_test.cpp.o.requires:
.PHONY : test/CMakeFiles/run-tests.dir/integration/emitter_test.cpp.o.requires

test/CMakeFiles/run-tests.dir/integration/emitter_test.cpp.o.provides: test/CMakeFiles/run-tests.dir/integration/emitter_test.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/run-tests.dir/build.make test/CMakeFiles/run-tests.dir/integration/emitter_test.cpp.o.provides.build
.PHONY : test/CMakeFiles/run-tests.dir/integration/emitter_test.cpp.o.provides

test/CMakeFiles/run-tests.dir/integration/emitter_test.cpp.o.provides.build: test/CMakeFiles/run-tests.dir/integration/emitter_test.cpp.o

test/CMakeFiles/run-tests.dir/integration/gen_emitter_test.cpp.o: test/CMakeFiles/run-tests.dir/flags.make
test/CMakeFiles/run-tests.dir/integration/gen_emitter_test.cpp.o: ../test/integration/gen_emitter_test.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jbertomeu/Work/BMTech/yaml-cpp/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object test/CMakeFiles/run-tests.dir/integration/gen_emitter_test.cpp.o"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/run-tests.dir/integration/gen_emitter_test.cpp.o -c /home/jbertomeu/Work/BMTech/yaml-cpp/test/integration/gen_emitter_test.cpp

test/CMakeFiles/run-tests.dir/integration/gen_emitter_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/run-tests.dir/integration/gen_emitter_test.cpp.i"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/jbertomeu/Work/BMTech/yaml-cpp/test/integration/gen_emitter_test.cpp > CMakeFiles/run-tests.dir/integration/gen_emitter_test.cpp.i

test/CMakeFiles/run-tests.dir/integration/gen_emitter_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/run-tests.dir/integration/gen_emitter_test.cpp.s"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/jbertomeu/Work/BMTech/yaml-cpp/test/integration/gen_emitter_test.cpp -o CMakeFiles/run-tests.dir/integration/gen_emitter_test.cpp.s

test/CMakeFiles/run-tests.dir/integration/gen_emitter_test.cpp.o.requires:
.PHONY : test/CMakeFiles/run-tests.dir/integration/gen_emitter_test.cpp.o.requires

test/CMakeFiles/run-tests.dir/integration/gen_emitter_test.cpp.o.provides: test/CMakeFiles/run-tests.dir/integration/gen_emitter_test.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/run-tests.dir/build.make test/CMakeFiles/run-tests.dir/integration/gen_emitter_test.cpp.o.provides.build
.PHONY : test/CMakeFiles/run-tests.dir/integration/gen_emitter_test.cpp.o.provides

test/CMakeFiles/run-tests.dir/integration/gen_emitter_test.cpp.o.provides.build: test/CMakeFiles/run-tests.dir/integration/gen_emitter_test.cpp.o

test/CMakeFiles/run-tests.dir/integration/handler_test.cpp.o: test/CMakeFiles/run-tests.dir/flags.make
test/CMakeFiles/run-tests.dir/integration/handler_test.cpp.o: ../test/integration/handler_test.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jbertomeu/Work/BMTech/yaml-cpp/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object test/CMakeFiles/run-tests.dir/integration/handler_test.cpp.o"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/run-tests.dir/integration/handler_test.cpp.o -c /home/jbertomeu/Work/BMTech/yaml-cpp/test/integration/handler_test.cpp

test/CMakeFiles/run-tests.dir/integration/handler_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/run-tests.dir/integration/handler_test.cpp.i"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/jbertomeu/Work/BMTech/yaml-cpp/test/integration/handler_test.cpp > CMakeFiles/run-tests.dir/integration/handler_test.cpp.i

test/CMakeFiles/run-tests.dir/integration/handler_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/run-tests.dir/integration/handler_test.cpp.s"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/jbertomeu/Work/BMTech/yaml-cpp/test/integration/handler_test.cpp -o CMakeFiles/run-tests.dir/integration/handler_test.cpp.s

test/CMakeFiles/run-tests.dir/integration/handler_test.cpp.o.requires:
.PHONY : test/CMakeFiles/run-tests.dir/integration/handler_test.cpp.o.requires

test/CMakeFiles/run-tests.dir/integration/handler_test.cpp.o.provides: test/CMakeFiles/run-tests.dir/integration/handler_test.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/run-tests.dir/build.make test/CMakeFiles/run-tests.dir/integration/handler_test.cpp.o.provides.build
.PHONY : test/CMakeFiles/run-tests.dir/integration/handler_test.cpp.o.provides

test/CMakeFiles/run-tests.dir/integration/handler_test.cpp.o.provides.build: test/CMakeFiles/run-tests.dir/integration/handler_test.cpp.o

test/CMakeFiles/run-tests.dir/integration/node_spec_test.cpp.o: test/CMakeFiles/run-tests.dir/flags.make
test/CMakeFiles/run-tests.dir/integration/node_spec_test.cpp.o: ../test/integration/node_spec_test.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jbertomeu/Work/BMTech/yaml-cpp/build/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object test/CMakeFiles/run-tests.dir/integration/node_spec_test.cpp.o"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/run-tests.dir/integration/node_spec_test.cpp.o -c /home/jbertomeu/Work/BMTech/yaml-cpp/test/integration/node_spec_test.cpp

test/CMakeFiles/run-tests.dir/integration/node_spec_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/run-tests.dir/integration/node_spec_test.cpp.i"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/jbertomeu/Work/BMTech/yaml-cpp/test/integration/node_spec_test.cpp > CMakeFiles/run-tests.dir/integration/node_spec_test.cpp.i

test/CMakeFiles/run-tests.dir/integration/node_spec_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/run-tests.dir/integration/node_spec_test.cpp.s"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/jbertomeu/Work/BMTech/yaml-cpp/test/integration/node_spec_test.cpp -o CMakeFiles/run-tests.dir/integration/node_spec_test.cpp.s

test/CMakeFiles/run-tests.dir/integration/node_spec_test.cpp.o.requires:
.PHONY : test/CMakeFiles/run-tests.dir/integration/node_spec_test.cpp.o.requires

test/CMakeFiles/run-tests.dir/integration/node_spec_test.cpp.o.provides: test/CMakeFiles/run-tests.dir/integration/node_spec_test.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/run-tests.dir/build.make test/CMakeFiles/run-tests.dir/integration/node_spec_test.cpp.o.provides.build
.PHONY : test/CMakeFiles/run-tests.dir/integration/node_spec_test.cpp.o.provides

test/CMakeFiles/run-tests.dir/integration/node_spec_test.cpp.o.provides.build: test/CMakeFiles/run-tests.dir/integration/node_spec_test.cpp.o

test/CMakeFiles/run-tests.dir/integration/handler_spec_test.cpp.o: test/CMakeFiles/run-tests.dir/flags.make
test/CMakeFiles/run-tests.dir/integration/handler_spec_test.cpp.o: ../test/integration/handler_spec_test.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jbertomeu/Work/BMTech/yaml-cpp/build/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object test/CMakeFiles/run-tests.dir/integration/handler_spec_test.cpp.o"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/run-tests.dir/integration/handler_spec_test.cpp.o -c /home/jbertomeu/Work/BMTech/yaml-cpp/test/integration/handler_spec_test.cpp

test/CMakeFiles/run-tests.dir/integration/handler_spec_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/run-tests.dir/integration/handler_spec_test.cpp.i"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/jbertomeu/Work/BMTech/yaml-cpp/test/integration/handler_spec_test.cpp > CMakeFiles/run-tests.dir/integration/handler_spec_test.cpp.i

test/CMakeFiles/run-tests.dir/integration/handler_spec_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/run-tests.dir/integration/handler_spec_test.cpp.s"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/jbertomeu/Work/BMTech/yaml-cpp/test/integration/handler_spec_test.cpp -o CMakeFiles/run-tests.dir/integration/handler_spec_test.cpp.s

test/CMakeFiles/run-tests.dir/integration/handler_spec_test.cpp.o.requires:
.PHONY : test/CMakeFiles/run-tests.dir/integration/handler_spec_test.cpp.o.requires

test/CMakeFiles/run-tests.dir/integration/handler_spec_test.cpp.o.provides: test/CMakeFiles/run-tests.dir/integration/handler_spec_test.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/run-tests.dir/build.make test/CMakeFiles/run-tests.dir/integration/handler_spec_test.cpp.o.provides.build
.PHONY : test/CMakeFiles/run-tests.dir/integration/handler_spec_test.cpp.o.provides

test/CMakeFiles/run-tests.dir/integration/handler_spec_test.cpp.o.provides.build: test/CMakeFiles/run-tests.dir/integration/handler_spec_test.cpp.o

test/CMakeFiles/run-tests.dir/integration/encoding_test.cpp.o: test/CMakeFiles/run-tests.dir/flags.make
test/CMakeFiles/run-tests.dir/integration/encoding_test.cpp.o: ../test/integration/encoding_test.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jbertomeu/Work/BMTech/yaml-cpp/build/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object test/CMakeFiles/run-tests.dir/integration/encoding_test.cpp.o"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/run-tests.dir/integration/encoding_test.cpp.o -c /home/jbertomeu/Work/BMTech/yaml-cpp/test/integration/encoding_test.cpp

test/CMakeFiles/run-tests.dir/integration/encoding_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/run-tests.dir/integration/encoding_test.cpp.i"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/jbertomeu/Work/BMTech/yaml-cpp/test/integration/encoding_test.cpp > CMakeFiles/run-tests.dir/integration/encoding_test.cpp.i

test/CMakeFiles/run-tests.dir/integration/encoding_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/run-tests.dir/integration/encoding_test.cpp.s"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/jbertomeu/Work/BMTech/yaml-cpp/test/integration/encoding_test.cpp -o CMakeFiles/run-tests.dir/integration/encoding_test.cpp.s

test/CMakeFiles/run-tests.dir/integration/encoding_test.cpp.o.requires:
.PHONY : test/CMakeFiles/run-tests.dir/integration/encoding_test.cpp.o.requires

test/CMakeFiles/run-tests.dir/integration/encoding_test.cpp.o.provides: test/CMakeFiles/run-tests.dir/integration/encoding_test.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/run-tests.dir/build.make test/CMakeFiles/run-tests.dir/integration/encoding_test.cpp.o.provides.build
.PHONY : test/CMakeFiles/run-tests.dir/integration/encoding_test.cpp.o.provides

test/CMakeFiles/run-tests.dir/integration/encoding_test.cpp.o.provides.build: test/CMakeFiles/run-tests.dir/integration/encoding_test.cpp.o

test/CMakeFiles/run-tests.dir/integration/load_node_test.cpp.o: test/CMakeFiles/run-tests.dir/flags.make
test/CMakeFiles/run-tests.dir/integration/load_node_test.cpp.o: ../test/integration/load_node_test.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jbertomeu/Work/BMTech/yaml-cpp/build/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object test/CMakeFiles/run-tests.dir/integration/load_node_test.cpp.o"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/run-tests.dir/integration/load_node_test.cpp.o -c /home/jbertomeu/Work/BMTech/yaml-cpp/test/integration/load_node_test.cpp

test/CMakeFiles/run-tests.dir/integration/load_node_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/run-tests.dir/integration/load_node_test.cpp.i"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/jbertomeu/Work/BMTech/yaml-cpp/test/integration/load_node_test.cpp > CMakeFiles/run-tests.dir/integration/load_node_test.cpp.i

test/CMakeFiles/run-tests.dir/integration/load_node_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/run-tests.dir/integration/load_node_test.cpp.s"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/jbertomeu/Work/BMTech/yaml-cpp/test/integration/load_node_test.cpp -o CMakeFiles/run-tests.dir/integration/load_node_test.cpp.s

test/CMakeFiles/run-tests.dir/integration/load_node_test.cpp.o.requires:
.PHONY : test/CMakeFiles/run-tests.dir/integration/load_node_test.cpp.o.requires

test/CMakeFiles/run-tests.dir/integration/load_node_test.cpp.o.provides: test/CMakeFiles/run-tests.dir/integration/load_node_test.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/run-tests.dir/build.make test/CMakeFiles/run-tests.dir/integration/load_node_test.cpp.o.provides.build
.PHONY : test/CMakeFiles/run-tests.dir/integration/load_node_test.cpp.o.provides

test/CMakeFiles/run-tests.dir/integration/load_node_test.cpp.o.provides.build: test/CMakeFiles/run-tests.dir/integration/load_node_test.cpp.o

test/CMakeFiles/run-tests.dir/node/node_test.cpp.o: test/CMakeFiles/run-tests.dir/flags.make
test/CMakeFiles/run-tests.dir/node/node_test.cpp.o: ../test/node/node_test.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jbertomeu/Work/BMTech/yaml-cpp/build/CMakeFiles $(CMAKE_PROGRESS_10)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object test/CMakeFiles/run-tests.dir/node/node_test.cpp.o"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/run-tests.dir/node/node_test.cpp.o -c /home/jbertomeu/Work/BMTech/yaml-cpp/test/node/node_test.cpp

test/CMakeFiles/run-tests.dir/node/node_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/run-tests.dir/node/node_test.cpp.i"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/jbertomeu/Work/BMTech/yaml-cpp/test/node/node_test.cpp > CMakeFiles/run-tests.dir/node/node_test.cpp.i

test/CMakeFiles/run-tests.dir/node/node_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/run-tests.dir/node/node_test.cpp.s"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/jbertomeu/Work/BMTech/yaml-cpp/test/node/node_test.cpp -o CMakeFiles/run-tests.dir/node/node_test.cpp.s

test/CMakeFiles/run-tests.dir/node/node_test.cpp.o.requires:
.PHONY : test/CMakeFiles/run-tests.dir/node/node_test.cpp.o.requires

test/CMakeFiles/run-tests.dir/node/node_test.cpp.o.provides: test/CMakeFiles/run-tests.dir/node/node_test.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/run-tests.dir/build.make test/CMakeFiles/run-tests.dir/node/node_test.cpp.o.provides.build
.PHONY : test/CMakeFiles/run-tests.dir/node/node_test.cpp.o.provides

test/CMakeFiles/run-tests.dir/node/node_test.cpp.o.provides.build: test/CMakeFiles/run-tests.dir/node/node_test.cpp.o

# Object files for target run-tests
run__tests_OBJECTS = \
"CMakeFiles/run-tests.dir/ostream_wrapper_test.cpp.o" \
"CMakeFiles/run-tests.dir/main.cpp.o" \
"CMakeFiles/run-tests.dir/integration/emitter_test.cpp.o" \
"CMakeFiles/run-tests.dir/integration/gen_emitter_test.cpp.o" \
"CMakeFiles/run-tests.dir/integration/handler_test.cpp.o" \
"CMakeFiles/run-tests.dir/integration/node_spec_test.cpp.o" \
"CMakeFiles/run-tests.dir/integration/handler_spec_test.cpp.o" \
"CMakeFiles/run-tests.dir/integration/encoding_test.cpp.o" \
"CMakeFiles/run-tests.dir/integration/load_node_test.cpp.o" \
"CMakeFiles/run-tests.dir/node/node_test.cpp.o"

# External object files for target run-tests
run__tests_EXTERNAL_OBJECTS =

test/run-tests: test/CMakeFiles/run-tests.dir/ostream_wrapper_test.cpp.o
test/run-tests: test/CMakeFiles/run-tests.dir/main.cpp.o
test/run-tests: test/CMakeFiles/run-tests.dir/integration/emitter_test.cpp.o
test/run-tests: test/CMakeFiles/run-tests.dir/integration/gen_emitter_test.cpp.o
test/run-tests: test/CMakeFiles/run-tests.dir/integration/handler_test.cpp.o
test/run-tests: test/CMakeFiles/run-tests.dir/integration/node_spec_test.cpp.o
test/run-tests: test/CMakeFiles/run-tests.dir/integration/handler_spec_test.cpp.o
test/run-tests: test/CMakeFiles/run-tests.dir/integration/encoding_test.cpp.o
test/run-tests: test/CMakeFiles/run-tests.dir/integration/load_node_test.cpp.o
test/run-tests: test/CMakeFiles/run-tests.dir/node/node_test.cpp.o
test/run-tests: test/CMakeFiles/run-tests.dir/build.make
test/run-tests: libyaml-cpp.a
test/run-tests: test/gmock-1.7.0/libgmock.a
test/run-tests: test/CMakeFiles/run-tests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable run-tests"
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/run-tests.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/run-tests.dir/build: test/run-tests
.PHONY : test/CMakeFiles/run-tests.dir/build

test/CMakeFiles/run-tests.dir/requires: test/CMakeFiles/run-tests.dir/ostream_wrapper_test.cpp.o.requires
test/CMakeFiles/run-tests.dir/requires: test/CMakeFiles/run-tests.dir/main.cpp.o.requires
test/CMakeFiles/run-tests.dir/requires: test/CMakeFiles/run-tests.dir/integration/emitter_test.cpp.o.requires
test/CMakeFiles/run-tests.dir/requires: test/CMakeFiles/run-tests.dir/integration/gen_emitter_test.cpp.o.requires
test/CMakeFiles/run-tests.dir/requires: test/CMakeFiles/run-tests.dir/integration/handler_test.cpp.o.requires
test/CMakeFiles/run-tests.dir/requires: test/CMakeFiles/run-tests.dir/integration/node_spec_test.cpp.o.requires
test/CMakeFiles/run-tests.dir/requires: test/CMakeFiles/run-tests.dir/integration/handler_spec_test.cpp.o.requires
test/CMakeFiles/run-tests.dir/requires: test/CMakeFiles/run-tests.dir/integration/encoding_test.cpp.o.requires
test/CMakeFiles/run-tests.dir/requires: test/CMakeFiles/run-tests.dir/integration/load_node_test.cpp.o.requires
test/CMakeFiles/run-tests.dir/requires: test/CMakeFiles/run-tests.dir/node/node_test.cpp.o.requires
.PHONY : test/CMakeFiles/run-tests.dir/requires

test/CMakeFiles/run-tests.dir/clean:
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build/test && $(CMAKE_COMMAND) -P CMakeFiles/run-tests.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/run-tests.dir/clean

test/CMakeFiles/run-tests.dir/depend:
	cd /home/jbertomeu/Work/BMTech/yaml-cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jbertomeu/Work/BMTech/yaml-cpp /home/jbertomeu/Work/BMTech/yaml-cpp/test /home/jbertomeu/Work/BMTech/yaml-cpp/build /home/jbertomeu/Work/BMTech/yaml-cpp/build/test /home/jbertomeu/Work/BMTech/yaml-cpp/build/test/CMakeFiles/run-tests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/run-tests.dir/depend

