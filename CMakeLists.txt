 cmake_minimum_required(VERSION 2.8.12)
 project(timedctl)

 add_definitions("-std=c++11")

 include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
 conan_basic_setup()

 add_executable(timedctl timedctl.cpp)
 target_link_libraries(timedctl ${CONAN_LIBS})
