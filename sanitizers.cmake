include(${CMAKE_CURRENT_LIST_DIR}/address_sanitizer.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/memory_sanitizer.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/thread_sanitizer.cmake)

if(USE_ASAN AND USE_TSAN)
	message(WARNING "Probably can't use ASAN and TSAN at the same time")
endif()
if(USE_ASAN AND USE_MSAN)
	message(WARNING "Probably can't use ASAN and MSAN at the same time")
endif()
if(USE_TSAN AND USE_MSAN)
	message(WARNING "Probably can't use MSAN and TSAN at the same time")
endif()

