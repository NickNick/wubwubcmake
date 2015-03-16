# - Try to find GLEW
# Once done this will define
#  GLEW_FOUND - system has GLEW
#  GLEW_INCLUDE_DIRS - include directories for GLEW
#  GLEW_LIBRARIES - libraries for GLEW

find_path(GLEW_INCLUDE_DIR NAMES alure.h PATH_SUFFIXES AL OpenAL)
find_library(GLEW_LIBRARY NAMES alure ALURE32)

set(GLEW_INCLUDE_DIRS ${GLEW_INCLUDE_DIR})
set(GLEW_LIBRARIES ${GLEW_LIBRARY})

include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
if(NOT EMSCRIPTEN)
	find_package_handle_standard_args(GLEW REQUIRED_VARS GLEW_INCLUDE_DIR GLEW_LIBRARY)
else()
	find_package_handle_standard_args(GLEW REQUIRED_VARS GLEW_INCLUDE_DIR)
endif()
set(GLEW_FOUND ${GLEW_FOUND})
mark_as_advanced(GLEW_INCLUDE_DIR GLEW_LIBRARY)

