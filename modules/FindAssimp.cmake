# - Try to find Assimp
# Once done this will define
#  Assimp_FOUND - system has Assimp
#  Assimp_INCLUDE_DIRS - include directories for Assimp
#  Assimp_LIBRARIES - libraries for Assimp

FIND_PATH(Assimp_INCLUDE_DIRS mesh.h HINTS /usr/include/assimp/)
FIND_LIBRARY(Assimp_LIBRARIES NAMES assimp HINTS /usr/lib/)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(Assimp DEFAULT_MSG Assimp_INCLUDE_DIRS Assimp_LIBRARIES)
set(Assimp_FOUND ${ASSIMP_FOUND})
MARK_AS_ADVANCED(Assimp_FOUND Assimp_INCLUDE_DIRS Assimp_LIBRARIES)
