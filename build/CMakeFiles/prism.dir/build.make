# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = E:\Projects\Prism

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = E:\Projects\Prism\build

# Include any dependencies generated for this target.
include CMakeFiles/prism.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/prism.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/prism.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/prism.dir/flags.make

CMakeFiles/prism.dir/src/main.cpp.obj: CMakeFiles/prism.dir/flags.make
CMakeFiles/prism.dir/src/main.cpp.obj: ../src/main.cpp
CMakeFiles/prism.dir/src/main.cpp.obj: CMakeFiles/prism.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:\Projects\Prism\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/prism.dir/src/main.cpp.obj"
	E:\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/prism.dir/src/main.cpp.obj -MF CMakeFiles\prism.dir\src\main.cpp.obj.d -o CMakeFiles\prism.dir\src\main.cpp.obj -c E:\Projects\Prism\src\main.cpp

CMakeFiles/prism.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/prism.dir/src/main.cpp.i"
	E:\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E E:\Projects\Prism\src\main.cpp > CMakeFiles\prism.dir\src\main.cpp.i

CMakeFiles/prism.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/prism.dir/src/main.cpp.s"
	E:\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S E:\Projects\Prism\src\main.cpp -o CMakeFiles\prism.dir\src\main.cpp.s

# Object files for target prism
prism_OBJECTS = \
"CMakeFiles/prism.dir/src/main.cpp.obj"

# External object files for target prism
prism_EXTERNAL_OBJECTS =

prism.exe: CMakeFiles/prism.dir/src/main.cpp.obj
prism.exe: CMakeFiles/prism.dir/build.make
prism.exe: CMakeFiles/prism.dir/linklibs.rsp
prism.exe: CMakeFiles/prism.dir/objects1.rsp
prism.exe: CMakeFiles/prism.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=E:\Projects\Prism\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable prism.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\prism.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/prism.dir/build: prism.exe
.PHONY : CMakeFiles/prism.dir/build

CMakeFiles/prism.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\prism.dir\cmake_clean.cmake
.PHONY : CMakeFiles/prism.dir/clean

CMakeFiles/prism.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" E:\Projects\Prism E:\Projects\Prism E:\Projects\Prism\build E:\Projects\Prism\build E:\Projects\Prism\build\CMakeFiles\prism.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/prism.dir/depend

