# - Try to find check
# Once done this wil define
# check_FOUND
# check_INCLUDE_DIRS
# check_LIBRARIES

find_package(Threads)

find_path(check_INCLUDE_DIR check.h)
find_library(check_LIBRARY NAMES check)

set(check_LIBRARIES ${check_LIBRARY} ${CMAKE_THREAD_LIBS_INIT} rt)
message(STATUS ${check_LIBRARIES})
set(check_INCLUDE_DIRS ${check_INCLUDE_DIR})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(check REQUIRED_VARS check_LIBRARIES check_INCLUDE_DIR)

set(check_FOUND ${CHECK_FOUND})

if(NOT check_FOUND)
	if(check_FIND_REQUIRED)
		message(SEND_ERROR "Unable to find check library")
	endif(check_FIND_REQUIRED)
endif(NOT check_FOUND)

mark_as_advanced(check_INCLUDE_DIR check_LIBRARIES)
