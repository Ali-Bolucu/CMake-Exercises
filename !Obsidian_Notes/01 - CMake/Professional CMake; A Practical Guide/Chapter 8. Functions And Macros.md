
## 8.1. The Basics

``` CMake
function(name [arg1 [arg2 [...]]])
	# Function body (i.e. commands) ...
endfunction()

macro(name [arg1 [arg2 [...]]])
	# Macro body (i.e. commands) ...
endmacro()
```
- Functions introduce a new scope and the function arguments become variables accessible inside the function body.
- Macros, on the other hand, effectively paste their body into the point of the call and the macro arguments are substituted as simple string replacements.

``` CMake
function(print_me)
	message("Hello from inside a function")
	message("All done")
endfunction()

# Called like so:
print_me()
```

## 8.2. Argument Handling Essentials

``` CMake
function(func arg)
	if(DEFINED arg)
		message("Function arg is a defined variable")
	else()
		message("Function arg is NOT a defined variable") 
	endif()
endfunction()

macro(macr arg)
	if(DEFINED arg)
		message("Macro arg is a defined variable")
	else()
		message("Macro arg is NOT a defined variable")
	endif()
endmacro()

func(foobar)
macr(foobar)
```

Macro string olarak yapıştırdığı için hatalı olabiliyor. Değişkeni string olarak algıladı.
``` CMake
Function arg is a defined variable
Macro arg is NOT a defined variable
```


- ARGC
	- This will be set to the total number of arguments passed to the function. It counts the named arguments plus any additional unnamed arguments that were given.
- ARGV
	- This is a list variable containing each of the arguments passed to the function, including both the named arguments and any additional unnamed arguments that were given.
- ARGN
	- Like ARGV, except this only contains arguments beyond the named ones (i.e. the optional, unnamed arguments).

``` CMake
function(add_mytest targetName)
	add_executable(${targetName} ${ARGN})
	target_link_libraries(${targetName} PRIVATE foobar)
	
	add_test(NAME ${targetName}
			COMMAND ${targetName} )
endfunction()

add_mytest(smallTest small.cpp)
add_mytest(bigTest big.cpp algo.cpp net.cpp)
```