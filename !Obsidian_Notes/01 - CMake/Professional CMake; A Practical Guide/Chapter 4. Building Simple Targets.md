
## 4.1 Executables
``` CMake
## More complete form of the basic add_executable() ##
add_executable(targetName [WIN32] [MACOSX_BUNDLE]
			[EXCLUDE_FROM_ALL]
			source1 [source2 ...]
)
```

- WIN32
	- When building the executable on a Windows platform, this option instructs CMake to build the executable as a Windows GUI application. In practice, this means it will be  related with a WinMain() entry point instead of just main() and it will be linked with the /SUBSYSTEM:WINDOWS option. On all other platforms, the WIN32 option is ignored.


- EXCLUDE_FROM_ALL
	- If there is more than one build type and one of them need occasionally, this option can be used.

## 4.2. Defining Libraries
The preferred practice is to not specify the the keyword that defining what type of library to build (Static, Shared). The choice determined by the value of a CMake variable called `BUILD_SHARED_LIBS`. If `BUILD_SHARED_LIBS` has been set to true.

``` 
## Bash ##
cmake -DBUILD_SHARED_LIBS=YES /path/to/source

## CMake ##
set(BUILD_SHARED_LIBS YES)
```


``` CMake
add_library(targetName [STATIC | SHARED | MODULE]
			[EXCLUDE_FROM_ALL]
			source1 [source2 ...]
)
```

- `EXCLUDE_FROM_ALL` burada gereksiz kütüphanelerin executable içine girmesini engelliyor, eğer o target için build edilmeyecek ise.

- STATIC
	- Specifies a static library or archive. On Windows, the default library name would be `targetName.lib`, while on Unix-like platforms, it would typically be `libtargetName.a`.
- SHARED
	- Specifies a shared or dynamically linked library. On Windows, the default library name would be `targetName.dll` and on other Unix-like platforms it would typically be `libtargetName.so`.
- MODULE
	- Specifies a library that is somewhat like a shared library, but is intended to be loaded dynamically at run-time rather than being linked directly to a library or executable. These are typically plugins or optional components the user may choose to be loaded or not. On Windows platforms, no import library is created for the DLL.

## 4.3. Linking Targets
There are a few different types of dependency relationships that can exist between libraries:

- PRIVATE
	- Private dependencies specify that library A uses library B in its own internal implementation. Anything else that links to library A doesn’t need to know about B because it is an internal implementation detail of A.
- PUBLIC
	- Public dependencies specify that not only does library A use library B internally, it also uses B in its interface. This means that A cannot be used without B, so anything that uses A will also have a direct dependency on B. An example of this would be a function defined in library A which has at least one parameter of a type defined and implemented in library B, so code cannot call the function from A without providing a parameter whose type comes from B.
- INTERFACE
	- Interface dependencies specify that in order to use library A, parts of library B must also be used. This differs from a public dependency in that library A doesn’t require B internally, it only uses B in its interface. An example of where this is useful is when working with library targets defined using the INTERFACE form of add_library(), such as when using a target to represent a header-only library’s dependencies


``` CMake
target_link_libraries(targetName 
				<PRIVATE|PUBLIC|INTERFACE> item1 [item2 ...] 
				[<PRIVATE|PUBLIC|INTERFACE> item3 [item4 ...]]
				...
)
```
- Bağlılıklar bu fonksiyon ile daha net belirtilebilir.


``` CMake
add_library(collector src1.cpp)
add_library(algo src2.cpp)
add_library(engine src3.cpp)
add_library(ui src4.cpp)
add_executable(myApp main.cpp)

target_link_libraries(collector
		PUBLIC ui
		PRIVATE algo engine
)
target_link_libraries(myApp PRIVATE collector)
```
- In this example, the ui library is linked to the collector library as PUBLIC, so even though myApp only directly links to collector, myApp will also be linked to ui because of that PUBLIC relationship. The algo and engine libraries, on the other hand, are linked to collector as PRIVATE, so myApp will not be directly linked to them.

## 4.4. Linking Non-targets
Eğer eklenmesini istediğimiz kütüphaneler belirtilen target (verdiğimiz dosya yolları muhtemelen) içerisinde değil ise geçerli olan bir durum.

- The `target_link_libraries()` command can be called with:
	- **Full path to a library file**
		- If the library file changes, CMake will detect that change and re-link the target.
	- **Plain library name**
		- The linker command will search for that library (e.g. foo becomes -lfoo or foo.lib, depending on the platform). This would be common for libraries provided by the system.
	- **Link flag**
		- As a special case, items starting with a hyphen other than -l or -framework will be treated as flags to be added to the linker command. The CMake documentation warns that these should only be used for PRIVATE items, since they would be carried through to other targets if defined as PUBLIC or INTERFACE and this may not always be safe.

## 4.6. Recommended Practices

1. Target names need not be related to the project name. It is common to see tutorials and examples use a variable for the project name and reuse that variable for the name of an executable target like so:
``` CMake
# Poor practice, but very common 
set(projectName MyExample)
project(${projectName})
add_executable(${projectName} ...)
```

2. When naming targets for libraries, resist the temptation to start or end the name with lib. On many platforms (i.e. just about all except Windows), a leading lib will be prefixed automatically when constructing the actual library name to make it conform to the platform’s usual convention. If the target name already begins with lib, the resultant library file names end up with the form liblibsomething…
   
3. Try to avoid specifying the STATIC or SHARED keyword for a library until it is known to be needed. The `BUILD_SHARED_LIBS` variable can be used to change the default in one place instead of having to modify every call to `add_library()`.
   
4. Aim to always specify PRIVATE, PUBLIC and/or INTERFACE keywords when calling the target_link_libraries() command rather than following the old-style CMake syntax which assumed everything was PUBLIC.