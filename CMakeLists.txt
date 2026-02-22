cmake_minimum_required(VERSION 3.15)
project(ty_generated_typestubs CXX C)

find_package(Python REQUIRED COMPONENTS Interpreter Development)
# find_package(nanobind REQUIRED)

include(FetchContent)

FetchContent_Declare(
  nanobind
  GIT_REPOSITORY https://github.com/wjakob/nanobind
  GIT_TAG        v2.4.0 # Use the latest stable version
  GIT_SUBMODULES_RECURSE ON
)
FetchContent_MakeAvailable(nanobind)

nanobind_add_module(_core
    cc/bind_add.cc
    cc/add.cc
)

nanobind_add_stub(
  _core_stub
  MODULE _core
  MARKER_FILE ${CMAKE_CURRENT_BINARY_DIR}/py.typed
  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/_core.pyi
  DEPENDS _core
)

target_include_directories(_core PUBLIC cc)

install(TARGETS _core DESTINATION ty_generated_typestubs)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/_core.pyi ${CMAKE_CURRENT_BINARY_DIR}/py.typed DESTINATION ty_generated_typestubs)
