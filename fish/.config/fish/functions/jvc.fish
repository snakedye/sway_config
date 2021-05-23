function jvc --description "debug java"
  set -l class $argv
  while true
    if javac $argv'.java'
      java $argv
    end
    set input (read)
    if test -n $input
      set class $input
    end
  end
end
