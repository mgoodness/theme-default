function fish_mode_prompt
  set -l cwd

  if set -q theme_short_path
    set cwd (basename (prompt_pwd))
  else
    set cwd (prompt_pwd)
  end

  switch "$fish_bind_mode"
    case default
      set_color blue
    case insert
      set_color green
    case replace-one
      set_color red
    case visual
      set_color yellow
  end

  if git_is_repo
    if set -q theme_short_path
      set root_folder (command git rev-parse --show-toplevel ^/dev/null)
      set parent_root_folder (dirname $root_folder)
      set cwd (echo $PWD | sed -e "s|$parent_root_folder/||")
    end
  end

  echo -n -s $cwd $normal_color
end
