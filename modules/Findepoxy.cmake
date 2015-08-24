FIND_PATH(epoxy_INCLUDE_DIRS gl.h
          PATH_SUFFIXES epoxy)
FIND_LIBRARY(epoxy_LIBRARIES NAMES epoxy)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(epoxy DEFAULT_MSG
                                  epoxy_LIBRARIES epoxy_INCLUDE_DIRS)

MARK_AS_ADVANCED(epoxy_INCLUDE_DIRS epoxy_LIBRARIES)
