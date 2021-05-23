function slurpshot
  switch $argv
    case -f
      grim - | swappy -f -
    case -g
      if ! test -z $SWAYSOCK
        set geometry (swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp)
      else
        set geometry (slurp -b 8d8d8d66 -c 3a3a3a)
      end

      if string match -r $geometry "[0-9]+.*" $geometry
        grim -g $geometry - | swappy -f -
      else
        set -l monitor (slurp -b 8d8d8d66 -c 3a3a3a -o -f "%o")
        grim -o $monitor - | swappy -f -
      end
    case -wf
      if ! test -z $SWAYSOCK
        set geometry (swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp)
      else
        set geometry (slurp)
      end

      set -l filename ~/Videos/(date +recording_%Y-%m-%d-%H%M%S.mp4)

      if string match -r $geometry "[0-9]+.*" $geometry
        ~/.local/bin/eww update recorder=true
        pkill -RTMIN+10 waybar
        wf-recorder -f $filename -g $geometry
        notify-send "Recording saved" $filename -i video
      else
        set -l monitor (slurp -b 8d8d8d66 -c 3a3a3a -o -f "%o")

        if test $monitor!=""
          ~/.local/bin/eww update recorder=true
          pkill -RTMIN+10 waybar
          wf-recorder -f $filename -o $monitor
          notify-send "Recording saved" $filename -i video
        end
      end
      pkill -RTMIN+10 waybar
      ~/.local/bin/eww update recorder=false
    end
end
