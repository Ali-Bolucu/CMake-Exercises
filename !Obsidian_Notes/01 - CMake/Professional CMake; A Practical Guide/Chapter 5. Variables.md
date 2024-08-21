
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

# Bracket syntax prevents unwanted substitution set(shellScript [=[ #!/bin/bash
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

- Cache variables are stored in the special file called CMakeCache.txt in the build directory and they persist between CMake runs
- Stayed there until explicitly deleted

``` CMake
set(varName value... CACHE type "docstring" [FORCE])
```


