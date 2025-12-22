add_library(
    array
    array/array_int.c
    array/array_int.h
)

add_library(
    vector
    vector/Vector.c
    vector/Vector.h
)

add_library(
    intGraph
    intGraph/intGraph.c
    intGraph/intGraph.h
)

add_library(
    queue
    intQueue/intQueue.c
    intQueue/intQueue.h
)

add_library(
    stack
    intStack/intStack.c
    intStack/intStack.h
)

target_include_directories(
    array
    PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/array
)

target_include_directories(
    vector
    PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/vector
)

target_include_directories(
    queue
    PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/intQueue
)

target_include_directories(
    stack
    PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/intStack
)

target_include_directories(
    intGraph
    PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/intGraph
    ${CMAKE_CURRENT_SOURCE_DIR}/array
    ${CMAKE_CURRENT_SOURCE_DIR}/vector
    ${CMAKE_CURRENT_SOURCE_DIR}/intQueue
    ${CMAKE_CURRENT_SOURCE_DIR}/intStack
)

target_link_libraries(
    intGraph
    PUBLIC
    array
    vector
    queue
    stack
)

