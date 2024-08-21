
## 2.0 Intro
There is 2 main directory
- Binary (Build)
- Source


## 2.3. Generating Project Files
- CMake creates project files in build directory.
- Dev selects a project file generator to generate project files.
	- Visual Studio
	- Xcode
	- Ninja
	- Makefiles (Unix, Msys, MinGW, NMake)


``` Bash
## Basic build ##
mkdir build 
cd build
cmake -G "Unix Makefiles" ../source
```
- If the -G option is omitted, CMake will choose a default generator type based on the host platform.


- When CMake has completed its run, it will have saved a CMakeCache.txt file in the build directory.

## 2.4. Running The Build Tool

 After the project files created, we can invoke the build tool through IDE or cmake can do on our behalf as:
``` CMake
cmake --build /some/path/build --config Debug --target MyApp
```
- For multi configuration generators, the --config option specifies which configuration to build, whereas single configuration generators will ignore the --config option


``` Bash
## Automated Build ##
mkdir build
cd build
cmake -G "Unix Makefiles" ../source cmake --build . --config Release --target MyApp
```

## 2.5. Recommended Practices

- Set up 2 or more build directory for:
	- Release build
	- Debug build
	- Different project generators such Unix or Xcode
