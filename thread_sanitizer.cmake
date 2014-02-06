option(USE_TSAN "Enable Thread Sanitizer, if your compiler supports it" OFF)
if(USE_TSAN)
	include(CheckCXXSourceCompiles)
	
	set(tsan_flag "-fsanitize=thread")

	set(CMAKE_REQUIRED_FLAGS_BAK "${CMAKE_REQUIRED_FLAGS}")
	set(CMAKE_REQUIRED_FLAGS "${CMAKE_REQUIRED_FLAGS} ${tsan_flag}")
	CHECK_CXX_SOURCE_COMPILES("int main() { return 0; }" FLAG_FSANT_SUPPORTED)
	set(CMAKE_REQUIRED_FLAGS "${CMAKE_REQUIRED_FLAGS_BAK}")

	if(FLAG_FSANT_SUPPORTED)
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${tsan_flag}")
		set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${tsan_flag}")
		set(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} ${tsan_flag}")
		set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${tsan_flag}")
	endif()
endif(USE_TSAN)
