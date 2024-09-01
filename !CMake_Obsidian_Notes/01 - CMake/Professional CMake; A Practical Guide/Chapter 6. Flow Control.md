The ubiquitous if() command provides the expected if-then-else behavior and looping is provided through the foreach() and while() commands. All three commands provide the traditional behaviour as implemented by most programming languages, but they also have added features specific to CMake.

## 6.1. The if() Command

``` CMake
if(expression1) 
	# commands ...
elseif(expression2)
	# commands ...
else()
	# commands ... 
endif()
```
- expression1 to be repeated as an argument to the else() and endif() clauses, but this has not been required since CMake 2.8.0
- CMake offers the traditional boolean logic as well as various other conditions such as file system tests, version comparison and testing for the existence of things.

### 6.1.1. Basic Expressions

``` CMake
if(value)
```
- If value is an unquoted constant with value 1, ON, YES, TRUE, Y or a non-zero number, it is treated as true. The test is case-insensitive.
- If value is an unquoted constant with value 0, OFF, NO, FALSE, N, IGNORE, NOTFOUND, an empty string or a string that ends in -NOTFOUND, it is treated as false. Again, the test is case-insensitive.
- If neither of the above two cases apply, it will be treated as a variable name.


``` CMake
# Examples of unquoted constants
if(YES)
if(0)
if(TRUE)
# These are also treated as unquoted constants because the # variable evaluation occurs before if() sees the values
set(A YES)
set(B 0)
if(${A}) # Evaluates to true
if(${B}) # Evaluates to false
 
# Does not match any of the true or false constants, so proceed
# to testing as a variable name in the fall through case below
if(someLetters)

# Quoted value, so bypass the true/false constant matching
# and fall through to testing as a variable name or string
if("someLetters")
```
- When an unquoted variable name is used, the variable’s value is compared against the false constants. If none of those match the value, the result of the expression is true.
- An undefined variable will evaluate to an empty string, which matches one of the false constants and will therefore yield a result of false.
- A quoted string always evaluates to false in CMake 3.1 or later, regardless of the string’s value
- Before CMake 3.1, if the value of the string matched the name of an existing variable, then the quoted string is effectively replaced by that variable name (unquoted) and the test is then repeated

Both of the above can be a surprise to developers, but at least the CMake 3.1 behaviour is always predictable. The pre-3.1 behaviour would occasionally lead to unexpected string substitutions when the string value happened to match a variable name

### 6.1.2. Logic Operators

``` CMake
# Logical operators
if(NOT expression)
if(expression1 AND expression2)
if(expression1 OR expression2)

# Example with parentheses
if(NOT (expression1 AND (expression2 OR expression3)))
```

### 6.1.3. Comparison Tests
``` CMake
if(value1 OPERATOR value2)
```
- value1 and value2, can be either variable names or (possibly quoted) values
	- If a value is the same as the name of a defined variable, it will be treated as a variable.
	- Otherwise, it is treated as a string or value directly.
	  
- Prior to CMake 3.1, a quoted string with a value that matched a variable name would be replaced by the value of that variable. The behaviour of CMake 3.1 and later uses the quoted value without substitution
  
![[Pasted image 20240825000114.png]]

``` CMake
# Valid numeric expressions, all evaluating as true
if(2 GREATER 1)
if("23" EQUAL 23)

set(val 42)
if(${val} EQUAL 42)
if("${val}" EQUAL 42)

# Invalid expression that evaluates as true with at # least some CMake versions. Do not rely on this behavior.
if("23a" EQUAL 23)
```

**For Versions**
Version number comparisons are somewhat like an enhanced form of numerical comparisons. Version numbers are assumed to be in the form `major[.minor[.patch[.tweak]]]` where each component is expected to be a non-negative integer
- but the comparison result is essentially undefined if this restriction does not hold.
``` CMake
if(1.2 VERSION_EQUAL 1.2.0)
if(1.2 VERSION_LESS 1.2.3)
if(1.2.3 VERSION_GREATER 1.2 )
if(2.0.1 VERSION_GREATER 1.9.7)
if(1.8.2 VERSION_LESS 2 )
```
**End**


``` CMake
if(value MATCHES regex)

## Example ##
if("Hi from ${who}" MATCHES "Hi from (Fred|Barney).*")
	message("${CMAKE_MATCH_1} says hello")
endif()
```

-Parentheses can be used to capture parts of the matched value. The command will set variables with names of the form `CMAKE_MATCH_<n>` where `<n>` is the group to match. The entire matched string is stored in group 0

### 6.1.4. File System Tests

``` CMake
if(EXISTS pathToFileOrDir)
if(IS_DIRECTORY pathToDir)
if(IS_SYMLINK fileName)
if(IS_ABSOLUTE path)
if(file1 IS_NEWER_THAN file2)
```
- IS_NEWER_THAN operator returns true if either file is missing or if both files have the same timestamp. It would not be unusual to test for the existence of file1 and file2 before performing the actual IS_NEWER_THAN test
- Full paths should also be given when using IS_NEWER_THAN, since the behaviour for relative paths is not well defined.
- The other point to note is that, unlike most other if expressions, none of the file system operators perform any variable/string substitution without ${}, regardless of any quoting.

### 6.1.5. Existence Tests
- if expressions support testing whether or not various CMake entities exist.
- Particularly useful in larger, more complex projects where some parts might or might not be present or be enabled.

``` CMake
if(DEFINED name)
## Example ##
# Returns true if a variable of the specified name exists
if(DEFINED SOMEVAR) # Checks for a CMake variable
if(DEFINED ENV{SOMEVAR}) # Checks for an environment variable

if(COMMAND name)
if(POLICY name)
if(TARGET name)
if(TEST name) # Available from CMake 3.4 onward
if(value IN_LIST listVar) # Available from CMake 3.5 onward
```
- DEFINED
	- Returns true if a variable of the specified name exists.
- COMMAND
	- This is most useful for checking whether something is defined before trying to use it.
	- For project-supplied functions and macro, testing for their existence with a COMMAND test may be useful.
- POLICY
	- Tests whether a particular policy is known to CMake. Policy names are usually of the form CMPxxxx, where the xxxx part is always a four digit number.
- TARGET
	- Returns true if a CMake target of the specified name has been defined by one of the commands add_executable(), add_library() or add_custom_target().
	- The target could have been defined in any directory, as long as it is known at the point where the if test is performed
- TEST
	- Returns true if a CMake test with the specified name has been previously defined by the add_test() command.
- IN_LIST
	- This expression will return true if the variable listVar contains the specified value, where value follows the usual variable-or-string rules but listVar must be the name of a list variable.


### 6.1.6. Common Examples

Use compiler not the environment
``` CMake
## WRONG ##
if(WIN32)
	set(platformImpl source_win.cpp)
else()
	set(platformImpl source_generic.cpp)
endif()

## BETTER ##
if(MSVC)
	set(platformImpl source_msvc.cpp)
else()
	set(platformImpl source_generic.cpp)
endif()
```


``` CMake
option(BUILD_MYLIB "Enable building the myLib target")
if(BUILD_MYLIB)
	add_library(myLib src1.cpp src2.cpp)
endif()
```

## 6.2. Looping

**foreach()***

**while()***
