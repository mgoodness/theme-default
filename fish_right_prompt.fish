function __get_aws_profile
  if test -n "$aws_profile"
    echo -n "[$aws_profile]"
  end
end

function __get_k8s_context
  if command --search kubectl > /dev/null
    set -l k8s_context (kubectl config current-context)

    if test -n "$k8s_context"
      echo -n "($k8s_context)"
    end
  end
end

function fish_right_prompt
  set_color $fish_color_autosuggestion ^/dev/null; or set_color 555
  __get_aws_profile
  __get_k8s_context
  set_color normal
end
