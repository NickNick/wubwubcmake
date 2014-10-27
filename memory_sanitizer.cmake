include(${CMAKE_CURRENT_LIST_DIR}/flag_compiles.cmake)

option(USE_MSAN "Enable Memory Sanitizer, if your compiler supports it" OFF)
set(USE_MSAN_TRACK_ORIGINS 2 CACHE STRING  "0 for no tracking, 1 for displaying origins and 2 for displaying origins and intermediate stores")

if(USE_MSAN)
	set(flags "-fsanitize=memory -fsanitize-memory-track-origins=${USE_MSAN_TRACK_ORIGINS}")
	flag_compiles(FLAGS ${flags} WORKING_FLAG flag)

	if(flag)
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${flag}")
		set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${flag}")
		set(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} ${flag}")
		set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${flag}")
	else()
		message(WARNING "Memory Sanitizer requested, but your compiler doesn't support it (could be other compilation flags, such as the address sanitizer)")
	endif()
endif()
