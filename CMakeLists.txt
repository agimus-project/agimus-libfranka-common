cmake_minimum_required(VERSION 3.22)

add_library(agimus-libfranka-common INTERFACE)
target_include_directories(agimus-libfranka-common INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>
)
