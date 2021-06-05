#!/bin/sh

inline () {
  echo $@ | tr -d '\r\n' | sed 's/ //g'
}

CLIENT=kile
LAYOUT=$(inline "focused|
  {vertical:
    horizontal,
    (
      {horizontal:tab,deck};
      1;0.65;0
    )
}|1|0.65|0")

riverctl set-layout-value $CLIENT string layout "$LAYOUT"
