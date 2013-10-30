# - Try to find tinyxml2
# Once done this will define
#  tinyxml2_FOUND - system has tinyxml2
#  tinyxml2_INCLUDE_DIRS - include directories for tinyxml2
#  tinyxml2_LIBRARIES - libraries for tinyxml2

FIND_PATH(tinyxml2_INCLUDE_DIRS tinyxml2.h)
FIND_LIBRARY(tinyxml2_LIBRARIES NAMES tinyxml2)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(tinyxml2 DEFAULT_MSG
                                  tinyxml2_LIBRARIES tinyxml2_INCLUDE_DIRS)

MARK_AS_ADVANCED(tinyxml2_INCLUDE_DIRS tinyxml2_LIBRARIES)
