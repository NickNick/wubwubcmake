# - Try to find Alure
# Once done this will define
#  Alure_FOUND - system has Alure
#  Alure_INCLUDE_DIRS - include directories for Alure
#  Alure_LIBRARIES - libraries for Alure

find_path(Alure_INCLUDE_DIR NAMES alure.h PATHS AL OpenAL)
find_library(Alure_LIBRARY NAMES alure ALURE32)

set(Alure_INCLUDE_DIRS ${Alure_INCLUDE_DIR})
set(Alure_LIBRARIES ${Alure_LIBRARY})

include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
find_package_handle_standard_args(Alure REQUIRED_VARS Alure_INCLUDE_DIR Alure_LIBRARY)
set(Alure_FOUND ${ALURE_FOUND})
mark_as_advanced(Alure_INCLUDE_DIR Alure_LIBRARY)

