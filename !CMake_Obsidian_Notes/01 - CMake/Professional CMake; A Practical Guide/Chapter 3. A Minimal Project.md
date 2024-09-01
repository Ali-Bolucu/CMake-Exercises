## 3.0 Intro

``` CMake
## Basic project ##
cmake_minimum_required(VERSION 3.2)
project(MyApp)
add_executable(myExe main.cpp)
```
- Command names are also case insensitive.
- they do not return values directly (but a later chapter shows how to pass values back to the caller in other ways).


## 3.1. Managing CMake versions

``` CMake
cmake_minimum_required(VERSION major.minor[.patch[.tweak]])
```
- The VERSION keyword must always be present and the version details provided must have at least the major.minor part.

## 3.2. The project() Command
- project() command and it should appear after cmake_minimum_required().

``` CMake
project(projectName 
	[VERSION major[.minor[.patch[.tweak]]]]
	[LANGUAGES languageName ...]
)
```

- If no LANGUAGES option is provided, CMake will default to C and CXX. CMake versions prior to 3.0 do not support the LANGUAGES keyword.
``` CMake
project(myProj C CXX)
```

- One of its important responsibilities is to check the compilers for each enabled language and ensure they are able to compile and link successfully.
- If the CMakeLists.txt file does not call project() or does not call it early enough, CMake will implicitly call it internally for the default languages C and CXX.
- Compiler and linker checks performed by CMake are successful, their results are cached to the CMakeCache.txt
  
## 3.3. Building A Basic Executable

- Köşeli parantezler olmasa olur dediğimiz parametreler için.
``` CMake
add_executable(targetName source1 [source2 ...])
```

- Multiple executables can also be defined within the one CMakeLists.txt file by calling add_executable() multiple times with different target names.
