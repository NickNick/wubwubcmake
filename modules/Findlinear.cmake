# - Try to find linear
# Once done this will define
#  linear_FOUND - system has linear
#  linear_INCLUDE_DIRS - include directories for linear
#  linear_LIBRARIES - libraries for linear

FIND_PATH(linear_INCLUDE_DIRS linear.h)
FIND_LIBRARY(linear_LIBRARIES NAMES linear)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(linear DEFAULT_MSG
                                  linear_LIBRARIES linear_INCLUDE_DIRS)

set(linear_FOUND ${linear_FOUND})
MARK_AS_ADVANCED(linear_FOUND linear_INCLUDE_DIRS linear_LIBRARIES)
