function manga_menu --description 'nwggrid menu for mangas in library'
  set opacity "$argv[1]"
  set colour "$argv[2]"
  set -l args ""
  ls $HOME/.mangas/ | while read manga
    set args "$HOME/.mangas/$manga/.chapter:$args"
  end
  nwggrid -d $args -s 230 -o $opacity -b $colour -n 6 -c manga.css
end
