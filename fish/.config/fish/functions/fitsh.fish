function header -d 'message header can be whatever'
  set -l block (set_color cyan -o) "There's nothing more gay..."
  echo -ne $block\n
end

function footer -d 'message footer can be whatever'
  set -l block (set_color cyan -o) "than launching a terminal with a fetch"
  echo -ne $block\n
end

function seperator
  set -l block (set_color purple) '~ '
  echo $block
end

function display_host
  set -l host (cat /etc/hostname)
  set -l title_block '  '(set_color green -o) $host@$USER
  set -l text_block (set_color yellow) snakedye
  echo -ne $title_block \n
end

function display_compositor
  set -l title_block '  '(set_color blue -o) compositor
  set -l text_block (set_color yellow) $XDG_CURRENT_DESKTOP
  echo -ne $title_block $text_block \n
end

function display_kernel
  set -l kernel (uname -sr | sed 's/-.*//' | sed 's/Linux //' )
  set -l title_block '  '(set_color blue -o) kernel'    '
  set -l text_block (set_color yellow) $kernel
  echo -ne $title_block $text_block \n
end

function display_term
  set -l title_block '  '(set_color blue -o) term'      '
  set -l text_block (set_color yellow) $TERM
  echo -ne $title_block $text_block \n
end

function display_packages
  set -l packages (pacman -Q | wc -l)
  set -l title_block '  '(set_color blue -o) packages'  '
  set -l text_block (set_color yellow) $packages
  echo -ne $title_block $text_block \n
end

function display_shell
  set -l title_block '  '(set_color blue -o) shell'     '
  set -l text_block (set_color yellow) (basename $SHELL)
  echo -ne $title_block $text_block \n
end

function display_uptime
  set -l uptime (uptime -p | grep -o '[0-9]* [a-z]*')
  set -l days (echo $uptime | grep day | awk '{print $1}')
  set -l hours (echo $uptime | grep hour | awk '{print $1}')
  set -l minutes (uptime -p | grep -o '[0-9]* [a-z]*' | grep minute| awk '{print $1}')
  set -l title_block '  '(set_color blue -o) uptime'    '
  if test -z days
    set days '00'
  else if test -z days
    set hours '00'
  else if test -z days
    set minutes '00'
  end
  set text_block (set_color yellow) $days'd' $hours'h' $minutes'm'
  echo -ne $title_block $text_block \n
end

function color_block
  echo -ne '   '(set_color -b black)'  '(set_color -b red)'  '(set_color -b green)'  '(set_color -b yellow)'  '(set_color -b blue)'  '(set_color -b cyan)'  '(set_color -b purple)'  '(set_color -b normal)\n
end

function color_block_light
  echo -ne '   '(set_color -b brblack)'  '(set_color -b brred)'  '(set_color -b brgreen)'  '(set_color -b bryellow)'  '(set_color -b brblue)'  '(set_color -b brcyan)'  '(set_color -b brpurple)'  '(set_color -b normal)\n
end

function fitsh --description 'custom fetch'
  # header
  echo ""
  display_host
  display_compositor
  display_kernel
  display_uptime
  display_packages
  display_term
  display_shell
  echo ""
  color_block
  # panes
  color_block_light
  # footer
  echo ""
end
