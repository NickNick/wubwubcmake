# This file adds the RelWithAsserts CMAKE_BUILD_TYPE. It is exactly like
# RelWithDebInfo, but it also keeps asserts intact by not defining -DNDEBUG.

set(CMAKE_CXX_FLAGS_RELWITHASSERTS
	"-O2 -g -fno-omit-frame-pointer"
	CACHE STRING "Flags used by the C++ compiler during RelWithAsserts builds."
	FORCE)

set(CMAKE_C_FLAGS_RELWITHASSERTS
	"-O2 -g -fno-omit-frame-pointer"
	CACHE STRING "Flags used by the C compiler during RelWithAsserts builds."
	FORCE)

set(CMAKE_EXE_LINKER_FLAGS_RELWITHASSERTS
	""
	CACHE STRING "Flags used for linking binaries during RelWithAsserts builds."
	FORCE)
SET(CMAKE_SHARED_LINKER_FLAGS_RELWITHASSERTS
	""
	CACHE STRING "Flags used by the shared libraries linker during RelWithAsserts builds."
	FORCE)
MARK_AS_ADVANCED(
	CMAKE_CXX_FLAGS_RELWITHASSERTS
	CMAKE_C_FLAGS_RELWITHASSERTS
	CMAKE_EXE_LINKER_FLAGS_RELWITHASSERTS
	CMAKE_SHARED_LINKER_FLAGS_RELWITHASSERTS
)
