cmake_minimum_required(VERSION 2.8.12)

project(wubwubcmake)

set(wubwubcmake_VERSION_MAJOR 1)
set(wubwubcmake_VERSION_MINOR 2)
set(wubwubcmake_VERSION_PATCH 0)

include(${CMAKE_CURRENT_LIST_DIR}/sane_install.cmake)

set(configured_configuration ${CMAKE_BINARY_DIR}/wubwubcmakeConfig.cmake)
configure_file(${CMAKE_CURRENT_LIST_DIR}/wubwubcmakeConfig.cmake.in ${configured_configuration})

file(GLOB cmake_modules "*.cmake*")
sane_install(CMAKE_MODULES ${cmake_modules} CMAKE_CONFIGS ${configured_configuration})
install(DIRECTORY "${CMAKE_SOURCE_DIR}/modules/" DESTINATION "lib/${CMAKE_PROJECT_NAME}/modules")


