include(CMakeParseArguments)

function(easy_pkg_config)
	set(optionalArgs VERBOSE)
	set(singleArgs PREFIX)
	set(multiArgs MODULES)
	cmake_parse_arguments(opts "${optionalArgs}" "${singleArgs}" "${multiArgs}" ${ARGN})

	set(packname ${opts_PREFIX})
	set(modules ${opts_MODULES})
	set(verbose ${opts_VERBOSE})

	if(${packname}_FIND_REQUIRED)
		set(required REQUIRED)
	else()
		unset(required)
	endif()

	if(${packname}_FIND_QUIETLY)
		set(quiet QUIET)
	else()
		unset(quiet)
	endif()

# Get most variables from pkg-config, we require this.
	find_package(PkgConfig ${required} ${quiet})
	pkg_check_modules(${packname} ${required} ${quiet} ${modules})

	set(link_flags
		${${packname}_LIBRARIES}
		${${packname}_LDFLAGS_OTHER}
	)

	if(${packname}_FOUND AND verbose)
		message("Found ${packname}'s modules ${modules}: ${${packname}_FOUND}")
		message("\tLibraries: ${${packname}_LIBRARIES}")
		message("\tIncludes: ${${packname}_INCLUDE_DIRS}")
		message("\tFlags: ${${packname}_CFLAGS_OTHER}")
	elseif(verbose)
		message("Didn't find ${packname}'s modules ${modules}")
	endif()

	add_library(${packname} INTERFACE)
	if(NOT ${packname}_LIBRARIES STREQUAL "")
	target_link_libraries(
		${packname} INTERFACE ${${packname}_LIBRARIES})
	endif()

	if(NOT ${packname}_INCLUDE_DIRS STREQUAL "")
	set_target_properties(
		${packname} PROPERTIES INTERFACE_INCLUDE_DIRECTORIES ${${packname}_INCLUDE_DIRS})
	endif()

	if(NOT ${packname}_CFLAGS_OTHER STREQUAL "")
	set_target_properties(
		${packname} PROPERTIES INTERFACE_COMPILE_DEFINITIONS ${${packname}_CFLAGS_OTHER})
	endif()
endfunction(easy_pkg_config)
