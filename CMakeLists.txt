cmake_minimum_required(VERSION 3.22)

project(agimus-libfranka-common VERSION 0.1.0)

include(CMakePackageConfigHelpers)
set(PROJECT_EXPORT "lib/cmake/${PROJECT_NAME}")

add_library(${PROJECT_NAME} INTERFACE)
target_include_directories(${PROJECT_NAME} INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>
)

install(
  DIRECTORY include/agimus_research_interface
  DESTINATION include
)

install(
  TARGETS ${PROJECT_NAME}
  EXPORT ${PROJECT_NAME}Targets
  INCLUDES DESTINATION include
)

install(
  EXPORT ${PROJECT_NAME}Targets
  DESTINATION ${PROJECT_EXPORT}
  NAMESPACE ${PROJECT_NAME}::
)

configure_package_config_file(Config.cmake.in
  "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
  INSTALL_DESTINATION ${PROJECT_EXPORT}
)

write_basic_package_version_file(
  "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
  COMPATIBILITY AnyNewerVersion
)

install(FILES
  "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
  "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
  DESTINATION ${PROJECT_EXPORT}
)
