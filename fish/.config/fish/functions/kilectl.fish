function kilectl --description "Shortcut for riverctl"
  makoctl reload
  notify-send "$argv[1]" "$argv[2]" -i ~/Pictures/layouts/kile.svg
  riverctl set-layout-value kile string $argv[1] $argv[2]
end
