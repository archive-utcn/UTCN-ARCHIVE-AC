add_library(
    hash
    ./hash/hash.c
    ./hash/hash.h
)

target_include_directories(
    hash
    PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/hash
)