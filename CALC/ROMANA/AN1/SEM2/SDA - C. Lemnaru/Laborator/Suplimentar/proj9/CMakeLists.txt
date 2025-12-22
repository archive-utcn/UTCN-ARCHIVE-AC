cmake_minimum_required(VERSION 3.0.0)
project(proj9 VERSION 0.1.0)

include(CTest)
enable_testing()

add_executable(proj9 main.c)

add_subdirectory(lib proj9)
target_link_libraries(proj9 intGraph)

# -Wall
target_compile_options(proj9 PUBLIC -Wall)

# add test
add_test(NAME test1 COMMAND proj9)
# set(CTEST_FULL_OUTPUT ON)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
