p6df::modules::aws::version() { echo "0.0.1" }
p6df::modules::aws::deps() { ModuleDeps=(p6m7g8/p6aws) }

# aws
# awsdocs
# aws-samples

#  source <(awless completion zsh)

# aws cloudformation validate-template

p6df::modules::aws::external::brew() {

  brew tap wallix/awless
  brew install awless

  brew install awscli
  brew install aws-iam-authenticator

  brew tap aws/tap
  brew install aws-sam-cli

  brew install aws-shell

  brew install cfn-lint
}

p6df::modules::aws::langs() {

  # ruby
  gem install
  gem install cfn-nag
  rbenv rehash

  # node
  npm install -g aws-sdk
  npm install -g uuid

  npm install -g aws-cdk
  npm install -g typescript
  nodenv rehash

  # python
  pip install taskcat
  pyenv rehash

  # go
  go get github.com/aws/aws-sdk-go
}

p6df::modules::aws::home::symlink() {

  ln -fs $P6_DFZ_SRC_DIR/$USER/home-private/aws .aws
}

p6df::modules::aws::init() {

  AWS_DIR=$HOME/.aws
  AWS_ORG=$P6_AWS_ORG

  AWS_ACCOUNT_MAP=$AWS_DIR/map-$AWS_ORG
  AWS_CREDENTIAL_FILE=$AWS_DIR/credentials
  AWS_ASSUMED_CREDENTIAL_FILE=$AWS_CREDENTIAL_FILE-assumed
  AWS_SOURCE_CREDENTIAL_FILE=$AWS_CREDENTIAL_FILE-source

  AWS_ROLE_SESSION_NAME=$DAAS_JC_EMAIL

  alias sts="p6_GLOBAL_aws_sts_svc_refresh"
  alias ac="p6_GLOBAL_aws_organizations_svc_account_make"
  alias asc="p6_GLOBAL_aws_shortcuts"
  alias aosu="p6_GLOBAL_aws_sts_svc_org_su"
  alias asu="p6_GLOBAL_aws_sts_svc_role_assume"
  alias assh="p6_GLOBAL_aws_ssh_svc_do"
}

p6df::prompt::aws::line() {

  p6_aws_sts_target_source_prompt_info
  p6_aws_sts_source_prompt_info
  p6_aws_sts_prompt_info "$AWS_CREDENTIAL_FILE"
}

p6_GLOBAL_aws_shortcuts() {
  p6_aws_shortcuts "$AWS_ORG" "$AWS_CREDENTIAL_FILE"
}

p6_GLOBAL_aws_organizations_svc_account_make() {
  local account_alias="$1"

  # XXX: move to zsh-me
  local email="pgollucci+aws+$account_alias@p6m7g8.com"

  p6_aws_organizations_svc_account_make "$AWS_CREDENTIAL_FILE" "$AWS_SOURCE_CREDENTIAL_FILE" "$AWS_ASSUMED_CREDENTIAL_FILE" "$AWS_ORG" \
					"$account_alias" "$email" "$AWS_ACCOUNT_MAP" "JumpCloud" "$DAAS_JC_EMAIL" \
					"us-east-1" "text" \
					"/SSO/SSO_Admin" "arn:aws:iam::aws:policy/AdministratorAccess" \
					"/C=US/ST=MD/L=Upper_Marlboro/O=$AWS_ORG/OU=Technology/CN=$account_alias" \
					"4096" "1024"
}

p6_GLOBAL_aws_sts_svc_refresh() {

  p6_aws_sts_svc_refresh "$AWS_CREDENTIAL_FILE" "$AWS_ACCOUNT_MAP" "$AWS_ORG" "$DAAS_JC_EMAIL"
}

p6_GLOBAL_aws_sts_svc_org_su() {
  local org="$1"

  p6_aws_organizations_svc_su "$org" "$AWS_ACCOUNT_MAP" "us-east-1" "text" "OrganizationAccountAccessRole" "$AWS_ROLE_SESSION_NAME" "$AWS_CREDENTIAL_FILE" "$AWS_SOURCE_CREDENTIAL_FILE" "$AWS_ASSUMED_CREDENTIAL_FILE"
}

p6_GLOBAL_aws_sts_svc_org_su_un() {

  p6_aws_organizations_svc_su_un "$AWS_CREDENTIAL_FILE" "$AWS_SOURCE_CREDENTIAL_FILE" "$AWS_ASSUMED_CREDENTIAL_FILE"
}

p6_GLOBAL_aws_sts_svc_role_assume() {

  p6_aws_sts_svc_role_assume "$2" "us-east-1" "text" "$1" $AWS_ROLE_SESSION_NAME $AWS_CREDENTIAL_FILE $AWS_SOURCE_CREDENTIAL_FILE $AWS_ASSUMED_CREDENTIAL_FILE
}

p6_GLOBAL_aws_ssh_svc_do() {
 local host="$1"

 p6_aws_ssh_svc_do "${host}.p6m7g8.net"
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
