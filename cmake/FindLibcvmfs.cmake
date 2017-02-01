# - Find libcvmfs static library
# Find the libcvmfs includes and library
#
#  LIBCVMFS_INCLUDE_DIRS - where to find libcvmfs.h, etc.
#  LIBCVMFS_LIBRARIES    - List of libraries when using libcvmfs.
#  LIBCVMFS_FOUND        - True if libcvmfs found.


IF (LIBCVMFS_INCLUDE_DIRS)
  # Already in cache, be silent
  SET(LIBCVMFS_FIND_QUIETLY TRUE)
ENDIF (LIBCVMFS_INCLUDE_DIRS)

FIND_PATH( LIBCVMFS_INCLUDE_DIR libcvmfs.h
           HINTS
           ${LIBCVMFS_INCLUDE_DIR}
           $ENV{LIBCVMFS_INCLUDE_DIR}
           ${CVMFS}
           $ENV{CVMFS}
           PATH_SUFFIXES cvmfs/
         )

SET(LIBCVMFS_NAMES libcvmfs.a)
FIND_LIBRARY( LIBCVMFS_LIBRARY NAMES ${LIBCVMFS_NAMES}
              HINTS
              ${LIBCVMFS_LIBRARY_DIR}
              $ENV{LIBCVMFS_LIBRARY_DIR}
              ${CVMFS_BUILD}
              $ENV{CVMFS_BUILD}
              PATH_SUFFIXES cvmfs/
            )

# handle the QUIETLY and REQUIRED arguments and set LIBCVMFS_FOUND to TRUE if
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(LIBCVMFS DEFAULT_MSG LIBCVMFS_LIBRARY LIBCVMFS_INCLUDE_DIR)

IF(LIBCVMFS_FOUND)
  SET( LIBCVMFS_LIBRARIES ${LIBCVMFS_LIBRARY} )
  SET( LIBCVMFS_INCLUDE_DIRS ${LIBCVMFS_INCLUDE_DIR} )
ELSE(LIBCVMFS_FOUND)
  SET( LIBCVMFS_LIBRARIES )
  SET( LIBCVMFS_INCLUDE_DIRS )
ENDIF(LIBCVMFS_FOUND)

MARK_AS_ADVANCED( LIBCVMFS_LIBRARIES LIBCVMFS_INCLUDE_DIRS )

