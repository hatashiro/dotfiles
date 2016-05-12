function fish_prompt
  set_color FF0
  echo -n (basename $PWD)
  set_color normal
  echo -n $normal ') '
end
