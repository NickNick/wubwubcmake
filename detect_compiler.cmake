function(check_compiling_with_clang result_var)
	if(NOT DEFINED ${result_var})
		if(CMAKE_C_COMPILER MATCHES "clang" OR CMAKE_CXX_COMPILER MATCHES "clang")
			set(${result_var} true PARENT_SCOPE)
		else()
			set(${result_var} false PARENT_SCOPE)
		endif()
	endif()
endfunction(check_compiling_with_clang)

function(check_compiling_with_gcc result_var)
	if(NOT DEFINED ${result_var})
		if(CMAKE_C_COMPILER MATCHES "gcc" OR CMAKE_CXX_COMPILER MATCHES "[^n]g\\+\\+")
			set(${result_var} true PARENT_SCOPE)
		else()
			set(${result_var} false PARENT_SCOPE)
		endif()
	endif()
endfunction(check_compiling_with_gcc)

