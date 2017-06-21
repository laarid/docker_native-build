m4_define([helloworld_major_version], [0])
m4_define([helloworld_minor_version], [0])
m4_define([helloworld_micro_version], [1])
m4_define([helloworld_interface_revision], [1])
m4_define([helloworld_api_version], [helloworld_major_version.0])
m4_define([helloworld_release_number], [helloworld_major_version])
m4_define([helloworld_version],
  [helloworld_major_version.helloworld_minor_version.helloworld_micro_version])

AC_INIT([helloworld], [helloworld_version],
  [https://github.com/laarid/docker_native-build/issues], [],
  [https://github.com/laarid/docker_native-build])

AC_CONFIG_HEADERS([config.h])
AC_CONFIG_SRCDIR([include/helloworld/helloworld.h])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR([build-aux])

AM_INIT_AUTOMAKE([-Wall -Werror foreign subdir-objects no-define tar-ustar])
AM_MAINTAINER_MODE([enable])
AM_SILENT_RULES([yes])

HELLOWORLD_MAJOR_VERSION=helloworld_major_version
HELLOWORLD_MINOR_VERSION=helloworld_minor_version
HELLOWORLD_MICRO_VERSION=helloworld_micro_version
HELLOWORLD_API_VERSION=helloworld_api_version
HELLOWORLD_RELEASE_NUMBER=helloworld_release_number
AC_SUBST([HELLOWORLD_MAJOR_VERSION])
AC_SUBST([HELLOWORLD_MINOR_VERSION])
AC_SUBST([HELLOWORLD_MICRO_VERSION])
AC_SUBST([HELLOWORLD_API_VERSION])
AC_SUBST([HELLOWORLD_RELEASE_NUMBER])

# Define _GNU_SOURCE etc. where appropriate, e.g. for strptime() on glibc
AC_USE_SYSTEM_EXTENSIONS

AM_PROG_AR
AC_PROG_CC
AC_PROG_CXX

# libtool versioning
# ------------------
LT_INIT

m4_define([helloworld_binary_age], [m4_eval(100 * helloworld_minor_version + helloworld_micro_version)])
m4_define([lt_current], [m4_eval(helloworld_binary_age - helloworld_interface_revision)])
m4_define([lt_revision], [helloworld_interface_revision])
# Whenever backward compatibility is broken, we generate libraries of different
# release number. That follows the library files of the same release are always
# compatible, and they have their lt_age equal to lt_current.
m4_define([lt_age], [lt_current])
LT_VERSION_INFO="lt_current:lt_revision:lt_age"
AC_SUBST([LT_VERSION_INFO])

LT_OUTPUT

AC_CONFIG_FILES([
  Makefile
  helloworld-$HELLOWORLD_API_VERSION.pc
])
AC_OUTPUT
