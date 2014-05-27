# - Try to find svm
# Once done this will define
#  svm_FOUND - system has svm
#  svm_INCLUDE_DIRS - include directories for svm
#  svm_LIBRARIES - libraries for svm

FIND_PATH(svm_INCLUDE_DIRS svm.h)
FIND_LIBRARY(svm_LIBRARIES NAMES svm)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(svm DEFAULT_MSG
                                  svm_LIBRARIES svm_INCLUDE_DIRS)

set(svm_FOUND ${svm_FOUND})
MARK_AS_ADVANCED(svm_FOUND svm_INCLUDE_DIRS svm_LIBRARIES)
