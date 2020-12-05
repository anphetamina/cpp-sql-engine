cmake_minimum_required(VERSION 3.17)
project(cpp_sql_engine)

set(CMAKE_CXX_STANDARD 14)

set(project_name cpp_sql_engine)

find_package(BISON REQUIRED)
find_package(FLEX REQUIRED)

BISON_TARGET(parser parser.y ${CMAKE_SOURCE_DIR}/parser.cpp)
FLEX_TARGET(lexer lexer.l ${CMAKE_SOURCE_DIR}/lexer.cpp)
ADD_FLEX_BISON_DEPENDENCY(lexer parser)

include_directories(${CMAKE_CURRENT_BINARY_DIR})
add_executable(${project_name} main.cpp ${BISON_parser_OUTPUTS} ${FLEX_lexer_OUTPUTS})

#target_include_directories(${project_name} PRIVATE "${CMAKE_CURRENT_BINARY_DIR}")
#target_link_libraries(${project_name} ${FLEX_LIBRARIES})