# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.30

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
CMAKE_COMMAND = C:\SoftwareDev\CMake\bin\cmake.exe

# The command to remove a file.
RM = C:\SoftwareDev\CMake\bin\cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "C:\Users\aalib\Desktop\Git\CMake-Exercises\04 - optional build"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "C:\Users\aalib\Desktop\Git\CMake-Exercises\04 - optional build\build"

# Include any dependencies generated for this target.
include CMakeFiles/my_math.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/my_math.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/my_math.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/my_math.dir/flags.make

CMakeFiles/my_math.dir/math.cpp.obj: CMakeFiles/my_math.dir/flags.make
CMakeFiles/my_math.dir/math.cpp.obj: C:/Users/aalib/Desktop/Git/CMake-Exercises/04\ -\ optional\ build/math.cpp
CMakeFiles/my_math.dir/math.cpp.obj: CMakeFiles/my_math.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="C:\Users\aalib\Desktop\Git\CMake-Exercises\04 - optional build\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/my_math.dir/math.cpp.obj"
	C:\SoftwareDev\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_math.dir/math.cpp.obj -MF CMakeFiles\my_math.dir\math.cpp.obj.d -o CMakeFiles\my_math.dir\math.cpp.obj -c "C:\Users\aalib\Desktop\Git\CMake-Exercises\04 - optional build\math.cpp"

CMakeFiles/my_math.dir/math.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/my_math.dir/math.cpp.i"
	C:\SoftwareDev\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "C:\Users\aalib\Desktop\Git\CMake-Exercises\04 - optional build\math.cpp" > CMakeFiles\my_math.dir\math.cpp.i

CMakeFiles/my_math.dir/math.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/my_math.dir/math.cpp.s"
	C:\SoftwareDev\MinGW\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "C:\Users\aalib\Desktop\Git\CMake-Exercises\04 - optional build\math.cpp" -o CMakeFiles\my_math.dir\math.cpp.s

# Object files for target my_math
my_math_OBJECTS = \
"CMakeFiles/my_math.dir/math.cpp.obj"

# External object files for target my_math
my_math_EXTERNAL_OBJECTS =

bin/libmy_math.dll: CMakeFiles/my_math.dir/math.cpp.obj
bin/libmy_math.dll: CMakeFiles/my_math.dir/build.make
bin/libmy_math.dll: CMakeFiles/my_math.dir/linkLibs.rsp
bin/libmy_math.dll: CMakeFiles/my_math.dir/objects1.rsp
bin/libmy_math.dll: CMakeFiles/my_math.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir="C:\Users\aalib\Desktop\Git\CMake-Exercises\04 - optional build\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library bin\libmy_math.dll"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\my_math.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/my_math.dir/build: bin/libmy_math.dll
.PHONY : CMakeFiles/my_math.dir/build

CMakeFiles/my_math.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\my_math.dir\cmake_clean.cmake
.PHONY : CMakeFiles/my_math.dir/clean

CMakeFiles/my_math.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" "C:\Users\aalib\Desktop\Git\CMake-Exercises\04 - optional build" "C:\Users\aalib\Desktop\Git\CMake-Exercises\04 - optional build" "C:\Users\aalib\Desktop\Git\CMake-Exercises\04 - optional build\build" "C:\Users\aalib\Desktop\Git\CMake-Exercises\04 - optional build\build" "C:\Users\aalib\Desktop\Git\CMake-Exercises\04 - optional build\build\CMakeFiles\my_math.dir\DependInfo.cmake" "--color=$(COLOR)"
.PHONY : CMakeFiles/my_math.dir/depend
