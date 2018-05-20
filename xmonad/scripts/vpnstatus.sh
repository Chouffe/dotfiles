#!/bin/bash

vpn_status () {
  ifconfig | grep tun | wc -l
}

vpn_status_string () {
  status=`vpn_status`
  if [ $status -eq 0 ]
  then
    echo "x"
  else
    echo "✓"
  fi
}

vpn_status_string
