# - Try to find ruuster-common
# Once done this will define
#  ruuster-common_FOUND			- system has ruuster-common
#  ruuster-common_INCLUDE_DIRS		- include directories for ruuster-common
#  ruuster-common_LIBRARIES		- libraries for ruuster-common

message(STATUS "Checking for package 'ruuster-common'")

set(ruuster-common_FOUND FALSE)

set(ruuster-common_EXPECTED_PATHS /usr/local/include/ruuster-common /usr/include/ruuster-common)
find_path(ruuster-common_INCLUDE_DIRS data/event.hpp ${ruuster-common_EXPECTED_PATHS})
find_library(ruuster-common_LIBRARIES NAMES ruuster-common)

find_package(Boost COMPONENTS system regex REQUIRED)

find_package(msgpack REQUIRED)
find_package(OpenSSL REQUIRED)

if(ruuster-common_INCLUDE_DIRS AND ruuster-common_LIBRARIES)
	set(ruuster-common_FOUND TRUE)
endif()

set(ruuster-common_INCLUDE_DIRS
	${ruuster-common_INCLUDE_DIRS}
	${Boost_INCLUDE_DIRS}
	${msgpack_INCLUDE_DIRS}
	${OPENSSL_INCLUDE_DIRS}
)

set(ruuster-common_LIBRARIES
	${ruuster-common_LIBRARIES}
	${Boost_SYSTEM_LIBRARY}
	${Boost_REGEX_LIBRARY}
	${msgpack_LIBRARIES}
	${OPENSSL_LIBRARIES}
)

mark_as_advanced(ruuster-common_INCLUDE_DIRS ruuster-common_LIBRARIES ruuster-common_FOUND)
