
## 5.1. Variable Basics
``` CMake
set(varName value... [PARENT_SCOPE])
```

- In CMake, a variable has a particular scope. 
- A variable cannot be read or modified outside of its scope. Compared to other languages, variable scope is a little more flexible in CMake.

- CMake treats all variables as strings
``` CMake
set(myVar a b c) # myVar = "a;b;c"
set(myVar a;b;c) # myVar = "a;b;c"
set(myVar "a b c") # myVar = "a b c"
set(myVar a b;c) # myVar = "a;b;c"
set(myVar a "b c") # myVar = "a;b c"
```

- CMake doesn’t require variables to be defined before using them. Use of an undefined variable simply results in an empty string being substituted with no error or warning.
``` CMake
set(foo ab) # foo = "ab" 
set(bar ${foo}cd) # bar = "abcd"
set(baz ${foo} cd) # baz = "ab;cd"
set(myVar ba) # myVar = "ba"
set(big "${${myVar}r}ef") # big = "${bar}ef" = "abcdef" 
set(${foo} xyz) # ab = "xyz"
set(bar ${notSetVar}) # bar = ""
```

- If using CMake 3.0 or later,
	- Start of the content is marked by `[=[` and the end with `]=]`. Bu tür yapıda başta ve sonda eşit sayıda "=" olmalı, kalan köşeli parantez arasında istenilen metin olabilir.
	- If the opening brackets are immediately followed by a newline character, that first newline is ignored, but subsequent newlines are not.
``` CMake
# Simple multi-line content with bracket syntax,
# no = needed between the square bracket markers 
set(multiLine [[
First line
Second line
]])

# Bracket syntax prevents unwanted substitution
set(shellScript [=[ 
#!/bin/bash
[[ -n "${USER}" ]] && echo "Have USER"
]=])

# Equivalent code without bracket syntax
set(shellScript
"#!/bin/bash
[[ -n \"\${USER}\" ]] && echo \"Have USER\"
")
```

- A variable can be unset either by calling unset() or by calling set() with no value for the named variable.
``` CMake
set(myVar)
unset(myVar)
```

## 5.2. Environment Variables

- CMake also allows the value of environment variables to be retrieved and set using a modified form of the normal variable notation.
- Environment variable is obtained using the special form `$ENV{varName}`.
- However, that setting an environment variable like this only affects the currently running CMake instance. In particular, the change to the environment variable will not be visible at build time. Therefore, setting environment variables within the CMakeLists.txt file like this is rarely useful.

``` CMake
## ENV kelimesi ile ortam değişkeni haline getirilebiliyor ##
set(ENV{PATH} "$ENV{PATH}:/opt/myDir")
```

## 5.3. Cache Variables

- Cache variables are stored in the special file called CMakeCache.txt in the build directory and they persist between CMake runs.
- Stayed there until explicitly deleted.
- The main reason for this is that cache variables are primarily intended as a customization point for developers. Rather than hard-coding the value in the CMakeLists.txt file as a normal variable, a cache variable can be used so that the developer can override the value without having to edit the CMakeLists.txt file

``` CMake
set(varName value... CACHE type "docstring" [FORCE])
```
- `type` and `docstring` variables used in "CMake GUI", they do not effect how the CMake treats the Cache variable.
- `docstring` can be empty string but both must be present.
- `type` can be:
	- BOOL
	- FILEPATH
	- PATH
	- STRING
	- INTERNAL : Not available for user like others

**Another way for setting BOOL variable**
- Its common to define bool variables so there is shortcut for this.

``` CMake
option(optVar helpString [initialValue])

## Same with ##
set(optVar initialValue CACHE BOOL helpString)
```
- If there is no `initialValue`, it is set to OFF.
  
- Main difference of normal and cache variable is `set` change the cached variable if "FORCE" keyword is given. In normal usage in `set`, it always overwrite the variables.

 **Variable Race**
 ``` CMake
set(myVar foo) # Local myVar
set(result ${myVar}) # result = foo

set(myVar bar CACHE STRING "") # Cache myVar

set(result ${myVar}) # First run: result = bar
                     # Subsequent runs: result = foo

set(myVar fred)
set(result ${myVar}) # result = fred
```
 - It is possible to have a normal variable and a cache variable with the same name but holding different values.
 - `${myVar}` will call the normal variable, not the cache variable.
	 - If cache variable set or forced at current run, normal variable in the current scope is effectively removed.
	 - Sonraki CMake koşularında ise hali hazırda cache değişkeni olduğu için CMake normal değişkeni cache değişkenine tercih edecek.
	 - Bu durum da ilk ve sonraki CMake run'larında farklı durumlar oluşmasına sebebiyet verecek.

## 5.4. Manipulating Cache Variables
Using set() and option(), a project can build up a useful set of customization points for its developers. Different parts of the build can be turned on or off, paths to external packages can be set, flags for compilers and linkers can be modified and so on. The ways to manipulate such variables need to be understood first.

### 5.4.1. Setting Cache Values On The Command Line
- When defining cache variables this way, they do not have to be set within the CMakeLists.txt
``` CMake
## Set variable ##
cmake -D myVar:type=someValue ...
## Unset variable ##
cmake -U 'help*' -U foo ...

## Example ##
cmake -D foo:BOOL=ON ...
cmake -D "bar:STRING=This contains spaces" ... 
cmake -D hideMe=mysteryValue ...
cmake -D helpers:FILEPATH=subdir/helpers.txt ... 
cmake -D helpDir:PATH=/opt/helpThings ...
```

### 5.4.2. CMake GUI Tools
- CMake provides two equivalent GUI tools, cmake-gui and ccmake.

- When running cmake from the command line, both configure stage and generate stage are executed automatically.
- Each time the configure step is initiated, the cache variables shown in the middle of the UI are updated.
- Good practice is to re-run the configure stage until there are no changes, since this ensures robust behavior for more complex projects.

This will appear as combo-box in GUI
``` CMake
## Red, Orange, Green can be selected ##
set(trafficLight Green CACHE STRING "Status of something") 
set_property(CACHE trafficLight PROPERTY STRINGS Red Orange Green)
```


By default, cmake-gui only shows non-advanced variables.
Enabling the Advanced option shows all cache variables except those marked INTERNAL (the only way to see INTERNAL variables is to edit the CMakeCache.txt file with a text editor.
``` CMake
mark_as_advanced([CLEAR|FORCE] var1 [var2...])
```
- The CLEAR keyword ensures the variables are not marked as advanced.
- The FORCE keyword ensures the variables are marked advanced.


## 5.5. Debugging Variables And Diagnostics

``` CMake
message([mode] msg1 [msg2]...)

## Example for quotes ##
message("The value of myVar = ${myVar}")
```
- If more than one msg is specified, they will be joined together into a single string without any separators. So the more common usage is a single msg with the message surrounded by quotes to preserve spaces.

- **STATUS**
	- Incidental information. Messages will normally be preceded by two hyphens.
- **WARNING**
	- usually shown highlighted in red where supported. Processing will continue.
- **AUTHOR_WARNING**
	- Like WARNING, but only shown if developer warnings are enabled (requires the -Wdev option on the cmake command line). Projects do not often use this particular type of message.
- **SEND_ERROR**
	- Will be shown highlighted in red. Processing will continue until the configure stage completes, but generation will not be performed. This is like an error that allows further processing to be attempted, but ultimately still indicates a failure.
- **FATAL_ERROR**
	- The message will be printed and processing will stop immediately. The log will also normally record the location of the fatal message() command.
- **DEPRECATION**
	- Special category used to log a deprecation message. If the CMAKE_ERROR_DEPRECATED variable is defined to a boolean true value, the message will be treated as an error. If CMAKE_WARN_DEPRECATED is defined to a boolean true, the message will be treated as a warning. If neither variable is defined, the message will not be shown.
- If no mode keyword is provided, then the message is considered to be important information and is logged without any modification.

> [!warning]
> When using a STATUS mode, the message will be printed correctly ordered with other CMake messages and will be preceded by two hyphens, whereas without any mode keyword, no leading hyphens are prepended and it is not unusual for the message to appear out of order relative to other messages which did include a mode keyword.

**Another Way**
When a variable is watched, all attempts to read or modify it are logged.
``` CMake
variable_watch(myVar [command])
```


## 5.6. String Handling
- Perform find and replace operations, regular expression matching, upper/lower case transformations, strip whitespace and other common tasks.
- The CMake reference documentation should be considered the canonical source of all available operations.

**FIND**
``` CMake
string(FIND inputString subString outVar [REVERSE])
string(FIND ${inputString} ${subString} outVar [REVERSE])
```
- FINDs the substr in inputstr.
- (the first character is index 0)
- Gives index of first occurrence if substr
- If REVERSE is given, gives index of last occurrence
- if it could not found, set the "outvar" to -1.

```CMake
set(longStr abcdefabcdef)
set(shortBit def)

string(FIND ${longStr} ${shortBit} fwdIndex)
string(FIND ${longStr} ${shortBit} revIndex REVERSE)
message("fwdIndex = ${fwdIndex}, revIndex = ${revIndex}")

## Output ##
fwdIndex = 3, revIndex = 9
```


**REPLACE**
- The REPLACE operation will replace every occurrence of matchString in the input strings with replaceWith and store the result in outVar.
- Inputs are joined together at output string.
``` CMake
string(REPLACE matchString replaceWith outVar input [input...])
```

``` CMake
## Template ##
string(REGEX MATCH regex outVar input [input...])
string(REGEX MATCHALL regex outVar input [input...]) 
string(REGEX REPLACE regex replaceWith outVar input [input...])

## Example ##
set(longStr abcdefabcdef)
string(REGEX MATCHALL "[ace]" matchVar ${longStr})
string(REGEX REPLACE "([de])" "X\\1Y" replVar ${longStr})
message("matchVar = ${matchVar}")
message("replVar = ${replVar}")

## Output ##
matchVar = a;c;e;a;c;e
replVar = abcXdYXeYfabcXdYXeYf
```

``` CMake
## More Example ##
string(LENGTH input outVar)
string(TOLOWER input outVar)
string(TOUPPER input outVar)
string(STRIP input outVar)
```

## 5.7. Lists
- Like for the string() command, list() expects the operation to perform as its first argument. The second argument is always the list to operate on and it must be a variable (i.e. passing a raw list like a;b;c is not permitted).
- Those mentioned are all supported since at least CMake 3.0
``` CMake
## Template ##
list(LENGTH listVar outVar)
list(GET listVar index [index...] outVar)

## Example ##
set(myList a b c) # Creates the list "a;b;c"
list(LENGTH myList len)
message("length = ${len}") # length = 3

list(GET myList 2 1 letters)
message("letters = ${letters}") # letters = c;b 
```

``` CMake
## Template ##
list(APPEND listVar item [item...])
list(INSERT listVar index item [item...])

## Example ##
set(myList a b c)
list(APPEND myList d e f)
message("myList (first) = ${myList}") # "myList first = a;b;c;d;e;f

list(INSERT myList 2 X Y Z)
message("myList (second) = ${myList}") # myList (second) = a;b;X;Y;Z;c;d;e;f
```

``` CMake
## Template ##
list(REMOVE_ITEM myList value [value...])
list(REMOVE_AT myList index [index...])
list(REMOVE_DUPLICATES myList)
list(REVERSE myList)
list(SORT myList)
```

## 5.8. Math

``` CMake
## Template ##
math(EXPR outVar mathExpr)

## Example ##
set(x 3)
set(y 7)
math(EXPR z "(${x}+${y}) / 2")

message("result = ${z}") # result = 5
```

## 5.9. Recommended Practices
1. Try to avoid relying on environment variables being defined, apart from perhaps the ubiquitous PATH or similar operating system level variables. The build should be predictable, reliable and easy to set up, but if it relies on environment variables being set for things to work correctly, this can be a point of frustration for new developers as they wrestle to get their build environment set up.
   
2. The environment at the time CMake is run can change compared to when the build itself is invoked. Therefore, prefer to pass information directly to CMake through cache variables instead wherever possible.
   
3. For log messages intended to remain as part of the build, aim to always specify a mode with the message() command. If the message is of a general informational nature, prefer to use STATUS rather than no mode keyword at all so that message output does not appear out of order in the build log. Temporary debugging messages frequently use no mode keyword for convenience, but if they are likely to remain part of the project for any length of time, it is better that they too specifying a mode (typically STATUS).
   
4. CMake provides a large number of pre-defined variables that provide details about the system or influence certain aspects of CMake’s behavior. Some of these variables are heavily used by projects, such as those that are only defined when building for a particular platform (WIN32, APPLE, UNIX, etc.). It is therefore recommended for developers to occasionally make a quick scan through the CMake documentation page listing the pre-defined variables to help become familiar with what is available.
