option(position_independent_code "Enable Position Independent Code" ON)
# There seems to be no way yet to not set this for executables
set(CMAKE_POSITION_INDEPENDENT_CODE ${position_independent_code})
