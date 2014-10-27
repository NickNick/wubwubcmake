# flag_compiles([CUSTOM_SOURCE <source>] FLAGS <flags> WORKING_FLAG <flag>)
# Sets WORKING_FLAG to the first flag that works from the list of FLAGS.

include(CMakeParseArguments)
include(CheckCXXSourceCompiles)

function(flag_compiles)
	set(multiArgs FLAGS)
	set(singleArgs WORKING_FLAG)
	cmake_parse_arguments(flag_compiles "${optionalArgs}" "${singleArgs}" "${multiArgs}" ${ARGN})
	foreach(flag ${flag_compiles_FLAGS})
		set(backup ${CMAKE_REQUIRED_FLAGS})
		set(CMAKE_REQUIRED_FLAGS "${CMAKE_REQUIRED_FLAGS} ${flag}")
		# Remove the variable from the cache, since we don't have a unique name per test.
		unset(flag_supported CACHE)
		unset(flag_supported)
		CHECK_CXX_SOURCE_COMPILES("void flag_compiles_source_check(){} int main(){}" flag_supported
			FAIL_REGEX "command line option .* is valid for .* but not for C\\\\+\\\\+" # GNU
			FAIL_REGEX "unrecognized .*option"                     # GNU
			FAIL_REGEX "unknown .*option"                          # Clang
			FAIL_REGEX "ignoring unknown option"                   # MSVC
			FAIL_REGEX "warning D9002"                             # MSVC, any lang
			FAIL_REGEX "option.*not supported"                     # Intel
			FAIL_REGEX "invalid argument .*option"                 # Intel
			FAIL_REGEX "ignoring option .*argument required"       # Intel
			FAIL_REGEX "[Uu]nknown option"                         # HP
			FAIL_REGEX "[Ww]arning: [Oo]ption"                     # SunPro
			FAIL_REGEX "command option .* is not recognized"       # XL
			FAIL_REGEX "not supported in this configuration; ignored"       # AIX
			FAIL_REGEX "File with unknown suffix passed to linker" # PGI
			FAIL_REGEX "WARNING: unknown flag:"                    # Open64
		)
		set(CMAKE_REQUIRED_FLAGS ${backup})
		message(STATUS "Checking flag ${flag} - Success: ${flag_supported}")

		if(flag_supported)
			set(${flag_compiles_WORKING_FLAG} ${flag} PARENT_SCOPE)
			break()
		endif()
	endforeach()
endfunction()
