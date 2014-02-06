
include(${CMAKE_CURRENT_LIST_DIR}/address_sanitizer.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/thread_sanitizer.cmake)

if(USE_ASAN AND USE_TSAN)
	message(FATAL_ERROR "Sorry enabling both the thread and address sanitizer is not supported")
endif()

