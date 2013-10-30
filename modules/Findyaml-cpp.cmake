# - Try to find yaml-cpp
# Once done this will define
#  yaml-cpp_FOUND - system has yaml-cpp
#  yaml-cpp_INCLUDE_DIRS - include directories for yaml-cpp
#  yaml-cpp_LIBRARIES - libraries for yaml-cpp

FIND_PATH(yaml-cpp_INCLUDE_DIRS yaml.h
          PATH_SUFFIXES yaml-cpp)
FIND_LIBRARY(yaml-cpp_LIBRARIES NAMES yaml-cpp)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(yaml-cpp DEFAULT_MSG
                                  yaml-cpp_LIBRARIES yaml-cpp_INCLUDE_DIRS)

MARK_AS_ADVANCED(yaml-cpp_INCLUDE_DIRS yaml-cpp_LIBRARIES)
