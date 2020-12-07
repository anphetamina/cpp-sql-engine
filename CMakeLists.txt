cmake_minimum_required(VERSION 3.17)
project(cpp_sql_engine)

set(CMAKE_CXX_STANDARD 14)

set(project_name cpp_sql_engine)

set(
    H_SOURCES
    parser_types.h
    sqlstatement.h
    createstatement.h
    deletestatement.h
    dropstatement.h
    insertstatement.h
    quitstatement.h
    selectstatement.h
    truncatestatement.h
    updatestatement.h

)

set(
    CPP_SOURCES
    main.cpp
    createstatement.cpp
    deletestatement.cpp
    dropstatement.cpp
    insertstatement.cpp
    quitstatement.cpp
    selectstatement.cpp
    truncatestatement.cpp
    updatestatement.cpp
)

find_package(BISON REQUIRED)
find_package(FLEX REQUIRED)

BISON_TARGET(parser parser.y ${CMAKE_SOURCE_DIR}/parser.cpp COMPILE_FLAGS -Wcounterexamples)
FLEX_TARGET(lexer lexer.l ${CMAKE_SOURCE_DIR}/lexer.cpp)
ADD_FLEX_BISON_DEPENDENCY(lexer parser)

include_directories(${CMAKE_CURRENT_BINARY_DIR})
add_executable(${project_name} ${H_SOURCES} ${CPP_SOURCES} ${BISON_parser_OUTPUTS} ${FLEX_lexer_OUTPUTS})

#target_include_directories(${project_name} PRIVATE "${CMAKE_CURRENT_BINARY_DIR}")
#target_link_libraries(${project_name} ${FLEX_LIBRARIES})