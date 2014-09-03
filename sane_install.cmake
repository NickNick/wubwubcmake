# = sane_install -- A sane way to install targets and headers
# Example usage:
#
# ```
# project(hurdur)
# sane_install(TARGETS library application HEADERS lib.hpp HEADER_DESTINATION awesomesauce)
# ```
#
# This will install the given things in CMAKE_INSTALL_PREFIX
# - include/hurdur/awesomesauce/lib.hpp
# - lib/hurdur/library (.a or .so or .dll or ...)
# - bin/application
# - lib/hurdur/cmake/hurdurConfig.cmake
#
# Which is great because now other CMake-projects can automatically find your library.
#
# = FAQ
# == How do I install my archives/libraries/runtimes/includes/cmake-things somewhere else?
# Set sane_install_{archive,library,runtime,include,cmake_module}_path to something else.
#
# == How do I change the installation directory?
# Just change CMAKE_INSTALL_PREFIX in your CMake Cache (run ccmake or cmake-gui for easy editing).
#
# == How can I install configuration files to a different place?
# You can't, sorry. If you think this is a wrong decision, feel free to send a pull request/mail with a fix.
#
# == Why do I *have* to specify a version?
# Well you never want something versionless, right? You always program against *some* version, so include it.
# If you want to show off your carelessness, just try and find version 0. That'll always work, if something's installed.

set(sane_install_where_we_at ${CMAKE_CURRENT_LIST_DIR})

include(CMakeParseArguments)
function(sane_install)
	set(optionalArgs)
	set(singleArgs HEADER_DESTINATION EXPORT_GROUP)
	set(multiArgs TARGETS HEADERS CMAKE_MODULES CMAKE_CONFIGS)
	cmake_parse_arguments(sane_install "${optionalArgs}" "${singleArgs}" "${multiArgs}" ${ARGN})

	if(NOT DEFINED sane_install_archive_path)
		set(sane_install_archive_path "lib/${CMAKE_PROJECT_NAME}")
	endif()
	if(NOT DEFINED sane_install_library_path)
		set(sane_install_library_path "lib/${CMAKE_PROJECT_NAME}")
	endif()
	if(NOT DEFINED sane_install_runtime_path)
		set(sane_install_runtime_path "bin")
	endif()
	if(NOT DEFINED sane_install_include_path)
		set(sane_install_include_path "include/${CMAKE_PROJECT_NAME}")
	endif()
	if(NOT DEFINED sane_install_HEADER_DESTINATION)
		set(sane_install_HEADER_DESTINATION "")
	endif()
	if(NOT DEFINED sane_install_EXPORT_GROUP)
		set(sane_install_EXPORT_GROUP ${CMAKE_PROJECT_NAME})
	endif()
	set(sane_install_cmake_config_path "lib/${CMAKE_PROJECT_NAME}/cmake")
	if(NOT DEFINED sane_install_cmake_module_path)
		set(sane_install_cmake_module_path "lib/${CMAKE_PROJECT_NAME}")
	endif()

	install(
		TARGETS ${sane_install_TARGETS}
		EXPORT ${sane_install_EXPORT_GROUP}
		ARCHIVE DESTINATION ${sane_install_archive_path}
		LIBRARY DESTINATION ${sane_install_library_path}
		RUNTIME DESTINATION ${sane_install_runtime_path}
	)


	set(true_install_dir ${sane_install_include_path}/${sane_install_HEADER_DESTINATION})
	install(FILES ${sane_install_HEADERS} DESTINATION ${true_install_dir})
	install(FILES ${sane_install_CMAKE_MODULES} DESTINATION ${sane_install_cmake_module_path})
	install(FILES ${sane_install_CMAKE_CONFIGS} DESTINATION ${sane_install_cmake_config_path})
	if(DEFINED sane_install_TARGETS)
		install(EXPORT ${sane_install_EXPORT_GROUP} FILE "${sane_install_EXPORT_GROUP}Config.cmake" DESTINATION ${sane_install_cmake_config_path})
	endif()
	set(sane_install_version_path ${CMAKE_BINARY_DIR}/${sane_install_EXPORT_GROUP}ConfigVersion.cmake)
	if(${sane_install_EXPORT_GROUP}_VERSION_MAJOR)
		set(sane_install_export_group_version_major ${${sane_install_EXPORT_GROUP}_VERSION_MAJOR})
	else()
		set(sane_install_export_group_version_major 0)
	endif()
	if(${sane_install_EXPORT_GROUP}_VERSION_MINOR)
		set(sane_install_export_group_version_minor ${${sane_install_EXPORT_GROUP}_VERSION_MINOR})
	else()
		set(sane_install_export_group_version_minor 0)
	endif()
	if(${sane_install_EXPORT_GROUP}_VERSION_PATCH)
		set(sane_install_export_group_version_patch ${${sane_install_EXPORT_GROUP}_VERSION_PATCH})
	else()
		set(sane_install_export_group_version_patch 0)
	endif()
	configure_file(${sane_install_where_we_at}/sane_install_generic_version.cmake.in ${sane_install_version_path} @ONLY)
	install(FILES ${sane_install_version_path} DESTINATION ${sane_install_cmake_config_path})
endfunction(sane_install)
