include(${CMAKE_CURRENT_LIST_DIR}/flag_compiles.cmake)

option(USE_TSAN "Enable Thread Sanitizer" OFF)

if(USE_TSAN)
	set(flags "-fsanitize=thread")
	flag_compiles(FLAGS ${flags} WORKING_FLAG flag)

	if(flag)
		set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${flag}")
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${flag}")
		set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${flag}")
		set(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} ${flag}")
		set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${flag}")
	else()
		message(WARNING "Thread Sanitizer requested, but failed to compile with all of these flags: ${flags}. Could be due to other compilation flags.")
	endif()
endif()
