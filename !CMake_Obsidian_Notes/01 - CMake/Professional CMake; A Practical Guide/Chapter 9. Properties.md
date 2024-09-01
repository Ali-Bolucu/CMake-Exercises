#EKSIK
- [ ] Burasi eksik oldu anlamadim tekrar bakarsin sonra

Properties are sometimes confused with variables. Though both may initially seem similar in terms of function and features, properties serve a very different purpose.

## 9.1. General Property Commands

``` CMake
set_property(entitySpecific 
			[APPEND] [APPEND_STRING]
			PROPERTY propName [value1 [value2 [...]]])

#entitySpecific defines the entity whose property is being set. It must be one of the following:
GLOBAL
DIRECTORY [dir]
TARGET [target1 [target2 [...]]]
SOURCE [source1 [source2 [...]]]
INSTALL [file1 [file2 [...]]]
TEST [test1 [test2 [...]]]
CACHE [var1 [var2 [...]]]
```

- GLOBAL
	- Means build itself.
- DIRECTORY
	- if no dir is named, the current source directory is used.
- OTHERS
	- Any number of items of that type can be listed.

``` CMake
get_property(resultVar entitySpecific
			PROPERTY propName
			[DEFINED | SET | BRIEF_DOCS | FULL_DOCS])

GLOBAL
DIRECTORY [dir]
TARGET target
SOURCE source
INSTALL file
TEST test
CACHE var
VARIABLE
```

## 9.2. Global Properties

- Global properties relate to the overall build as a whole.
``` CMake
get_cmake_property(resultVar property)
```

- VARIABLES
	- Return a list of all regular (i.e. non-cache) variables.
- CACHE_VARIABLES
	- Return a list of all cache variables.
- COMMANDS
	- Return a list of all defined commands, functions and macros. Commands are pre-defined by CMake, whereas functions and macros can be defined either by CMake (typically through modules) or by projects themselves.
- MACROS
	- Return a list of just the defined macros
- COMPONENTS
	- Return a list of all components defined by install() commands


## 9.4. Target Properties
Few things in CMake have such a strong and direct influence on how targets are built as target properties.

``` CMake
set_target_properties(target1 [target2...]
					PROPERTIES
					propertyName1 value1
					[propertyName2 value2] ... )

get_target_property(resultVar target propertyName)
```
- set_target_properties() lacks the full flexibility of set_property() but provides a simpler syntax for common cases.
- set_target_properties() command requires that value to be specified in string form, e.g. "this;is;a;list"



## 9.8. Recommended Practices
- For target properties, use of the various target_…() commands is strongly recommended over manipulating the associated target properties directly. These commands not only manipulate the properties on specific targets, they also set up dependency relationships between targets so that CMake can propagate some properties automatically.