# Various functions that work with versions. Usage example:
#
# # Create a version.h that sets myproject_VERSION to "1.0.0"
# # The version.h is only overwritten when the version changed to
# # prevent unnecessary rebuilds
# generate_version_h(myproject "1.0.0")
#
# get_git_version(GIT_VERSION)
# message(${GIT_VERSION}) # prints e.g. "0776acb-dirty"
#
# # Same as generate_version_h, but adds a myproject_GIT_VERSION constant
# # containing the git revision after the version, e.g. 1.0.0-0776acb-dirty
# generate_git_version_h(myproject "1.0.0")
# # You can also put extra contents in the version.h file using an
# # optional parameter:
# generate_git_version_h(myproject "1.0.0" "\#define @TARGET@_DATE \"@VERSION_DATE@\"\n")

function(generate_version_h TARGET VERSION)
	# Use a combination of FILE and CONFIGURE_FILE to make sure the file
	# isn't overwritten when the contents didn't change, to prevent a
	# constant rebuild of all files that depend on it
	cmake_policy(PUSH)
	if( "${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" VERSION_GREATER "3.0")
		cmake_policy(SET CMP0053 NEW)
	endif()
	file(WRITE ${CMAKE_BINARY_DIR}/${TARGET}_version.h.in
		"\#define @TARGET@_VERSION \"@VERSION@\"\n"
		${ARGV2}
	)
	configure_file(${CMAKE_BINARY_DIR}/${TARGET}_version.h.in
		${CMAKE_BINARY_DIR}/${TARGET}_version.h @ONLY)
	cmake_policy(POP)
endfunction()

function(get_git_version OUTPUT)
	execute_process(COMMAND git status --porcelain -uno
		OUTPUT_VARIABLE DIRTY_OUTPUT
		OUTPUT_STRIP_TRAILING_WHITESPACE
		ERROR_QUIET
	)

	set(DIRTY "-dirty")
	if(NOT DIRTY_OUTPUT)
		set(DIRTY "")
	endif()

	execute_process(COMMAND git rev-parse --short HEAD
		OUTPUT_VARIABLE GIT_VERSION
		OUTPUT_STRIP_TRAILING_WHITESPACE
		ERROR_QUIET
	)

	set(${OUTPUT} "${GIT_VERSION}${DIRTY}" PARENT_SCOPE)
endfunction()

function(generate_git_version_h TARGET VERSION)
	cmake_policy(PUSH)
	if( "${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" VERSION_GREATER "3.0")
		cmake_policy(SET CMP0053 NEW)
	endif()
	get_git_version(GIT_VERSION)
	file(WRITE ${CMAKE_BINARY_DIR}/${TARGET}_version.h.in
		"\#define @TARGET@_VERSION \"@VERSION@\"\n"
		"\#define @TARGET@_GIT_VERSION \"@VERSION@-@GIT_VERSION@\"\n"
		${ARGV2}
	)
	configure_file(${CMAKE_BINARY_DIR}/${TARGET}_version.h.in
		${CMAKE_BINARY_DIR}/${TARGET}_version.h @ONLY)
	cmake_policy(POP)
endfunction()
