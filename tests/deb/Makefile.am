ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}

# Distribution
# ------------
EXTRA_DIST = \
	LICENSE \
	README.md \
	android-helloworld-$(HELLOWORLD_API_VERSION).pc.in
BUILT_SOURCES =
CLEANFILES =
DISTCLEANFILES =
MAINTAINERCLEANFILES = \
	$(GITIGNORE_MAINTAINERCLEANFILES_TOPLEVEL) \
	$(GITIGNORE_MAINTAINERCLEANFILES_M4_LIBTOOL) \
	$(GITIGNORE_MAINTAINERCLEANFILES_MAKEFILE_IN)

# We're running CI in docker, which reports host architecture as host,
# not the docker image architecture as we expected, so specifying the
# host/build information is necessary here.
DISTCHECK_CONFIGURE_FLAGS = \
	--host=$(host_alias) \
	--build=$(build_alias) \
	--disable-maintainer-mode

GITIGNOREFILES = \
	build \
	debian \
	$(DIST_ARCHIVES)

# Common/global flags
# -------------------
AM_CPPFLAGS = \
	-include config.h \
	-Iinclude \
	-I$(top_srcdir)/include

AM_CFLAGS = \
	-Wall -Werror \
	-std=gnu99

AM_CXXFLAGS = \
	-Wall -Werror \
	-std=gnu++11

libtool_opts = \
	-version-info $(LT_VERSION_INFO) \
	-export-dynamic \
	-rpath $(libdir)

lib_LTLIBRARIES = \
	libhelloworld.la

# libhelloworld.la
# ----------------
libhelloworld_la_LDFLAGS = \
	$(libtool_opts)
libhelloworld_la_SOURCES = \
	src/helloworld.c

# helloworld HEADERS
# --------------
helloworldincdir = $(includedir)/helloworld
helloworldinc_HEADERS = \
	include/helloworld/helloworld.h

# PKG-CONFIG data files
# ---------------------
pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = \
	helloworld-$(HELLOWORLD_API_VERSION).pc

$(pkgconfig_DATA): config.status

EXTRA_DIST += $(pkgconfig_DATA:.pc=.pc.in)
DISTCLEANFILES += \
	$(pkgconfig_DATA)

CLEANFILES += $(BUILT_SOURCES)
GITIGNOREFILES += $(BUILT_SOURCES)

-include $(top_srcdir)/git.mk
