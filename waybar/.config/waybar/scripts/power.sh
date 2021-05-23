#!/bin/bash

if [ $(pgrep lavalauncher | wc -l) -ge 2 ]; then
  kill -INT $(pgrep lavalauncher | tail -1)
else
  sed -i 's/output=DP-2/output=HDMI-A-1/g' ~/.config/lavalauncher/lock.conf
  lavalauncher -c ~/.config/lavalauncher/lock.conf
  sed -i 's/output=HDMI-A-1/output=DP-2/g' ~/.config/lavalauncher/lock.conf
fi

kill %%
