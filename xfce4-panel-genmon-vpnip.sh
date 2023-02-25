#!/bin/sh

#
# a fork of /usr/share/kali-themes/xfce4-panel-genmon-vpnip.sh
# with copy to clipboard on click on icon 
# and parametrable interface
# 

if [ $# -ne 1 ]; then
  interface="$(ip tuntap show | cut -d : -f1 | head -n 1)"
else
  interface=$1
fi

ip="$(ip a s "${interface}" 2>/dev/null \
  | grep -o -P '(?<=inet )[0-9]{1,3}(\.[0-9]{1,3}){3}')"

if [ "${ip}" != "" ]; then
  printf "<icon>network-vpn-symbolic</icon>
  printf "<iconclick>sh -c 'echo -n ${ip} | xclip -selection clipboard'</iconclick>"
  printf "<txt>${ip}</txt>"
  printf "<tool>${interface} IP</tool>"
else
  printf "<txt></txt>"
fi
