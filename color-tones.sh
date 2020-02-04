#INI_DATE=01-02-2020
#END_DATE=03-02-2020

function print_tone {

       local INTERVAL_SPACE=" "
       local INTERVAL_SHIFT=${3}
       local OCTAVE_SHIFT=$(( ${2} * 12 * INTERVAL_SHIFT + 1 ))

       case "${1}" in
               'C' )  BG_COLOR=46
                      FG_COLOR=248
                      TOTAL_INTERNVAL_SHIFT=""
                      INTERVAL_SPACE=""
                      ;;
               'C#' ) BG_COLOR=51
                      FG_COLOR=248
                      TOTAL_INTERNVAL_SHIFT=$(( INTERVAL_SHIFT * 1 ))
                      ;;
               'D' )  BG_COLOR=4
                      FG_COLOR=248
                      TOTAL_INTERNVAL_SHIFT=$(( INTERVAL_SHIFT * 2 ))
                      ;;
               'D#' ) BG_COLOR=21
                      FG_COLOR=248
                      TOTAL_INTERNVAL_SHIFT=$(( INTERVAL_SHIFT * 3 ))
                      ;;
               'E' )  BG_COLOR=63
                      FG_COLOR=248
                      TOTAL_INTERNVAL_SHIFT=$(( INTERVAL_SHIFT * 4 ))
                      ;;
               'F' )  BG_COLOR=92
                      FG_COLOR=248
                      TOTAL_INTERNVAL_SHIFT=$(( INTERVAL_SHIFT * 5 ))
                      ;;
               'F#' ) BG_COLOR=125
                      FG_COLOR=248
                      TOTAL_INTERNVAL_SHIFT=$(( INTERVAL_SHIFT * 6 ))
                      ;;
               'G' )  BG_COLOR=9
                      FG_COLOR=248
                      TOTAL_INTERNVAL_SHIFT=$(( INTERVAL_SHIFT * 7 ))
                      ;;
               'G#' ) BG_COLOR=202
                      FG_COLOR=248
                      TOTAL_INTERNVAL_SHIFT=$(( INTERVAL_SHIFT * 8 ))
                      ;;
               'A' )  BG_COLOR=214
                      FG_COLOR=248
                      TOTAL_INTERNVAL_SHIFT=$(( INTERVAL_SHIFT * 9 ))
                      ;;
               'A#' ) BG_COLOR=226
                      FG_COLOR=248
                      TOTAL_INTERNVAL_SHIFT=$(( INTERVAL_SHIFT * 10 ))
                      ;;
               'B' )  BG_COLOR=190
                      FG_COLOR=248
                      TOTAL_INTERNVAL_SHIFT=$(( INTERVAL_SHIFT * 11 ))
                      ;;
       esac

       printf "%${OCTAVE_SHIFT}s%${TOTAL_INTERNVAL_SHIFT}s\e[38;5;${FG_COLOR}m\e[48;5;${BG_COLOR}m%-${INTERVAL_SHIFT}s\e[0m\n" " " "$INTERVAL_SPACE"  "$1"
}

function play_tone {
       play -qn synth ${3} sine "${1}$((${2} + 1))" >/dev/null 2>&1  
}


function pause { sleep ${1}; } 

function print_pause { echo; } 


GLOBAL_INTERVAL=19


print_tone "C"  0 $GLOBAL_INTERVAL; play_tone "C"   4 1
print_tone "C#" 0 $GLOBAL_INTERVAL; play_tone "C#"  4 1

print_pause; pause .5

print_tone "C#" 0 $GLOBAL_INTERVAL; play_tone "C#"  4 1
print_tone "D"  0 $GLOBAL_INTERVAL; play_tone "D"   4 1

print_pause; pause .5

for note in "D#" "E" "F" "F#" "G" "G#" "A" "A#" "B"; do 

        print_tone "$note"  0 $GLOBAL_INTERVAL; play_tone "$note"   4 1
done
