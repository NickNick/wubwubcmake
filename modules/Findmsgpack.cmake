# - Try to find msgpack
# Once done this will define
#  msgpack_FOUND - system has msgpack
#  msgpack_INCLUDE_DIRS - include directories for msgpack
#  msgpack_LIBRARIES - libraries for msgpack

FIND_PATH(msgpack_INCLUDE_DIRS msgpack.hpp)
FIND_LIBRARY(msgpack_LIBRARIES NAMES msgpack)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(msgpack DEFAULT_MSG
                                  msgpack_LIBRARIES msgpack_INCLUDE_DIRS)

set(msgpack_FOUND ${MSGPACK_FOUND})
MARK_AS_ADVANCED(msgpack_FOUND msgpack_INCLUDE_DIRS msgpack_LIBRARIES)
