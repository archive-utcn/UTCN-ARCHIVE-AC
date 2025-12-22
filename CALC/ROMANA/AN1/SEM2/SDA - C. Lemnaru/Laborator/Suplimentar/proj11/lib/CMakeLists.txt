add_library(
    intArray
    ./array/array_int.c
    ./array/array_int.h
)

target_link_libraries(
    intArray
    PUBLIC 
    ${CMAKE_CURRENT_SOURCE_DIR}/array
)

target_include_directories(
    intArray
    PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/array
)

#####################
add_library(
    stack
    ./stack/intStack.h
    ./stack/intStack.c
)

target_link_libraries(
    stack
    PUBLIC 
    ${CMAKE_CURRENT_SOURCE_DIR}/stack
)

target_include_directories(
    stack
    PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/stack
)