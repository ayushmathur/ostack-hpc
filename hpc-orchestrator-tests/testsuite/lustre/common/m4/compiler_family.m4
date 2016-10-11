# SYNOPSIS
#
#   Test for HPC supported compiler toolchains
#
#   COMPILER_FAMILY()
#
# DESCRIPTION
#
#   Queries configuration environment to detect compiler toolchain
#   loaded via Lmod. Sets CC, CXX, and FC to match supported
#   toolchains.
#
# CONTRIBUTORS
#
#   Karl W. Schulz <karl.w.schulz@intel.com>

AC_DEFUN([HPC_COMPILER_FAMILY],
[

AC_MSG_CHECKING([for loaded HPC compiler toolchain])

if test "x$LMOD_FAMILY_COMPILER" = "xgnu"; then
   CC=gcc
   CXX=g++
   FC=gfortran
   AC_MSG_RESULT([gnu])
elif test "x$LMOD_FAMILY_COMPILER" = "xintel"; then
   CC=icc
   CXX=icpc
   FC=ifort
   AC_MSG_RESULT([intel])
else
   AC_MSG_RESULT([unknown])
   echo
   AC_ERROR([Unknown compiler family - please load a compiler toolchain.])
fi

# Automake condidtionals
AM_CONDITIONAL(HAVE_HPC_GNU_COMPILER,  test "x$LMOD_FAMILY_COMPILER" = "xgnu")
AM_CONDITIONAL(HAVE_HPC_INTEL_COMPILER,test "x$LMOD_FAMILY_COMPILER" = "xintel")

])
