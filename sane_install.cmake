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
# - lib/library (.a or .so or .dll or ...)
# - bin/application
# - lib/hurdur/cmake/hurdurConfig.cmake
#
# Which is great because now other CMake-projects can automatically find your library.
#
# = FAQ
# == How do I install my archives/libraries/runtimes/includes/cmake-things somewhere else?
# Set sane_install_{archive,library,runtime,include,cmake}_install_path to something else.
#
# == How do I change the installation directory?
# Just change CMAKE_INSTALL_PREFIX in your CMake Cache (run ccmake or cmake-gui for easy editing).

include(CMakeParseArguments)
function(sane_install)
	set(optionalArgs)
	set(singleArgs HEADER_DESTINATION EXPORT_GROUP)
	set(multiArgs TARGETS HEADERS CMAKE_MODULES)
	cmake_parse_arguments(sane_install "${optionalArgs}" "${singleArgs}" "${multiArgs}" ${ARGN})

	if(NOT DEFINED sane_install_archive_install_path)
		set(sane_install_archive_install_path "lib")
	endif()
	if(NOT DEFINED sane_install_library_install_path)
		set(sane_install_library_install_path "lib")
	endif()
	if(NOT DEFINED sane_install_runtime_install_path)
		set(sane_install_runtime_install_path "bin")
	endif()
	if(NOT DEFINED sane_install_include_install_path)
		set(sane_install_include_install_path "include/${CMAKE_PROJECT_NAME}")
	endif()
	if(NOT DEFINED sane_install_cmake_install_path)
		set(sane_install_cmake_install_path "${sane_install_library_install_path}/${CMAKE_PROJECT_NAME}/cmake")
	endif()
	if(NOT DEFINED sane_install_HEADER_DESTINATION)
		set(sane_install_HEADER_DESTINATION "")
	endif()
	if(NOT DEFINED sane_install_EXPORT_GROUP)
		set(sane_install_EXPORT_GROUP ${CMAKE_PROJECT_NAME})
	endif()

	install(
		TARGETS ${sane_install_TARGETS}
		EXPORT ${sane_install_EXPORT_GROUP}
		ARCHIVE DESTINATION ${sane_install_archive_install_path}
		LIBRARY DESTINATION ${sane_install_library_install_path}
		RUNTIME DESTINATION ${sane_install_runtime_install_path}
	)


	set(true_install_dir ${sane_install_include_install_path}/${sane_install_HEADER_DESTINATION})
	install(FILES ${sane_install_HEADERS} DESTINATION ${true_install_dir})
	install(FILES ${sane_install_CMAKE_MODULES} DESTINATION ${sane_install_cmake_install_path})
	if(DEFINED sane_install_TARGETS)
		install(EXPORT ${sane_install_EXPORT_GROUP} FILE "${sane_install_EXPORT_GROUP}Config.cmake" DESTINATION ${sane_install_cmake_install_path})
	endif()
endfunction(sane_install)
