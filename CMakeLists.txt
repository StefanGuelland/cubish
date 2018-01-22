cmake_minimum_required(VERSION 3.9)
project(cubish)

set(CMAKE_CXX_STANDARD 17)

#SET(CMAKE_CXX_FLAGS "-D_GLIBCXX_USE_CXX11_ABI=0") # fuer alte c++ api

# Problem aus Flatpak
SET(GCC_COVERAGE_LINK_FLAGS "-Wl,--dynamic-linker=/lib64/ld-linux-x86-64.so.2")
SET(CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} ${GCC_COVERAGE_LINK_FLAGS}" )

#https://cmake.org/cmake/help/v3.0/module/FindFLEX.html
find_package(BISON REQUIRED)
find_package(FLEX REQUIRED)

BISON_TARGET(MyParser parser.y ${CMAKE_CURRENT_BINARY_DIR}/parser.cpp VERBOSE)
FLEX_TARGET(MyScanner lexer.l  ${CMAKE_CURRENT_BINARY_DIR}/lexer.cpp)
ADD_FLEX_BISON_DEPENDENCY(MyScanner MyParser)


include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/artnet)
add_executable(cubish
        ${BISON_MyParser_OUTPUTS}
        ${FLEX_MyScanner_OUTPUTS}
        Identifier.h
        Identifier.cpp
        artnet_client.c
        artnet_client.h
        ParseTree.cpp
        ParseTree.h
        ParseTreeNode_Interface.h parseTree/ErstelleZahl.cpp parseTree/ErstelleZahl.h parseTree/ErstelleWuerfel.cpp parseTree/ErstelleWuerfel.h parseTree/ErstelleBox.cpp parseTree/ErstelleBox.h parseTree/VerschiebeUm.cpp parseTree/VerschiebeUm.h parseTree/VerschiebeAuf.cpp parseTree/VerschiebeAuf.h parseTree/ProgramBlock.cpp parseTree/ProgramBlock.h parseTree/FaerbeAuf.cpp parseTree/FaerbeAuf.h parseTree/FaerbeUm.cpp parseTree/FaerbeUm.h parseTree/Anzeigen.cpp parseTree/Anzeigen.h parseTree/Warte.cpp parseTree/Warte.h parseTree/Wiederhole.cpp parseTree/Wiederhole.h ParseTreeNodeBool_Interface.h parseTree/Gleich.cpp parseTree/Gleich.h ParseTreeNodeInt_Interface.h parseTree/Integer.cpp parseTree/Integer.h parseTree/Plus.cpp parseTree/Plus.h parseTree/Minus.cpp parseTree/Minus.h parseTree/Mal.cpp parseTree/Mal.h parseTree/Geteilt.cpp parseTree/Geteilt.h parseTree/Modulo.cpp parseTree/Modulo.h parseTree/IntegerIdentifier.cpp parseTree/IntegerIdentifier.h parseTree/SetzeIntegerIdentifier.cpp parseTree/SetzeIntegerIdentifier.h parseTree/Groesser.cpp parseTree/Groesser.h parseTree/Kleiner.cpp parseTree/Kleiner.h Cube.cpp Cube.h)

