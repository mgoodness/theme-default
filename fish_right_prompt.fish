function __get_k8s_context
  if test -n (kubectl config current-context)
    echo -e -n -s $k8s_color "($k8s_context)"
  end
end

function fish_right_prompt
  set_color $fish_color_autosuggestion ^/dev/null; or set_color 555
  __get_k8s_context
  set_color normal
end
