# - Try to find vw (Vowpal Wabbit)
# Once done this will define
#  vw_FOUND - system has vw
#  vw_INCLUDE_DIRS - include directories for vw
#  vw_LIBRARIES - libraries for vw

FIND_PATH(vw_INCLUDE_DIRS vw.h PATH_SUFFIXES vowpalwabbit)
FIND_LIBRARY(vw_LIBRARIES NAMES vw)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(vw DEFAULT_MSG
                                  vw_LIBRARIES vw_INCLUDE_DIRS)

set(vw_FOUND ${vw_FOUND})
MARK_AS_ADVANCED(vw_FOUND vw_INCLUDE_DIRS vw_LIBRARIES)
