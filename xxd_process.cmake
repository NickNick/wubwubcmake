# Function to text source file into a C string within a C++ source file.
#
# Usage example:
#
# set(QUERIES a.sql b/c.sql)
# xxd_process(
#	sql.cc
#   queries
#   "${QUERIES}"
#   "ns;sql"
# )
# add_executable(foo ${sql})
#
# For example, if the input files are a.sql and b/c.sql, the four variables in queries.cc will be
#  unsigned char ns::sql::a_sql[];
#  unsigned int ns::sql::a_len;   
#  unsigned char ns::sql::b_c_sql[];
#  unsigned int ns::sql::b_c_len;   

include(CMakeParseArguments)

get_filename_component(XXD_COMPILER xxd PROGRAM)

function(xxd_process VARNAME DESTINATION SOURCES NAMESPACES)
	get_filename_component(_destination_name "${DESTINATION}" NAME)
	get_filename_component(_destination_path "${DESTINATION}" PATH)
	add_custom_command(
		OUTPUT ${DESTINATION}
		COMMAND ${CMAKE_COMMAND} -E make_directory "${_destination_path}"
		COMMAND ${CMAKE_COMMAND} -E echo "" >>"${DESTINATION}"
		WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
		COMMENT "Compiling sources to ${_destination_name}"
		)

	foreach(_namespace ${NAMESPACES})
		add_custom_command(
			OUTPUT ${DESTINATION}
			COMMAND ${CMAKE_COMMAND} -E echo "namespace ${_namespace} {" >>"${DESTINATION}"
			WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
			APPEND
			)
	endforeach()

	foreach(_input_file ${SOURCES})
		get_filename_component(_path "${_input_file}" PATH)
		get_filename_component(_name "${_input_file}" NAME)

		if(NOT ${_path} EQUAL "")
			set(_path "${_path}/")
		endif(NOT ${_path} EQUAL "")

		add_custom_command(
			OUTPUT ${DESTINATION}
			COMMAND ${XXD_COMPILER} -i "${_path}${_name}" >>"${DESTINATION}"
			DEPENDS "${_path}${_name}"
			WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
			APPEND
			)
	endforeach()

	foreach(_namespace ${NAMESPACES})
		add_custom_command(
			OUTPUT ${DESTINATION}
			COMMAND ${CMAKE_COMMAND} -E echo "}" >>"${DESTINATION}"
			WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
			APPEND
			)
	endforeach()

	set("${VARNAME}" ${DESTINATION} PARENT_SCOPE)
endfunction(xxd_process)
