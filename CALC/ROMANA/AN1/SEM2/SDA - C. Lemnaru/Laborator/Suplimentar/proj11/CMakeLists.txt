cmake_minimum_required(VERSION 3.0.0)
project(proj11 VERSION 0.1.0)

include(CTest)
enable_testing()

add_executable(proj11 main_hanoi.c)

add_subdirectory(lib proj11)

target_link_libraries(proj11 intArray)
target_link_libraries(proj11 stack)

# -Wall
target_compile_options(proj11 PUBLIC -Wall)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
