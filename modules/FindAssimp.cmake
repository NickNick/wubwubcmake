# - Try to find Assimp
# Once done this will define
#  Assimp_FOUND - system has Assimp
#  Assimp_INCLUDE_DIRS - include directories for Assimp
#  Assimp_LIBRARIES - libraries for Assimp

find_path(Assimp_INCLUDE_DIR assimp/mesh.h)
find_library(Assimp_LIBRARY NAMES assimp)

set(Assimp_INCLUDE_DIRS ${Assimp_INCLUDE_DIR})
set(Assimp_LIBRARIES ${Assimp_LIBRARY})

include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
find_package_handle_standard_args(Assimp REQUIRED_VARS Assimp_INCLUDE_DIR Assimp_LIBRARY)
mark_as_advanced(Assimp_INCLUDE_DIR Assimp_LIBRARY)

