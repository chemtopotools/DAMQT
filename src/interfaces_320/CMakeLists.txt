# Project details
# ---------------
project(interfaces)

# Defines auxiliary containers with program names
# ===============================================
set (CPP_INTERFACES "GAUSS_interface" "MOLEKEL_interface" "MOLPRO_out_interface" "TURBOMOLE_interface"
    "NWChem_interface" "Mopac_aux_interface" "Psi4_auxiliary_interface")

set (PYTHON_SCRIPTS "MOLPRO_xml_interface.py" "MOPAC_aux_interface.py")

set (CPP_INTERFACES_EXECUTABLES "" )

# Create binaries
# ===============
if (UNIX AND NOT CYGWIN)
    foreach (p ${CPP_INTERFACES})
        add_executable(${p}.exe "${p}.cpp")
        list (APPEND CPP_INTERFACES_EXECUTABLES ${p}.exe )
        message("Adds ${p}.exe" )
    endforeach (p)
else (UNIX AND NOT CYGWIN)  # To prevent double .exe extension
    foreach (p ${CPP_INTERFACES})
        add_executable(${p} "${p}.cpp")
        list (APPEND CPP_INTERFACES_EXECUTABLES ${p} )
        message("Adds ${p}" )
    endforeach (p)
endif (UNIX AND NOT CYGWIN)


# install executables
# ===================
install (TARGETS ${CPP_INTERFACES_EXECUTABLES} RUNTIME DESTINATION ".")  # Default installation directory: /usr/local/bin/

# Dereferences symbolic links of python files for intallation 
# ===========================================================
set (PYTHON_resolvedFiles "")
foreach (_file ${PYTHON_SCRIPTS})
#    get_filename_component(_resolvedFile "${_file}" REALPATH)
    get_filename_component(_resolvedFile "${_file}" NAME)
	list (APPEND PYTHON_resolvedFiles "${_resolvedFile}")
endforeach()
message("PYTHON_resolvedFiles ${PYTHON_resolvedFiles}")

foreach (p ${PYTHON_resolvedFiles} )
	message("Adds ${p}")
endforeach (p)
add_custom_target(python_interfaces SOURCES ${PYTHON_resolvedFiles})

# install python scripts
# ======================
#install (TARGETS ${python_interfaces} RUNTIME DESTINATION ".")
install (PROGRAMS ${PYTHON_resolvedFiles} DESTINATION ".")
#install (FILES ${PYTHON_resolvedFiles} RUNTIME DESTINATION ".")
#install (PROGRAMS ${PYTHON_resolvedFiles} RUNTIME DESTINATION ".")
#install (FILES ${PYTHON_resolvedFiles} DESTINATION ".")
