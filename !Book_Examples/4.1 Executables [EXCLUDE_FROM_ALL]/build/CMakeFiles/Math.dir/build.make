# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.30

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

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = "C:/Program Files/CMake/bin/cmake.exe"

# The command to remove a file.
RM = "C:/Program Files/CMake/bin/cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "D:/New folder/4.1 Executables [EXCLUDE_FROM_ALL]"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "D:/New folder/4.1 Executables [EXCLUDE_FROM_ALL]/build"

# Include any dependencies generated for this target.
include CMakeFiles/Math.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/Math.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/Math.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Math.dir/flags.make

CMakeFiles/Math.dir/math.cpp.obj: CMakeFiles/Math.dir/flags.make
CMakeFiles/Math.dir/math.cpp.obj: D:/New\ folder/4.1\ Executables\ [EXCLUDE_FROM_ALL]/math.cpp
CMakeFiles/Math.dir/math.cpp.obj: CMakeFiles/Math.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="D:/New folder/4.1 Executables [EXCLUDE_FROM_ALL]/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Math.dir/math.cpp.obj"
	C:/w64devkit/bin/c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Math.dir/math.cpp.obj -MF CMakeFiles/Math.dir/math.cpp.obj.d -o CMakeFiles/Math.dir/math.cpp.obj -c "D:/New folder/4.1 Executables [EXCLUDE_FROM_ALL]/math.cpp"

CMakeFiles/Math.dir/math.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/Math.dir/math.cpp.i"
	C:/w64devkit/bin/c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "D:/New folder/4.1 Executables [EXCLUDE_FROM_ALL]/math.cpp" > CMakeFiles/Math.dir/math.cpp.i

CMakeFiles/Math.dir/math.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/Math.dir/math.cpp.s"
	C:/w64devkit/bin/c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "D:/New folder/4.1 Executables [EXCLUDE_FROM_ALL]/math.cpp" -o CMakeFiles/Math.dir/math.cpp.s

# Object files for target Math
Math_OBJECTS = \
"CMakeFiles/Math.dir/math.cpp.obj"

# External object files for target Math
Math_EXTERNAL_OBJECTS =

Math.exe: CMakeFiles/Math.dir/math.cpp.obj
Math.exe: CMakeFiles/Math.dir/build.make
Math.exe: CMakeFiles/Math.dir/linkLibs.rsp
Math.exe: CMakeFiles/Math.dir/objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir="D:/New folder/4.1 Executables [EXCLUDE_FROM_ALL]/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable Math.exe"
	"C:/Program Files/CMake/bin/cmake.exe" -E rm -f CMakeFiles/Math.dir/objects.a
	C:/w64devkit/bin/ar.exe qc CMakeFiles/Math.dir/objects.a @CMakeFiles/Math.dir/objects1.rsp
	C:/w64devkit/bin/c++.exe -g -Wl,--whole-archive CMakeFiles/Math.dir/objects.a -Wl,--no-whole-archive -o Math.exe -Wl,--out-implib,libMath.dll.a -Wl,--major-image-version,0,--minor-image-version,0 @CMakeFiles/Math.dir/linkLibs.rsp

# Rule to build all files generated by this target.
CMakeFiles/Math.dir/build: Math.exe
.PHONY : CMakeFiles/Math.dir/build

CMakeFiles/Math.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Math.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Math.dir/clean

CMakeFiles/Math.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "D:/New folder/4.1 Executables [EXCLUDE_FROM_ALL]" "D:/New folder/4.1 Executables [EXCLUDE_FROM_ALL]" "D:/New folder/4.1 Executables [EXCLUDE_FROM_ALL]/build" "D:/New folder/4.1 Executables [EXCLUDE_FROM_ALL]/build" "D:/New folder/4.1 Executables [EXCLUDE_FROM_ALL]/build/CMakeFiles/Math.dir/DependInfo.cmake" "--color=$(COLOR)"
.PHONY : CMakeFiles/Math.dir/depend

