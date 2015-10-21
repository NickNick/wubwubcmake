# - Try to find lmdb
# Once done this will define
#  lmdb_FOUND - system has lmdb
#  lmdb_INCLUDE_DIRS - include directories for lmdb
#  lmdb_LIBRARIES - libraries for lmdb

find_path(lmdb_INCLUDE_DIR lmdb.h)
find_library(lmdb_LIBRARY NAMES lmdb)

include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
find_package_handle_standard_args(lmdb REQUIRED_VARS lmdb_INCLUDE_DIR lmdb_LIBRARY)
set(lmdb_FOUND ${LMDB_FOUND})
mark_as_advanced(lmdb_INCLUDE_DIR lmdb_LIBRARY)

set(lmdb_INCLUDE_DIRS ${lmdb_INCLUDE_DIR})
set(lmdb_LIBRARIES ${lmdb_LIBRARY})

