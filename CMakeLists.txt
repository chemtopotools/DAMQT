
# CMake project file for DAMQT

cmake_minimum_required(VERSION 3.10)
project(DAMQT)

# Force C++11 or later to ensure standard type definitions are consistent
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)


# -------------------------------------
# 🔍 Detect platform and toolchain
# -------------------------------------
message(STATUS "CMAKE_SYSTEM_NAME         = ${CMAKE_SYSTEM_NAME}")
message(STATUS "CMAKE_CXX_COMPILER_ID     = ${CMAKE_CXX_COMPILER_ID}")
message(STATUS "CMAKE_Fortran_COMPILER_ID = ${CMAKE_Fortran_COMPILER_ID}")

# Initialize build flags
set(BUILD_GUI OFF)
set(BUILD_FORTRAN_SERIAL OFF)
set(BUILD_FORTRAN_MPI OFF)

if (UNIX AND NOT CYGWIN)
    message(STATUS "🧩 Platform: Linux/Unix – unified build")
    set(BUILD_GUI ON)
    set(BUILD_FORTRAN_SERIAL ON)
    set(BUILD_FORTRAN_MPI ON)

elseif (WIN32 AND CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    message(STATUS "🧩 Platform: Windows + MinGW – GUI + Fortran serial")
    set(BUILD_GUI ON)
    set(BUILD_FORTRAN_SERIAL ON)

elseif (CYGWIN)
    message(STATUS "🧩 Platform: Cygwin – Fortran MPI only")
    set(BUILD_FORTRAN_MPI ON)

else()
    message(WARNING "⚠ Unknown platform – please configure build options manually.")
endif()

message("BUILD_FORTRAN_MPI: " ${BUILD_FORTRAN_MPI})

# -------------------------------------
# 🛡 Definitions for Windows to avoid Qt header conflicts
# -------------------------------------

# -------------------------------------
# 🔨 Main project build
# -------------------------------------
message("BUILD_GUI: " ${BUILD_GUI})
if (BUILD_GUI)
    add_subdirectory(src/DAMGUI320)
endif()

if (BUILD_FORTRAN_SERIAL)
    add_subdirectory(src/DAM320)
    add_subdirectory(src/TDAM320)
    add_subdirectory(src/DAMZernike320)
    add_subdirectory(src/interfaces_320)
endif()

if (BUILD_FORTRAN_MPI)
    add_subdirectory(src/DAM320_mpi)
    add_subdirectory(src/TDAM320_mpi)
    add_subdirectory(src/DAMZernike320_mpi)
endif()

# -------------------------------------
# 📁 Additional directories (docs, utils, etc.)
# -------------------------------------
add_subdirectory(doc)
add_subdirectory(license)
add_subdirectory(samples)
add_subdirectory(utils)
add_subdirectory(windows)

# -------------------------------------
# 🧹 Add uninstall target
# -------------------------------------
configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake_uninstall.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake"
    IMMEDIATE @ONLY
)

add_custom_target(uninstall
    COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake
)
