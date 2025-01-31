#!/bin/bash

clear
source /opt/retronas/dialog/retronas.cfg
cd ${DIDIR}

rn_services() {
source /opt/retronas/dialog/retronas.cfg
dialog \
  --backtitle "RetroNAS" \
  --title "RetroNAS Services menu" \
  --clear \
  --menu "My IP addresses: ${MY_IPS} \
  \n
  \nPlease select an service to check" ${MG} 10 \
  "01" "Main Menu" \
  "02" "Samba" \
  "03" "Netatalk3" \
  "04" "EtherDFS" \
  "05" "lighttpd" \
  "06" "ProFTPd" \
  "07" "tftpd-hpa" \
  "08" "OpenSSH" \
  "09" "Telnet" \
  "50" "Syncthing" \
  "51" "Cockpit" \
  "52" "WebOne" \
  2> ${TDIR}/rn_services
}

SC="systemctl --no-pager --full"

while true
do
  rn_services
  CHOICE=$( cat ${TDIR}/rn_services )
  PAUSEMSG='Press [Enter] to continue...'
  case ${CHOICE} in
  02)
    # Samba
    clear
    CMD="${SC} status smbd"
    echo "$CMD"
    echo ; $CMD ; echo
    echo "${PAUSEMSG}"
    read -s
    clear
    CMD="smbstatus -vv"
    echo "$CMD"
    echo ; $CMD ; echo
    echo "${PAUSEMSG}"
    read -s
    ;;
  03)
    # Netatalk3
    clear
    CMD="${SC} status netatalk"
    echo "$CMD"
    echo ; $CMD ; echo
    echo "${PAUSEMSG}"
    read -s
    ;;
  04)
    # EtherDFS
    clear
    CMD="${SC} status etherdfs"
    echo "$CMD"
    echo ; $CMD ; echo
    echo "${PAUSEMSG}"
    read -s
    ;;

  05)
    # lighttpd
    clear
    CMD="${SC} status lighttpd"
    echo "$CMD"
    echo ; $CMD ; echo
    echo "${PAUSEMSG}"
    read -s
    ;;
  06)
    # ProFTPd
    clear
    CMD="${SC} status proftpd"
    echo "$CMD"
    echo ; $CMD ; echo
    echo "${PAUSEMSG}"
    read -s
    ;;
  07)
    # tftpd-hpa
    clear
    CMD="${SC} status tftpd-hpa"
    echo "$CMD"
    echo ; $CMD ; echo
    echo "${PAUSEMSG}"
    read -s
    ;;
  08)
    # OpenSSH
    clear
    CMD="${SC} status ssh"
    echo "$CMD"
    echo ; $CMD ; echo
    echo "${PAUSEMSG}"
    read -s
    ;;
  09)
    # Telnet
    clear
    CMD="${SC} status inetd"
    echo "$CMD"
    echo ; $CMD ; echo
    echo "${PAUSEMSG}"
    read -s
    ;;
  32)
    # ps3netsrv
    clear
    CMD="${SC} status ps3netsrv"
    echo "$CMD"
    echo ; $CMD ; echo
    echo "${PAUSEMSG}"
    read -s
    ;;
  50)
    # Syncthing file sync tool
    clear
    CMD="${SC} status syncthing@${OLDRNUSER}"
    echo "$CMD"
    echo ; $CMD ; echo
    echo "${PAUSEMSG}"
    read -s
    ;;
  51)
    # Cockpit
    clear
    CMD="${SC} status cockpit"
    echo "$CMD"
    echo ; $CMD ; echo
    echo "${PAUSEMSG}"
    read -s
    ;;
  52)
    # WebOne
    clear
    CMD="${SC} status webone"
    echo "$CMD"
    echo ; $CMD ; echo
    echo "${PAUSEMSG}"
    read -s
    ;;
  *)
    exit 1
    ;;
  esac
done
