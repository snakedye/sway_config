#!/bin/bash

echo '{"text": "'$(playerctl metadata title)'", "tooltip": "'$(playerctl metadata title)'", "class": "'$(playerctl status)'" }' | sed -e 's/" - "/""/'
