#!/bin/bash


function main ()
{
    local KDIFF_COMMAND ;
    
    # Get the command to be run
    if [[ "$_DEBUG_BATCH_" == "1" ]] ; then echo Input command: $0 $* ; fi ;
    GetKDiffCommand KDIFF_COMMAND $*
    if [[ "$_DEBUG_BATCH_" == "1" ]] ; then echo KDIFF_COMMAND = $KDIFF_COMMAND ; fi ;
    # Run that command
    eval $KDIFF_COMMAND
}
# ===== End Of main script




# =============================================================
#
# Name:        GetKDiffCommand
#
# Purpose:     Gets the command string which can be used to start
#              a 3-way merge using KDiff.
#
# Parameters:  $1 - The name of the environment variable that will
#                   receive the return value of this function call
#              $2 - The name of the first file in the 3-way merge
#              $3 - The name of the second file in the 3-way merge
#              $4 - The name of the third file in the 3-way merge
#              $5 - The name of the output file for the merge results
#
# Returns:     The KDiff command, with arguments, in the parameter
#              named by $1
#
# Notes:       None.
# =============================================================
function GetKDiffCommand () # ($2 is FILE1 as String, $3 is FILE2 as String, $4 is FILE3 as String, $5 is OUTPUTFILE as String) Returns RET_VALUE In $1 ByName
{
    # Initialize method arguments
    local FILE1=$2
    local FILE2=$3
    local FILE3=$4
    local OUTPUTFILE=$5
    
    # Initialize local variables
    local RET_VALUE=""
    local KDIFFDIR ;

    # Get the install path for the KDiff executable and store it in the
    # environment variable KDIFFDIR
    KDIFFDIR=$(/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -dump | grep --after-context 1 "^bundle" | grep --only-matching "/.*\.app" | grep -i kdiff3.app)

    RET_VALUE="\"$KDIFFDIR/Contents/MacOS/kdiff3\" -L1 Base -L2 Theirs -L3 Yours \"$FILE1\" \"$FILE2\" \"$FILE3\" -o \"$OUTPUTFILE\""
    # RET_VALUE="\"C:\Program Files (x86)\SourceGear\DiffMerge\DiffMerge.exe\" -merge -nosplash -result=\"$OUTPUTFILE\" \"$FILE1\" \"$FILE2\" \"$FILE3\""
    
    if [[ "$_DEBUG_BATCH_" == "1" ]] ; then echo :GetKDiffCommand _RET_VAL={$_RET_VAL} ; fi ;
    
    # Replace all '"' with '\"' and wrap the entire value in double quotes
    eval $1=\"${RET_VALUE//\"/\\\"}\" ;
}
# ===== End Of GetKDiffCommand



main $*

# =============================================================

