#!/bin/bash

# result=$(tempfile)

# dialog --clear --title "Select a keyboard layout switching keys:" \
#         --menu "Selection a keyboard layout" 20 51 4 \
#         "ruwin_alt_sh-UTF-8"  "Alt+Shift" \
#         "ruwin_ct_sh-UTF-8" "Ctrl+Shift" \
#         "ruwin_cplk-UTF-8" "CapsLock" \
#          2> $result
# echo $(cat $result)



result=$(tempfile)
trap "rm -f $result" 0 1 2 5 15

dialog --backtitle "What do you wont to rusification?" \
        --title "Select options" --clear \
        --checklist "What do you wont to rusification?" 20 61 5 \
        "RU_X" "Х-windows" on \
        "RU_CONSOLE"  "console" off \
        "RU_MAN"    "man pages" off \
        2> $result

ACTIONS=$(cat $result)
echo $ACTIONS

if [[ "${ACTIONS[@]}" =~ "RU_MAN" ]]; then
    echo "RU_MAN" 
fi
