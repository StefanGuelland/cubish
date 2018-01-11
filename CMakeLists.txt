cmake_minimum_required(VERSION 3.9)
project(cubish)

set(CMAKE_CXX_STANDARD 17)

# Problem aus Flatpak
SET(GCC_COVERAGE_LINK_FLAGS "-Wl,--dynamic-linker=/lib64/ld-linux-x86-64.so.2")
SET(CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} ${GCC_COVERAGE_LINK_FLAGS}" )

#https://cmake.org/cmake/help/v3.0/module/FindFLEX.html
find_package(BISON)
find_package(FLEX)

BISON_TARGET(MyParser parser.y ${CMAKE_CURRENT_BINARY_DIR}/parser.cpp)
FLEX_TARGET(MyScanner lexer.l  ${CMAKE_CURRENT_BINARY_DIR}/lexer.cpp)
ADD_FLEX_BISON_DEPENDENCY(MyScanner MyParser)


include_directories(${CMAKE_CURRENT_BINARY_DIR})
add_executable(cubish
#        main.cpp
        ${BISON_MyParser_OUTPUTS}
        ${FLEX_MyScanner_OUTPUTS}
        )