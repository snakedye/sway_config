function birch
  set -l NICK 'snakedye'
  set -l CHANNEL '#river'
  set -l SERVER 'irc.libera.chat'
  /usr/bin/birch -u "$NICK" -s "$SERVER"
end
