if(MINGW)
	include(${CMAKE_CURRENT_LIST_DIR}/enable_gnu11.cmake)
else()
#TODO: Fix this, use Dakon's detect C++11 module git://anongit.kde.org/scratch/dakon/cmake-cxx11
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
	#TODO: Is this still necessary on OSX 10.9?
	if(APPLE)
		set(CMAKE_REQUIRED_FLAGS "${CMAKE_REQUIRED_FLAGS} -stdlib=libc++")
	endif(APPLE)
endif()
