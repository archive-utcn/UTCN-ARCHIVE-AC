cmake_minimum_required(VERSION 3.0.0)
project(colocviu VERSION 0.1.0)

include(CTest)
enable_testing()

add_executable(colocviu main.c)

add_subdirectory(lib colocviu)
target_link_libraries(colocviu hash)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
