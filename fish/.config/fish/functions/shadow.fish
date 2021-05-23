function shadow
  set -l file $argv[1]
  convert $file \( +clone -background black -shadow 80x10+10+10 \) +swap -bordercolor none -border 10 -background none -layers merge +repage $file
end
