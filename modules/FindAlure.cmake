# - Try to find Alure
# Once done this will define
#  Alure_FOUND - system has Alure
#  Alure_INCLUDE_DIRS - include directories for Alure
#  Alure_LIBRARIES - libraries for Alure

find_path(Alure_INCLUDE_DIR NAMES alure.h PATH_SUFFIXES AL OpenAL)
if(USE_STATIC_LIBS)
	find_library(Alure_LIBRARY NAMES libalure.a libALURE32.a alure-static ALURE32-static)
else()
	find_library(Alure_LIBRARY NAMES alure ALURE32)
endif()

set(Alure_INCLUDE_DIRS ${Alure_INCLUDE_DIR})
set(Alure_LIBRARIES ${Alure_LIBRARY})

if(USE_STATIC_LIBS)
	list(APPEND Alure_LIBRARIES sndfile vorbisenc vorbis ogg FLAC mpg123)
endif()

if(UNIX)
	list(APPEND Alure_LIBRARIES pthread dl)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
find_package_handle_standard_args(Alure REQUIRED_VARS Alure_INCLUDE_DIR Alure_LIBRARY)
set(Alure_FOUND ${ALURE_FOUND})
mark_as_advanced(Alure_INCLUDE_DIR Alure_LIBRARY)

