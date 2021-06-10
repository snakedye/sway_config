export NNN_PLUG='o:fzopen;m:nmount;x:_chmod +x $nnn;u:gofile;w:_wofer $nnn;i:imgur'
export NNN_FCOLORS='899791bbfc6cdfde'
export NNN_COLORS='#df;#97'
export NNN_OPENER=$HOME/.config/nnn/plugins/launcher
export NNN_BMS='c:~/.config/;p:~/projects/;j:~/java;s:~/School;i:~/.ideas'
set --export NNN_FIFO '/tmp/nnn.fifo'
alias nnn "/usr/local/bin/nnn -E -c -A -Q $argv"

