include("${CMAKE_CURRENT_LIST_DIR}/detect_compiler.cmake")

include(CMakeParseArguments)
function(gperftools_enable_tcmalloc)
	set(optionalArgs)
	set(singleArgs)
	set(multiArgs TARGETS)
	cmake_parse_arguments(gperftools_enable_tcmalloc "${optionalArgs}" "${singleArgs}" "${multiArgs}" ${ARGN})
	check_compiling_with_gcc(gcc)
	if(gcc)
		set(disable_builtin_malloc "-fno-builtin-malloc -fno-builtin-calloc -fno-builtin-realloc -fno-builtin-free")
		foreach(target ${gperftools_enable_tcmalloc_TARGETS})
			target_compile_options(${target} PRIVATE "${disable_builtin_malloc}")
		endforeach()
	endif()
	foreach(target ${gperftools_enable_tcmalloc_TARGETS})
		target_link_libraries(${target} PRIVATE "tcmalloc")
	endforeach()
endfunction()

function(gperftools_enable_profiler)
	set(optionalArgs)
	set(singleArgs)
	set(multiArgs TARGETS)
	cmake_parse_arguments(gperftools_enable_profiler "${optionalArgs}" "${singleArgs}" "${multiArgs}" ${ARGN})
	foreach(target ${gperftools_enable_profiler_TARGETS})
		target_link_libraries(${target} PRIVATE "profiler")
	endforeach()
endfunction()