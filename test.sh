need_ru_console()
{
 while true; do
    read -p "Вы хотитке русифицировать консоль? (y/n): " RU_CONSOLE
    case $RU_CONSOLE in
        [Yy]* )RU_CONSOLE=Y; break;; 
        [Nn]* )RU_CONSOLE=N; break;;
        * ) echo "Please answer [y]es or [n]o.";;
    esac
 done
}

need_ru_console

echo "$RU_CONSOLE"

if [[ $RU_CONSOLE = "Y" ]]; then
    echo "YES"
fi

SVERSION=$(cat /etc/slackware-version)

case $SVERSION in 
"Slackware 14.2" ) 
  MANCONF="/etc/man.conf"
  XKB="/etc/X11/xorg.conf.d/90-keyboard-layout.conf"
  KLC="/usr/share/X11/xorg.conf.d/90-keyboard-layout.conf"
  ;;
"Slackware 14.2+" | "Slackware 15"  ) 
  XKB="/etc/X11/xorg.conf.d/90-keyboard-layout-evdev.conf"
  KLC="/usr/share/X11/xorg.conf.d/90-keyboard-layout-evdev.conf"
  MANCONF="/etc/man_db.conf"
  ;;
esac 

echo $XKB
echo $MANCONF