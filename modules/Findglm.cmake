# - Try to find glm
# Once done this will define
#  glm_FOUND - system has glm
#  glm_INCLUDE_DIRS - include directories for glm

find_path(glm_INCLUDE_DIR NAMES glm/glm.hpp)

set(glm_INCLUDE_DIRS ${glm_INCLUDE_DIR})

include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
find_package_handle_standard_args(glm REQUIRED_VARS glm_INCLUDE_DIR)
set(glm_FOUND ${GLM_FOUND})
mark_as_advanced(glm_INCLUDE_DIR)
