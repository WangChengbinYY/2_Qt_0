# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_SOURCE_DIR = /home/hailiang/Documents/TsingHua/workspace/serialsim

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hailiang/Documents/TsingHua/workspace/serialsim/build

# Include any dependencies generated for this target.
include CMakeFiles/serialsim.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/serialsim.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/serialsim.dir/flags.make

CMakeFiles/serialsim.dir/main.cpp.o: CMakeFiles/serialsim.dir/flags.make
CMakeFiles/serialsim.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hailiang/Documents/TsingHua/workspace/serialsim/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/serialsim.dir/main.cpp.o"
	/usr/bin/clang++-6.0  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/serialsim.dir/main.cpp.o -c /home/hailiang/Documents/TsingHua/workspace/serialsim/main.cpp

CMakeFiles/serialsim.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/serialsim.dir/main.cpp.i"
	/usr/bin/clang++-6.0 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hailiang/Documents/TsingHua/workspace/serialsim/main.cpp > CMakeFiles/serialsim.dir/main.cpp.i

CMakeFiles/serialsim.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/serialsim.dir/main.cpp.s"
	/usr/bin/clang++-6.0 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hailiang/Documents/TsingHua/workspace/serialsim/main.cpp -o CMakeFiles/serialsim.dir/main.cpp.s

CMakeFiles/serialsim.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/serialsim.dir/main.cpp.o.requires

CMakeFiles/serialsim.dir/main.cpp.o.provides: CMakeFiles/serialsim.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/serialsim.dir/build.make CMakeFiles/serialsim.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/serialsim.dir/main.cpp.o.provides

CMakeFiles/serialsim.dir/main.cpp.o.provides.build: CMakeFiles/serialsim.dir/main.cpp.o


CMakeFiles/serialsim.dir/SerialThread.cpp.o: CMakeFiles/serialsim.dir/flags.make
CMakeFiles/serialsim.dir/SerialThread.cpp.o: ../SerialThread.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hailiang/Documents/TsingHua/workspace/serialsim/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/serialsim.dir/SerialThread.cpp.o"
	/usr/bin/clang++-6.0  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/serialsim.dir/SerialThread.cpp.o -c /home/hailiang/Documents/TsingHua/workspace/serialsim/SerialThread.cpp

CMakeFiles/serialsim.dir/SerialThread.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/serialsim.dir/SerialThread.cpp.i"
	/usr/bin/clang++-6.0 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hailiang/Documents/TsingHua/workspace/serialsim/SerialThread.cpp > CMakeFiles/serialsim.dir/SerialThread.cpp.i

CMakeFiles/serialsim.dir/SerialThread.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/serialsim.dir/SerialThread.cpp.s"
	/usr/bin/clang++-6.0 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hailiang/Documents/TsingHua/workspace/serialsim/SerialThread.cpp -o CMakeFiles/serialsim.dir/SerialThread.cpp.s

CMakeFiles/serialsim.dir/SerialThread.cpp.o.requires:

.PHONY : CMakeFiles/serialsim.dir/SerialThread.cpp.o.requires

CMakeFiles/serialsim.dir/SerialThread.cpp.o.provides: CMakeFiles/serialsim.dir/SerialThread.cpp.o.requires
	$(MAKE) -f CMakeFiles/serialsim.dir/build.make CMakeFiles/serialsim.dir/SerialThread.cpp.o.provides.build
.PHONY : CMakeFiles/serialsim.dir/SerialThread.cpp.o.provides

CMakeFiles/serialsim.dir/SerialThread.cpp.o.provides.build: CMakeFiles/serialsim.dir/SerialThread.cpp.o


CMakeFiles/serialsim.dir/serialsim_autogen/mocs_compilation.cpp.o: CMakeFiles/serialsim.dir/flags.make
CMakeFiles/serialsim.dir/serialsim_autogen/mocs_compilation.cpp.o: serialsim_autogen/mocs_compilation.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hailiang/Documents/TsingHua/workspace/serialsim/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/serialsim.dir/serialsim_autogen/mocs_compilation.cpp.o"
	/usr/bin/clang++-6.0  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/serialsim.dir/serialsim_autogen/mocs_compilation.cpp.o -c /home/hailiang/Documents/TsingHua/workspace/serialsim/build/serialsim_autogen/mocs_compilation.cpp

CMakeFiles/serialsim.dir/serialsim_autogen/mocs_compilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/serialsim.dir/serialsim_autogen/mocs_compilation.cpp.i"
	/usr/bin/clang++-6.0 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hailiang/Documents/TsingHua/workspace/serialsim/build/serialsim_autogen/mocs_compilation.cpp > CMakeFiles/serialsim.dir/serialsim_autogen/mocs_compilation.cpp.i

CMakeFiles/serialsim.dir/serialsim_autogen/mocs_compilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/serialsim.dir/serialsim_autogen/mocs_compilation.cpp.s"
	/usr/bin/clang++-6.0 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hailiang/Documents/TsingHua/workspace/serialsim/build/serialsim_autogen/mocs_compilation.cpp -o CMakeFiles/serialsim.dir/serialsim_autogen/mocs_compilation.cpp.s

CMakeFiles/serialsim.dir/serialsim_autogen/mocs_compilation.cpp.o.requires:

.PHONY : CMakeFiles/serialsim.dir/serialsim_autogen/mocs_compilation.cpp.o.requires

CMakeFiles/serialsim.dir/serialsim_autogen/mocs_compilation.cpp.o.provides: CMakeFiles/serialsim.dir/serialsim_autogen/mocs_compilation.cpp.o.requires
	$(MAKE) -f CMakeFiles/serialsim.dir/build.make CMakeFiles/serialsim.dir/serialsim_autogen/mocs_compilation.cpp.o.provides.build
.PHONY : CMakeFiles/serialsim.dir/serialsim_autogen/mocs_compilation.cpp.o.provides

CMakeFiles/serialsim.dir/serialsim_autogen/mocs_compilation.cpp.o.provides.build: CMakeFiles/serialsim.dir/serialsim_autogen/mocs_compilation.cpp.o


# Object files for target serialsim
serialsim_OBJECTS = \
"CMakeFiles/serialsim.dir/main.cpp.o" \
"CMakeFiles/serialsim.dir/SerialThread.cpp.o" \
"CMakeFiles/serialsim.dir/serialsim_autogen/mocs_compilation.cpp.o"

# External object files for target serialsim
serialsim_EXTERNAL_OBJECTS =

serialsim: CMakeFiles/serialsim.dir/main.cpp.o
serialsim: CMakeFiles/serialsim.dir/SerialThread.cpp.o
serialsim: CMakeFiles/serialsim.dir/serialsim_autogen/mocs_compilation.cpp.o
serialsim: CMakeFiles/serialsim.dir/build.make
serialsim: /opt/Qt5.11.1/5.11.1/gcc_64/lib/libQt5SerialPort.so.5.11.1
serialsim: /opt/Qt5.11.1/5.11.1/gcc_64/lib/libQt5Core.so.5.11.1
serialsim: CMakeFiles/serialsim.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/hailiang/Documents/TsingHua/workspace/serialsim/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable serialsim"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/serialsim.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/serialsim.dir/build: serialsim

.PHONY : CMakeFiles/serialsim.dir/build

CMakeFiles/serialsim.dir/requires: CMakeFiles/serialsim.dir/main.cpp.o.requires
CMakeFiles/serialsim.dir/requires: CMakeFiles/serialsim.dir/SerialThread.cpp.o.requires
CMakeFiles/serialsim.dir/requires: CMakeFiles/serialsim.dir/serialsim_autogen/mocs_compilation.cpp.o.requires

.PHONY : CMakeFiles/serialsim.dir/requires

CMakeFiles/serialsim.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/serialsim.dir/cmake_clean.cmake
.PHONY : CMakeFiles/serialsim.dir/clean

CMakeFiles/serialsim.dir/depend:
	cd /home/hailiang/Documents/TsingHua/workspace/serialsim/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hailiang/Documents/TsingHua/workspace/serialsim /home/hailiang/Documents/TsingHua/workspace/serialsim /home/hailiang/Documents/TsingHua/workspace/serialsim/build /home/hailiang/Documents/TsingHua/workspace/serialsim/build /home/hailiang/Documents/TsingHua/workspace/serialsim/build/CMakeFiles/serialsim.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/serialsim.dir/depend

