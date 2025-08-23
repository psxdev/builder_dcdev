# KallistiOS Environment Settings
#
# This is a sample script for configuring and customizing your
# KOS build environment. Modify it to suit your setup. Several
# settings may be enabled optionally or are provided with
# alternative values.
#
# This script is typically sourced in your current shell environment
# (probably by .bashrc, .bash_profile, or something similar), so that
# the KOS environment is set up automatically for each shell session.
#

# Build Architecture
#
# Set the major architecture you'll be building for.
# The only option here is "dreamcast" as of KOS 2.0.0.
#
export KOS_ARCH="dreamcast"
#export CPATH=/opt/local/include
#export LIBRARY_PATH=/opt/local/lib
# Build Sub-Architecture
#
# Defines the sub architecture your configuration
# is targeting or uses an existing value that
# can be set externally via your IDE.
#
# Valid values:
#   "pristine" - Dreamcast console or HKT-0120 devkit (default)
#   "naomi"    - NAOMI or NAOMI 2 arcade board
#
if [ -z "${KOS_SUBARCH}" ] ; then
    export KOS_SUBARCH="pristine"
else
    export KOS_SUBARCH
fi

# KOS Root Path
#
# Specifies the path to the KOS root directory
#
export KOS_BASE="/usr/local/dcdev/kos"

# KOS-Ports Path
#
# Specifies the path to the KOS-ports directory
#
export KOS_PORTS="${KOS_BASE}/../kos-ports"

# SH Compiler Prefixes
#
# Specifies the path to and prefix for the main SH
# GCC toolchain used to target the Dreamcast's SH4 CPU.
#
export KOS_CC_BASE="/usr/local/dcdev/sh-elf"
export KOS_CC_PREFIX="sh-elf"

# ARM Compiler Prefixes
#
# Specifies the path to and prefix for the additional ARM
# GCC toolchain used to target the Dreamcast's AICA SPU.
#
export DC_ARM_BASE="/usr/local/dcdev/arm-eabi"
export DC_ARM_PREFIX="arm-eabi"

# External Dreamcast Tools Path
#
# Specifies the path where Dreamcast tools that are not part of KOS are to be
# installed. This includes, for example, dc-tool-ip, dc-tool-serial, and the
# mrbc bytecode compiler. This directory, along with SH and ARM compiler
# toolchains, will be added to your PATH environment variable.
#
export DC_TOOLS_BASE="/usr/local/dcdev/bin"

# CMake Toolchain Path
#
# Specifies the path to the toolchain file used to target
# KOS with the "cmake" build utility.
#
export KOS_CMAKE_TOOLCHAIN="${KOS_BASE}/utils/cmake/kallistios.toolchain.cmake"

# Genromfs Utility Path
#
# Specifies the path to the utility which is used by KOS
# to create romdisk filesystem images.
#
export KOS_GENROMFS="${KOS_BASE}/utils/genromfs/genromfs"

# Make Utility
#
# Configures the tool to be used as the main "make" utility
# for building GNU Makefiles. On a platform such as BSD,
# the default can be changed to "gmake," for the GNU
# implementation.
#
export KOS_MAKE="make"
#export KOS_MAKE="gmake"

# Loader Utility
#
# Specifies the loader to be used with the "make run" targets
# in the KOS examples. Defaults to using a preconfigured version
# of dc-tool. Use one of the other options for a manual dc-tool-ip
# or dc-tool-serial configuration, remembering to change the values
# for the Dreamcast's IP address or the serial port interface.
#
export KOS_LOADER="dc-tool -x"
#export KOS_LOADER="dc-tool-ip -t 192.168.1.100 -x"
#export KOS_LOADER="dc-tool-ser -t /dev/ttyS0 -x"

# GDB utility
#
# The kos-gdb helper will attempt to auto-detect the proper GDB program
# to use. You can force it by specifying the path here.
#export KOS_GDB="sh-elf-gdb"

# Default Compiler Flags
#
# Resets build flags. You can also initialize them to some preset
# default values here if you wish.
#
export KOS_INC_PATHS=""
export KOS_CFLAGS=""
export KOS_CPPFLAGS=""
export KOS_LDFLAGS=""
export KOS_AFLAGS=""
export DC_ARM_LDFLAGS=""

# Debug Options
#
# NDEBUG controls whether to disable `assert` per C standard, and
# DBGLOG_DISABLED controls whether other debug output will be provided
# (see ./kos/dbglog.h). Enable these if you want to remove assert checks
# and disable logging output, as is desirable for release builds.
#
#export KOS_CFLAGS="${KOS_CFLAGS} -DNDEBUG -DDBGLOG_DISABLED"

# Optimization Level
#
# Controls the baseline optimization level to use when building.
# Typically this is -Og (debugging), -O0, -O1, -O2, or -O3.
# NOTE: For our target, -O4 is a valid optimization level that has
#       been seen to have some performance impact as well.
#
export KOS_CFLAGS="${KOS_CFLAGS} -O2"

# Link-Time Optimization
#
# Uncomment this to enable LTO, which can substantially improve performance
# of the generated code by enabling the linker to perform inlining, at the
# cost of longer build times and fatter object files.
# NOTE: Certain ports and examples require fat LTO objects to work with LTO,
#       and LTO itself is known to cause issues in code with undefined behavior.
#
#export KOS_CFLAGS="${KOS_CFLAGS} -flto=auto -ffat-lto-objects"

# Additional Optimizations
#
# Uncomment these to enable what have been found empirically to be a decent
# set of additional flags for optimal release build performance with the
# current stable toolchain.
#
#export KOS_CFLAGS="${KOS_CFLAGS} -freorder-blocks-algorithm=simple"
#export KOS_CFLAGS="${KOS_CFLAGS} -fipa-pta"

# Position-Independent Code
#
# Comment this line out to enable position-dependent code. Codegen is slightly
# slower, and you lose a register, but it's required when building dynamically
# linked libraries or code whose symbols aren't resolved until runtime.
#
export KOS_CFLAGS="${KOS_CFLAGS} -fno-PIC -fno-PIE"

# Frame Pointers
#
# Controls whether frame pointers are emitted or not. Disabled by default, as
# they use an extra register. Enable them if you plan to use GDB for debugging
# or need additional stack trace
#
export KOS_CFLAGS="${KOS_CFLAGS} -fomit-frame-pointer"
#export KOS_CFLAGS="${KOS_CFLAGS} -fno-omit-frame-pointer -DFRAME_POINTERS"

# Stack Protector
#
# Controls whether GCC emits extra code to check for buffer overflows or stack
# smashing, which can be very useful for debugging. -fstack-protector only
# covers vulnerable objects, while -fstack-protector-strong provides medium
# coverage, and -fstack-protector-all provides full coverage. You may also
# override the default stack excepton handler by providing your own
# implementation of "void __stack_chk_fail(void)."
#
#export KOS_CFLAGS="${KOS_CFLAGS} -fstack-protector-all"

# GCC Builtin Functions
#
# Uncomment this line to prevent GCC from using its own builtin implementations of
# certain standard library functions. Under certain conditions, using builtins
# allows for compiler-optimized routines to replace function calls to the C standard
# library which are backed by Newlib or KOS.
#
#export KOS_CFLAGS="${KOS_CFLAGS} -fno-builtin"

# Fast Math Instructions
#
# Uncomment this line to enable the optimized fast-math instructions (FSSRA,
# FSCA, and FSQRT) for calculating sin/cos, inverse square root, and square roots.
# These can result in substantial performance gains for these kinds of operations;
# however, they do so at the price of accuracy and are not IEEE compliant.
# NOTE: If these cause issues when enabled globally, it's advised to try to enable
#       them on individual files in the critical path to still gain performance.
#
#export KOS_CFLAGS="${KOS_CFLAGS} -fbuiltin -ffast-math -ffp-contract=fast"

# SH4 Floating-Point Arithmetic Precision
#
# KallistiOS supports both the single-precision-default ABI (m4-single) and the
# single-precision-only ABI (m4-single-only). When using m4-single, the SH4 will
# be in single-precision mode upon function entry but will switch to double-
# precision mode if 64-bit doubles are used. When using m4-single-only, the SH4
# will always be in single-precision mode and 64-bit doubles will be truncated to
# 32-bit floats. Historically, m4-single-only was used in both official and
# homebrew Dreamcast software, but m4-single is the default as of KOS 2.2.0 to
# increase compatibility with newer libraries which require 64-bit doubles.
#
# WARNING: When adjusting this setting, make sure all software, including
#          kos-ports and linked external libraries, are rebuilt using the same
#          floating-point precision ABI setting!
#
export KOS_SH4_PRECISION="-m4-single"

# Use LRA (Local Register Allocator) Pass
#
# Uncomment this line to use the modern Local Register Allocator pass during
# code generation instead of the default older reload pass. This option is
# known to be unstable or less performant for SH at this time, but will likely
# become mandatory in future versions of GCC, so feel free to help us test.
# Only enable this setting if you understand what you are doing!
#
#export KOS_CFLAGS="${KOS_CFLAGS} -mlra"

# Shared Compiler Configuration
#
# Include sub architecture-independent configuration file for shared
# environment settings. If you want to configure additional compiler
# options or see where other build flags are set, look at this file.
#
. ${KOS_BASE}/environ_base.sh
