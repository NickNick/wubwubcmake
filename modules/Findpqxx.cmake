# - Try to find pqxx
# Once done this will define
#  pqxx_FOUND - system has fastcgipp
#  pqxx_INCLUDE_DIRS - include directories for fastcgipp
#  pqxx_LIBRARIES - libraries for fastcgipp

FIND_PATH(pqxx_INCLUDE_DIRS pqxx/pqxx)
FIND_LIBRARY(pqxx_LIBRARIES NAMES pqxx)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(pqxx DEFAULT_MSG
                                  pqxx_LIBRARIES pqxx_INCLUDE_DIRS)

MARK_AS_ADVANCED(pqxx_INCLUDE_DIRS pqxx_LIBRARIES)
