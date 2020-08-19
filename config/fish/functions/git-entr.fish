# Defined in - @ line 1
function git-entr --wraps='git ls-files -cdmo --exclude-standard | entr -d ' --description 'alias git-entr=git ls-files -cdmo --exclude-standard | entr -d '
  git ls-files -cdmo --exclude-standard | entr -d  $argv;
end
