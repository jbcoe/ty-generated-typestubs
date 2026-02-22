cmake_minimum_required(VERSION 3.15)
project(ty_generated_typestubs CXX C)

find_package(Python REQUIRED COMPONENTS Interpreter Development)
find_package(nanobind REQUIRED)

nanobind_add_module(_core
    src/bind_add.cc
    src/add.cc
)

target_include_directories(_core PUBLIC src)

install(TARGETS _core DESTINATION ty_generated_typestubs)
