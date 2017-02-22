include(${CMAKE_CURRENT_LIST_DIR}/detect_compiler.cmake)
function(get_sane_warning_flags result_var)
	if(NOT DEFINED ${result_var})
		check_compiling_with_clang(COMPILING_WITH_CLANG)
		check_compiling_with_gcc(COMPILING_WITH_GCC)
		check_compiling_with_msvc(COMPILING_WITH_MSVC)
		if(COMPILING_WITH_CLANG)
			#We enable all the warnings, and then whitelist some
			list(APPEND warnings -Weverything)
			#Low level stuff
			list(APPEND warnings -Wno-padded -Wno-weak-vtables)
			#Alignment warnings
			list(APPEND warnings  -Wno-cast-align -Wno-over-aligned)
			#Pedantic stuff
			list(APPEND warnings -Wno-newline-eof -Wno-pedantic -Wno-missing-prototypes -Wno-missing-noreturn -Wno-extra-semi  -Wno-covered-switch-default -Wno-unreachable-code)
			#Pre-C++11 compatibility can be screwed
			list(APPEND warnings -Wno-c++98-compat-pedantic)
			#C99 stuff that most compilers did add to C++
			list(APPEND warnings -Wno-variadic-macros -Wno-disabled-macro-expansion -Wno-vla)
			#Globals, perhaps rethink this since they can really cause issues if they depend on eachother.
			list(APPEND warnings -Wno-global-constructors -Wno-exit-time-destructors)
			#Conversion from double -> float, most of the time perfectly safe, other way around is also fine.
			# This may be bad for performance or precision, but usually it's what the programmer expects.
			list(APPEND warnings -Wno-conversion)
			#Float equalness can't be checked with ==, but we know that right?
			list(APPEND warnings -Wno-float-equal)
			#Ignore unused arguments, too noisey for now
			list(APPEND warnings -Qunused-arguments)
			#Ignore missing 'static' keywords as long as it happens in generated Qt4 RC headers
			list(APPEND warnings -Wno-missing-variable-declarations)

			if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER 3.7.0)
				# Double promotion can be bad for performance, but it's usually what the programmer expects.
				list(APPEND warnings -Wno-double-promotion)
			endif()
		endif()
		if(COMPILING_WITH_GCC)
			#default stuff
			list(APPEND warnings -Wall -Wextra)
			#missing struct member initialisation warnings
			list(APPEND warnings -Wno-missing-braces -Wno-missing-field-initializers)
			#low level warnings
			list(APPEND warnings -Wstrict-aliasing)
			#suspicious coding detection
			list(APPEND warnings -Wredundant-decls -Wunreachable-code -Wlogical-op -Wundef -Wformat=2 -Wpointer-arith)
			list(APPEND warnings -Wdelete-non-virtual-dtor)
		endif()
		if(COMPILING_WITH_MSVC)
			list(APPEND warnings /W4)
		endif()
		set(${result_var} ${warnings} PARENT_SCOPE)
	endif()
endfunction(get_sane_warning_flags)

function(join VALUES GLUE OUTPUT)
	string(REPLACE ";" "${GLUE}" _TMP_STR "${VALUES}")
	set(${OUTPUT} "${_TMP_STR}" PARENT_SCOPE)
endfunction()

function(add_sane_warning_flags)
	get_sane_warning_flags(warnings)
	join("${warnings}" " " warnings)
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${warnings}" PARENT_SCOPE)
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${warnings}" PARENT_SCOPE)
endfunction(add_sane_warning_flags)
