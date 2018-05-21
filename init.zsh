p6df::modules::aws::version() { echo "0.0.1" }
p6df::modules::aws::deps() { 
	ModuleDeps=(p6m7g8/p6aws)
}

# aws
# awsdocs
# awslabs
# aws-samples
# awscli
 
#  source <(awless completion zsh)

p6df::modules::aws::externali::brew() { 

  brew tap wallix/awless
  brew install awless

  brew install awscli
  brew install aws-shell
}

p6df::modules::aws::init() {

}

p6df::prompt::aws::line() {

  aws_sts_target_source_prompt_info
  aws_sts_source_prompt_info
  aws_sts_prompt_info
}

aws_sts_target_source_prompt_info() {

  local assumed=
  if [ -n "$AWS_SOURCE_DEFAULT_PROFILE" ]; then
      assumed="ASSUMED:"
  fi
  if [ -n "$AWS_DEFAULT_PROFILE" ]; then
    echo "aws:\t${assumed}[$AWS_DEFAULT_PROFILE($AWS_ENV/$ENV_LEVEL) - $AWS_DEFAULT_REGION($AWS_VPC)]"
  fi
}

aws_sts_source_prompt_info() {

  if [ -n "$AWS_SOURCE_DEFAULT_PROFILE" ]; then
    echo "aws:\tSOURCE:[$AWS_SOURCE_DEFAULT_PROFILE($AWS_SOURCE_ENV/$SOURCE_ENV_LEVEL) - $AWS_SOURCE_DEFAULT_REGION($AWS_VPC)]"
  fi
}

aws_sts_prompt_info() {

    local creds=~/.aws/credentials
    [ -e $creds ] || return

    local mtime=$(mtime "$creds")
    local now=$(now)
    local diff=$(($now-$mtime))

    if [ $diff -gt 7200 ]; then
        echo ""
    elif [ $diff -gt 3600 ]; then
        echo "sts:\t${red}$diff${norm}s"
    elif [ $diff -gt 3500 ]; then
        echo "sts:\t${cyan}$diff${norm}s"
    else
        echo "sts:\t${green}$diff${norm}s"
    fi
}

p6df::modules::aws::init
