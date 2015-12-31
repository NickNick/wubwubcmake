set(packagename Bullet)
string(TOUPPER ${packagename} PACKAGENAME)

find_path(${packagename}_INCLUDE_DIR
	NAMES btBulletCollisionCommon.h
	PATH_SUFFIXES bullet
)

foreach(lib BulletDynamics BulletCollision LinearMath BulletSoftBody)
	set(libname bullet_${lib}_library)
	find_library(${libname} ${lib})
	mark_as_advanced(${libname})
	if(${libname})
		list(APPEND ${packagename}_LIBRARY ${${libname}})
	endif()
endforeach()

set(${packagename}_INCLUDE_DIRS ${${packagename}_INCLUDE_DIR})
set(${packagename}_LIBRARIES    ${${packagename}_LIBRARY})

include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
find_package_handle_standard_args(${packagename}
	REQUIRED_VARS ${packagename}_INCLUDE_DIR
	              ${packagename}_LIBRARY
)
set(${packagename}_FOUND ${${PACKAGENAME}_FOUND})
