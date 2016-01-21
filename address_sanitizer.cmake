include(${CMAKE_CURRENT_LIST_DIR}/flag_compiles.cmake)

option(USE_ASAN "Enable Address Sanitizer" OFF)

if(USE_ASAN)
	set(flags "-fsanitize=address" "-faddress-sanitizer")
	flag_compiles(FLAGS ${flags} WORKING_FLAG asan_flag)

	if(asan_flag)
		set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${asan_flag}")
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${asan_flag}")
		set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${asan_flag}")
		set(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} ${asan_flag}")
		set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${asan_flag}")
	else()
		message(WARNING "Address Sanitizer requested, but failed to compile with all of these flags: ${flags}. Could be due to other compilation flags.")
	endif()
endif()
