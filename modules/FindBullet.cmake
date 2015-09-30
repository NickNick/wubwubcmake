set(packagename Bullet)
string(TOUPPER ${packagename} PACKAGENAME)

function(msgvar _var)
	message("${_var}: ${${_var}}")
endfunction(msgvar)

msgvar(CMAKE_PREFIX_PATH)
msgvar(CMAKE_SYSTEM_PREFIX_PATH)
msgvar(CMAKE_MODULE_PATH)
find_path(${packagename}_INCLUDE_DIR
	NAMES btBulletCollisionCommon.h
	PATH_SUFFIXES bullet
)
msgvar(${${packagename}_INCLUDE_DIR})

foreach(lib BulletDynamics BulletCollision LinearMath BulletSoftBody)
	set(libname bullet_${lib}_library)
	find_library(${libname} ${lib})
	mark_as_advanced(${libname})
	msgvar(${libname})
	msgvar(${packagename}_LIBRARY)
	if(${libname})
		msgvar(${${libname}})
		msgvar(${packagename}_LIBRARY)
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
