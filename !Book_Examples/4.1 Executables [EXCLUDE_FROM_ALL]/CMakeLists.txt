cmake_minimum_required(VERSION 3.26)
project(optional_exe_test)
# Main executable target
add_executable(App main.cpp)

add_executable(Math math.cpp)
set_target_properties(Math PROPERTIES EXCLUDE_FROM_ALL TRUE)

add_executable(Anotherlib anotherlib.cpp)
set_target_properties(Anotherlib PROPERTIES EXCLUDE_FROM_ALL TRUE)

# Add a custom target to build the excluded targets
add_custom_target(build_all_excluded
    DEPENDS Math Anotherlib
)
