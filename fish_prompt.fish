# You can override some default options with config.fish:
#
#  set -g theme_short_path

function fish_prompt
  set -l last_status $status

  set -l ahead    "↑"
  set -l behind   "↓"
  set -l diverged "⥄ "
  set -l fish     (test (uname) = Darwin; and echo "⋊>"; or echo "⋊ >")

  set -l clean_color      (set_color green)
  set -l error_color      (set_color $fish_color_error ^/dev/null; or set_color red)
  set -l normal_color     (set_color normal)
  set -l touched_color    (set_color yellow)

  if git_is_repo
    set -l branch_color $clean_color
    if git_is_touched
      set branch_color $touched_color
    end

    echo -n -s $normal_color ' · '
    echo -n -s '(' $branch_color (git_branch_name)
    echo -n -s (git_ahead $ahead $behind $diverged $none)
    echo -n -s $normal_color ')'
  end

  set -l prompt_color $error_color
  if test $last_status = 0
    set prompt_color $normal_color
  end

  echo -n -s $prompt_color " $fish "
end
