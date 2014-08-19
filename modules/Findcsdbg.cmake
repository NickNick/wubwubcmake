cmake_minimum_required(VERSION 2.8.12)

if(csdbg_FIND_REQUIRED)
    set(required REQUIRED)
else()
    unset(required)
endif()

if(csdbg_FIND_QUIETLY)
    set(quiet QUIET)
else()
    unset(quiet)
endif()

# Get most variables from pkg-config, we require this.
find_package(PkgConfig ${required} ${quiet})
pkg_check_modules(csdbg ${required} ${quiet} libcsdbg)

# Try to find the actual library ourselves
find_library(csdbg_LIBRARY NAMES csdbg HINTS ${csdbg_LIBDIR})
find_package(PackageHandleStandardArgs ${required} ${quiet})
find_package_handle_standard_args(csdbg REQUIRED_VARS csdbg_LIBRARY)
mark_as_advanced(csdbg_LIBRARY)

# When we bump to CMake 3, we can just make this an interface and skip setting the IMPORTED_LOCATION
add_library(csdbg SHARED IMPORTED GLOBAL)
set_target_properties(csdbg PROPERTIES IMPORTED_LOCATION "${csdbg_LIBRARY}")
target_link_libraries(csdbg INTERFACE ${csdbg_LIBRARIES} ${csdbg_LDFLAGS} ${csdbg_LDFLAGS_OTHER})
set_target_properties(csdbg PROPERTIES INTERFACE_INCLUDE_DIRS "${csdbg_INCLUDE_DIRS}")
set_target_properties(csdbg PROPERTIES INTERFACE_COMPILE_OPTIONS "${csdbg_CFLAGS} ${csdbg_CFLAGS_OTHER}")
