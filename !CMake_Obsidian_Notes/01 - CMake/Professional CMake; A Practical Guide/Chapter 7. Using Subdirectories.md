
### 7.1. add_subdirectory()

- The directory its called must have CMakeLists.txt

``` CMake
add_subdirectory(sourceDir [ binaryDir ] [ EXCLUDE_FROM_ALL ])
```
- The sourceDir does not have to be a subdirectory within the source tree. Any directory can be added, with sourceDir being specified as either an absolute or relative path.
- Normally, the binaryDir does not need to be specified. When omitted, CMake creates a directory in the build tree with the same name as the sourceDir. If sourceDir contains any path components, these will be mirrored in the binaryDir created by CMake.

#### 7.1.1. Source And Binary Directory Variables
- **CMAKE_SOURCE_DIR**
	- The top-most directory of the source tree (i.e. where the top-most CMakeLists.txt file resides). This variable never changes its value.
- **CMAKE_BINARY_DIR**
	- The top-most directory of the build tree. This variable never changes its value.
- **CMAKE_CURRENT_SOURCE_DIR**
	- The directory of the CMakeLists.txt file currently being processed by CMake. It is updated each time a new file is processed as a result of an add_subdirectory() call and is restored back again when processing of that directory is complete.
- **CMAKE_CURRENT_BINARY_DIR**
	- The build directory corresponding to the CMakeLists.txt file currently being processed by CMake. It changes for every call to add_subdirectory() and is restored again when add_subdirectory() returns.

``` CMake
## Top-level CMakeLists
cmake_minimum_required(VERSION 3.0)
project(MyApp)
message("top: CMAKE_SOURCE_DIR = ${CMAKE_SOURCE_DIR}")
message("top: CMAKE_BINARY_DIR = ${CMAKE_BINARY_DIR}")
message("top: CMAKE_CURRENT_SOURCE_DIR = ${CMAKE_CURRENT_SOURCE_DIR}") message("top: CMAKE_CURRENT_BINARY_DIR = ${CMAKE_CURRENT_BINARY_DIR}")

add_subdirectory(mysub)

message("top: CMAKE_CURRENT_SOURCE_DIR = ${CMAKE_CURRENT_SOURCE_DIR}") message("top: CMAKE_CURRENT_BINARY_DIR = ${CMAKE_CURRENT_BINARY_DIR}")
```

``` CMake
## sub-level CMakeLists
message(""mysub: CMAKE_SOURCE_DIR = ${CMAKE_SOURCE_DIR}")
message(""mysub: CMAKE_BINARY_DIR = ${CMAKE_BINARY_DIR}")
message(""mysub: CMAKE_CURRENT_SOURCE_DIR = ${CMAKE_CURRENT_SOURCE_DIR}") message(""mysub: CMAKE_CURRENT_BINARY_DIR = ${CMAKE_CURRENT_BINARY_DIR}")
```

```
top: CMAKE_SOURCE_DIR = /somewhere/src
top: CMAKE_BINARY_DIR = /somewhere/build
top: CMAKE_CURRENT_SOURCE_DIR = /somewhere/src
top: CMAKE_CURRENT_BINARY_DIR = /somewhere/build

mysub: CMAKE_SOURCE_DIR = /somewhere/src
mysub: CMAKE_BINARY_DIR = /somewhere/build
mysub: CMAKE_CURRENT_SOURCE_DIR = /somewhere/src/mysu
mysub: CMAKE_CURRENT_BINARY_DIR = /somewhere/build/mysub

top: CMAKE_CURRENT_SOURCE_DIR = /somewhere/src
top: CMAKE_CURRENT_BINARY_DIR = /somewhere/build
```

#### 7.1.1. Scope
- All variables defined in the calling scope will be visible to the child scope and the child scope can read their values like any other variable.
- Any new variable created in the child scope will not be visible to the calling scope.
- Any change to a variable in the child scope is local to that child scope. Even if that variable existed in the calling scope, the calling scope’s variable is left unchanged. The variable modified in the child scope acts like a new variable that is discarded when processing leaves the child scope.


### 7.1. include()

``` CMake
include(fileName [OPTIONAL] [RESULT_VARIABLE myVar] [NO_POLICY_SCOPE])
```

- include() expects the name of a file to read in, whereas add_subdirectory() expects a directory and will look for a CMakeLists.txt file within that directory. The file name passed to include() typically has the extension .cmake, but it can be anything.
- include() does not introduce a new variable scope, whereas add_subdirectory() does.
- The value of the CMAKE_CURRENT_SOURCE_DIR and CMAKE_CURRENT_BINARY_DIR variables do not change when processing the file named by include()

``` CMake
include(module [OPTIONAL] [RESULT_VARIABLE myVar] [NO_POLICY_SCOPE])
```
- The second form of the include() command serves an entirely different purpose. It is used to load the named module

It is important to note that the above three variables work for any file being processed by CMake, both for include() and add_subdirectory().
- **CMAKE_CURRENT_LIST_DIR**
	- Analogous to CMAKE_CURRENT_SOURCE_DIR except it will be updated when processing the included file. This is the variable to use where the directory of the current file being processed is required, no matter how it has been added to the build. It will always hold an absolute path.
- **CMAKE_CURRENT_LIST_FILE**
	- Always gives the name of the file currently being processed. It always holds an absolute path to the file, not just the file name.
- **CMAKE_CURRENT_LIST_LINE**
	- Holds the line number of the file currently being processed. This variable is rarely needed, but may prove useful in some debugging scenarios.

## 7.4. Recommended Practices
- add_subdirectory() is simpler and does a better job of keeping directories relatively self contained because it creates its own scope. On the other, some CMake commands have restrictions which only allow them to operate on things defined within the current file scope, so include() works better for those cases. Section 28.5.1, “Target Sources”.

- Irrespective of whether using add_subdirectory(), include() or a combination of both, the CMAKE_CURRENT_LIST_DIR variable is generally going to be a better choice than CMAKE_CURRENT_SOURCE_DIR. By establishing the habit of using CMAKE_CURRENT_LIST_DIR early, it is much easier to switch between add_subdirectory() and include() as a project grows in complexity and to move entire directories to restructure a project.

- If the project requires CMake 3.10 or later, prefer to use the include_guard() command without arguments instead of an explicit if-endif block in cases where multiple inclusion of a file must be prevented.