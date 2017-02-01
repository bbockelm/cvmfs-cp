
cmake_minimum_required (VERSION 2.6.2)
set (PROJECT_NAME "CVMFS-CP")
project ("CVMFS-CP")

set (PACKAGE_VERSION "0.9" CACHE INTERNAL "Version of the cvmfs-cp package")

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/")

#
# Set install prefix to /usr by default.
#
if (LINUX AND CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
  set (CMAKE_INSTALL_PREFIX "/usr" CACHE PATH "CVMFS install path default is /usr" FORCE)
  message("Setting default install prefix to ${CMAKE_INSTALL_PREFIX} on Linux")
endif (LINUX AND CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)

find_package(Libcvmfs REQUIRED)
find_package(UUID REQUIRED)
find_package(ZLIB REQUIRED)
find_package(OpenSSL REQUIRED)

configure_file (
  "${CMAKE_SOURCE_DIR}/config_cmake.h.in"
  "${CMAKE_BINARY_DIR}/cvmfs_config.h"
)
include_directories (${CMAKE_BINARY_DIR})

add_executable(cvmfs-cp src/cvmfs_cp.cc)

target_link_libraries( cvmfs-cp ${LIBCVMFS_LIBRARIES} ${ZLIB_LIBRARIES} ${OPENSSL_LIBRARIES} ${UUID_LIBRARIES} rt pthread dl )

