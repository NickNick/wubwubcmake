include(LibFindMacros)

# Dependencies
libfind_package(Boost)

# Use pkg-config to get hints about paths
libfind_pkg_check_modules(Assimp_PKGCONF Assimp)

# Include dir
find_path(Assimp_INCLUDE_DIR
  NAMES assimp.h
  PATHS ${Assimp_PKGCONF_INCLUDE_DIRS}
)

find_library(Assimp_LIBRARY
  NAMES Assimp
  PATHS ${Assimp_PKGCONF_LIBRARY_DIRS}
)

# Set the include dir variables and the libraries and let libfind_process do the rest.
# NOTE: Singular variables for this library, plural for libraries this this lib depends on.
set(Assimp_PROCESS_INCLUDES Assimp_INCLUDE_DIR Boost_INCLUDE_DIRS)
set(Assimp_PROCESS_LIBS Assimp_LIBRARY Boost_LIBRARIES)
libfind_process(Assimp)
