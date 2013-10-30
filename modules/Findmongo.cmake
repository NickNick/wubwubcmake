# - Try to find mongo
# Once done this will define
#  mongo_FOUND - system has mongo
#  mongo_INCLUDE_DIRS - include directories for mongo
#  mongo_LIBRARIES - libraries for mongo

FIND_PATH(mongo_INCLUDE_DIRS server.h)
FIND_LIBRARY(mongo_LIBRARIES NAMES mongoclient)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(
	mongo DEFAULT_MSG
	mongo_LIBRARIES
	mongo_INCLUDE_DIRS)

FIND_PACKAGE(Threads REQUIRED)
FIND_PACKAGE(Boost COMPONENTS system thread filesystem program_options REQUIRED)
FIND_PACKAGE(OpenSSL REQUIRED)

set(mongo_LIBRARIES
	${mongo_LIBRARIES}
	${Boost_SYSTEM_LIBRARY}
	${Boost_THREAD_LIBRARY}
	${Boost_FILESYSTEM_LIBRARY}
	${Boost_PROGRAM_OPTIONS_LIBRARY}
	${OPENSSL_LIBRARIES}
	${CMAKE_THREAD_LIBS_INIT}
)

MARK_AS_ADVANCED(mongo_INCLUDE_DIRS mongo_LIBRARIES)
