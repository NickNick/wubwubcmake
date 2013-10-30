# - Try to find fastcgipp
# Once done this will define
#  fastcgipp_FOUND - system has fastcgipp
#  fastcgipp_INCLUDE_DIRS - include directories for fastcgipp
#  fastcgipp_LIBRARIES - libraries for fastcgipp

FIND_PATH(fastcgipp_INCLUDE_DIRS fastcgi++/fcgistream.hpp)
FIND_LIBRARY(fastcgipp_LIBRARIES NAMES fastcgipp)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(fastcgipp DEFAULT_MSG
                                  fastcgipp_LIBRARIES fastcgipp_INCLUDE_DIRS)

MARK_AS_ADVANCED(fastcgipp_INCLUDE_DIRS fastcgipp_LIBRARIES)
