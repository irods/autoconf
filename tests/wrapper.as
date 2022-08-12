AS_INIT[]dnl                                            -*- shell-script -*-
# wrapper.as -- running '@wrap_program@' as if it were installed.
# @configure_input@
# Copyright (C) 2003-2004, 2007, 2009-2017, 2020-2022 Free Software
# Foundation, Inc.

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

testdir='@abs_top_builddir@/tests'
PATH=$testdir$PATH_SEPARATOR$PATH
AUTOCONF=autoconf
AUTOHEADER=autoheader
AUTOM4TE=autom4te
AUTOM4TE_CFG='@abs_top_builddir@/lib/autom4te.cfg'
autom4te_buildauxdir='@abs_top_srcdir@/build-aux'
autom4te_perllibdir='@abs_top_srcdir@/lib'
trailer_m4='@abs_top_srcdir@/lib/autoconf/trailer.m4'
export AUTOCONF AUTOHEADER AUTOM4TE AUTOM4TE_CFG
export autom4te_buildauxdir autom4te_perllibdir trailer_m4

case '@wrap_program@' in
  ifnames)
     # Does not have lib files.
     exec '@abs_top_builddir@/bin/@wrap_program@' ${1+"$@"}
     ;;
  *)
     # We might need files from the build tree (frozen files), in
     # addition of src files.
     exec '@abs_top_builddir@/bin/@wrap_program@' \
	  -B '@abs_top_builddir@'/lib \
	  -B '@abs_top_srcdir@'/lib ${1+"$@"}
esac
exit 1
