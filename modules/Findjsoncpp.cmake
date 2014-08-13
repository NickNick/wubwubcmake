# - Try to find jsoncpp
# Once done this will define
#  jsoncpp_FOUND - system has jsoncpp
#  jsoncpp_INCLUDE_DIRS - include directories for jsoncpp
#  jsoncpp_LIBRARIES - libraries for jsoncpp

find_path(jsoncpp_INCLUDE_DIR json.h PATHS jsoncpp/json json)
find_library(jsoncpp_LIBRARY NAMES jsoncpp)

set(jsoncpp_INCLUDE_DIRS ${jsoncpp_INCLUDE_DIR})
set(jsoncpp_LIBRARIES ${jsoncpp_LIBRARY})

include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
find_package_handle_standard_args(jsoncpp REQUIRED_VARS jsoncpp_INCLUDE_DIR jsoncpp_LIBRARY)
set(jsoncpp_FOUND ${JSONCPP_FOUND})
mark_as_advanced(jsoncpp_INCLUDE_DIR jsoncpp_LIBRARY)

