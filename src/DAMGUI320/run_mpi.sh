#!/bin/bash

# -------------------------------------------------------------------
# Robust wrapper for launching MPI executables from DAMQT
# Everything is in a single installation directory (no subfolders)
# Compatible with Cygwin (Windows), Linux, and macOS
# Filters PMIX/IEEE warnings and configures environment safely
# -------------------------------------------------------------------

# --- Parse arguments ---
NP="$1"                 # Number of processes
shift
EXECUTABLE="$1"         # The MPI executable to run
shift
INPUT_FILE="$1"          # MPI extra flags (can be empty)
shift
ARGS="$@"               # Any remaining arguments (input file, etc.)

# --- Detect installation directory ---
INSTALL_DIR="$(cd "$(dirname "$0")" && pwd)"

# --- Setup Cygwin environment ---
CYGWINDIR="$(cygpath -m /)"
echo "CYGWINDIR = $CYGWINDIR"

export PATH="$INSTALL_DIR:$PATH"
export PATH="$CYGWINDIR/bin:$PATH"


export CYGWIN="nodosfilewarning"
# export TMPDIR="$CYGWINDIR/tmp"
# mkdir -p "$TMPDIR"
# echo "TMPDIR = $TMPDIR"


# --- Use orterun.exe (renamed mpiexec) from INSTALL_DIR ---
# MPIEXEC="$INSTALL_DIR/orterun.exe"
MPIEXEC="$CYGWINDIR/bin/orterun.exe"
# echo "MPIEXEC = $MPIEXEC"

# --- Use uname to detect platform ---
UNAME_S="$("$CYGWINDIR/bin/uname.exe" -s 2>/dev/null)"
# echo "UNAME_S = $UNAME_S"

# --- Detect environment type ---
case "$UNAME_S" in
    CYGWIN* ) ENV_TYPE="cygwin" ;;
    Linux )   ENV_TYPE="linux" ;;
    Darwin )  ENV_TYPE="macos" ;;
    * )
        echo "Unknown environment: uname = $UNAME_S"
        exit 1
        ;;
esac
# echo "ENV_TYPE = $ENV_TYPE"

# --- Validate mpiexec/orterun exists ---
if [[ ! -x "$MPIEXEC" ]]; then
    echo "ERROR: orterun.exe (mpiexec) not found at $MPIEXEC"
    exit 1
fi

# --- Avoid PMIX errors due to /dev/shm ---
export PMIX_MCA_gds=hash
# echo "PMIX_MCA_gds = $PMIX_MCA_gds"

# --- Run the MPI executable ---
# echo "Running: $MPIEXEC -np $NP $EXECUTABLE $INPUT_FILE $ARGS EXIT_CODE=$?"
"$MPIEXEC" -np "$NP" "$EXECUTABLE" $INPUT_FILE $ARGS \
2> >(grep -v -E 'PMIX ERROR|POSIX shared memory objects require.*|floating-point exceptions|IEEE_UNDERFLOW_FLAG|IEEE_DENORMAL' >&2)
#     2> >(grep -v -E 'PMIX ERROR|/dev/shm|floating-point exceptions|IEEE_UNDERFLOW_FLAG|IEEE_DENORMAL' >&2)
# echo "MPIEXEC finished with exit code: $EXIT_CODE"
