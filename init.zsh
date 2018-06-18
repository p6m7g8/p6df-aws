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

p6df::modules::aws::external::brew() {

  brew tap wallix/awless
  brew install awless

  brew install awscli
  brew install aws-shell
}

p6df::modules::aws::home::symlink() { 

 # XXX: symlink to private
}

p6df::modules::aws::init() {

    export DAAS_JC_EMAIL=pgollucci@p6m7g8.com
    export JC_EMAIL=pgollucci@p6m7g8.com

    AWS_ORG=$P6_AWS_ORG

    AWS_DIR=$HOME/.aws
    AWS_ACCOUNT_MAP=$AWS_DIR/map-$AWS_ORG
    AWS_CREDENTIAL_FILE=$AWS_DIR/credentials
    AWS_ASSUMED_CREDENTIAL_FILE=$AWS_CREDENTIAL_FILE-assumed
    AWS_SOURCE_CREDENTIAL_FILE=$AWS_CREDENTIAL_FILE-source

    AWS_ROLE_SESSION_NAME=$DAAS_JC_EMAIL

    alias sts="p6_GLOBAL_aws_sts_svc_refresh"
    alias aosu="p6_GLOBAL_aws_sts_svc_org_su"
    alias asu="p6_GLOBAL_aws_sts_svc_role_assume"
    alias assh="p6_GLOBAL_aws_ssh_svc_do"
}

p6_GLOBAL_aws_sts_svc_refresh() {

  p6_aws_sts_svc_refresh $AWS_CREDENTIAL_FILE $AWS_ACCOUNT_MAP $AWS_ORG $DAAS_JC_EMAIL
}

p6_GLOBAL_aws_sts_svc_org_su() {
  
  p6_aws_sts_svc_org_su "$1" "us-east-1" "text" $AWS_ACCOUNT_MAP OrganizationAccountAccessRole $AWS_ROLE_SESSION_NAME $AWS_CREDENTIAL_FILE $AWS_SOURCE_CREDENTIAL_FILE $AWS_ASSUMED_CREDENTIAL_FILE
}

p6_GLOBAL_aws_sts_svc_role_assume() {
  
  p6_aws_sts_svc_role_assume "$2" "us-east-1" "text" "$1" $AWS_ROLE_SESSION_NAME $AWS_CREDENTIAL_FILE $AWS_SOURCE_CREDENTIAL_FILE $AWS_ASSUMED_CREDENTIAL_FILE
}

p6_GLOBAL_aws_ssh_svc_do() {

 p6_aws_ssh_svc_do ${1}.p6m7g8.net
}

p6df::prompt::aws::line() {

  p6_aws_sts_target_source_prompt_info
  p6_aws_sts_source_prompt_info
  p6_aws_sts_prompt_info $AWS_CREDENTIAL_FILE
}

p6_aws_sts_target_source_prompt_info() {

  local assumed=
  if [ -n "$AWS_SOURCE_DEFAULT_PROFILE" ]; then
      assumed="ASSUMED:"
  fi
  if [ -n "$AWS_DEFAULT_PROFILE" ]; then
    echo "aws:\t${assumed}[$AWS_DEFAULT_PROFILE($AWS_ENV/$ENV_LEVEL) - $AWS_DEFAULT_REGION($AWS_VPC)]"
  fi
}

p6_aws_sts_source_prompt_info() {

  if [ -n "$AWS_SOURCE_DEFAULT_PROFILE" ]; then
    echo "aws:\tSOURCE:[$AWS_SOURCE_DEFAULT_PROFILE($AWS_SOURCE_ENV/$SOURCE_ENV_LEVEL) - $AWS_SOURCE_DEFAULT_REGION($AWS_VPC)]"
  fi
}

p6_aws_sts_prompt_info() {
    local creds="$1"

    p6_file_exists $creds || return

    local mtime=$(p6_dt_mtime "$creds")
    local now=$(p6_dt_now_epoch_seconds)
    local diff=$(($now-$mtime))

    if [ $diff -gt 7200 ]; then
	echo ""
    elif [ $diff -gt 3600 ]; then
	echo "sts:\t$diff"
    elif [ $diff -gt 3500 ]; then
	echo "sts:\t$diff"
    else
	echo "sts:\t$diff"
    fi
}
