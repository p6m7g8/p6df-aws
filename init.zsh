######################################################################
#<
#
# Function: p6df::modules::aws::deps()
#
#>
######################################################################
p6df::modules::aws::deps() {
  ModuleDeps=(
    p6m7g8/p6df-docker
    p6m7g8/p6df-java p6m7g8/p6df-js p6m7g8/p6df-python p6m7g8/p6df-go p6m7g8/p6df-ruby p6m7g8/p6df-rust
    p6m7g8/p6aws
    aws/aws-codebuild-docker-images
  )
}

######################################################################
#<
#
# Function: p6df::modules::aws::vscodes()
#
#>
######################################################################
p6df::modules::aws::vscodes() {

  code --install-extension amazonwebservices.aws-toolkit-vscode
  code --install-extension aws-amplify.aws-amplify-vscode
  code --install-extension iann0036.live-share-for-aws-cloud9
  code --install-extension vscode-aws-console.vscode-aws-console
  code --install-extension loganarnett.lambda-snippets
}

######################################################################
#<
#
# Function: p6df::modules::aws::external::brew()
#
#>
######################################################################
p6df::modules::aws::external::brew() {

  brew install awscli
  brew install awsebcli

  brew tap aws/tap
  brew install aws-sam-cli

  brew install amazon-ecs-cli
  brew tap weaveworks/tap
  brew install weaveworks/tap/eksctl
  brew install fargatecli

  brew install aws/tap/copilot-cli

  brew install aws-iam-authenticator

  brew install cfn-lint

  brew install awslogs

  brew install aws-shell

  brew tap wallix/awless
  brew install awless

  brew install aws-vault
}

######################################################################
#<
#
# Function: p6df::modules::aws::langs::js()
#
#>
######################################################################
p6df::modules::aws::langs::js() {

  npm install -g aws-sdk
  npm install -g @aws-amplify/cli --verbose
  nodenv rehash

  npm list --depth 0 -g
}

######################################################################
#<
#
# Function: p6df::modules::aws::langs::ruby()
#
#>
######################################################################
p6df::modules::aws::langs::ruby() {

  gem install -v aws-sdk
  rbenv rehash
}

######################################################################
#<
#
# Function: p6df::modules::aws::langs::python()
#
#>
######################################################################
p6df::modules::aws::langs::python() {

  # python
  pip install boto3
  pip install taskcat
  pip install ec2instanceconnectcli
  pyenv rehash
}

######################################################################
#<
#
# Function: p6df::modules::aws::langs::go()
#
#>
######################################################################
p6df::modules::aws::langs::go() {

  go get github.com/aws/aws-sdk-go
}

######################################################################
#<
#
# Function: p6df::modules::aws::langs::rust()
#
#>
######################################################################
p6df::modules::aws::langs::rust() {

  cargo install cfn-guard
  cargo install cfn-guard-lambda
  cargo install cfn-guard-rulegen
  cargo install cfn-guard-rulegen-lambda
  # cargo install cfn-custom-resource
  # cargo install cfn-resource-provider
}

######################################################################
#<
#
# Function: p6df::modules::aws::langs()
#
#  Environment:	 P6_DFZ_SRC_P6M7G8_DIR
#>
######################################################################
p6df::modules::aws::langs() {

  p6df::modules::aws::langs::js
  p6df::modules::aws::langs::python
  p6df::modules::aws::langs::go
  p6df::modules::aws::langs::ruby
  p6df::modules::aws::langs::rust

  # codebuild local
  docker pull amazon/aws-codebuild-local:latest --disable-content-trust=false

  # eks kubectl client
  curl -o $P6_DFZ_SRC_P6M7G8_DIR/p6df-aws/libexec/aws-eks-kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.9/2020-08-04/bin/darwin/amd64/kubectl
}

######################################################################
#<
#
# Function: p6df::modules::aws::home::symlink()
#
#  Environment:	 P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::aws::home::symlink() {

  rm -rf .aws
  mkdir .aws

  (
    cd .aws
    for file in $P6_DFZ_SRC_DIR/$USER/home-private/aws/*; do
      echo ln -fs $file .
      #      ln -fs $file .
    done

    echo ln -fs $P6_DFZ_SRC_DIR/p6m7g8/p6df-aws/share/cli
    #    ln -fs $P6_DFZ_SRC_DIR/p6m7g8/p6df-aws/share/cli
  )
}

######################################################################
#<
#
# Function: p6df::modules::aws::init()
#
#  Environment:	 P6_DFZ_SRC_DIR P6_DFZ_SRC_P6M7G8_DIR
#>
######################################################################
p6df::modules::aws::init() {

  p6df::util::path_if "$P6_DFZ_SRC_DIR/aws/aws-codebuild-docker-images/local_builds"
  p6df::util::path_if "$P6_DFZ_SRC_P6M7G8_DIR/p6df-aws/libexec"
}

######################################################################
#<
#
# Function: p6df::modules::aws::prompt::line()
#
#  Depends:	 p6_string
#>
######################################################################
p6df::modules::aws::prompt::line() {

  p6_aws_prompt_info
}

######################################################################
#<
#
# Function: str str = p6_aws_prompt_info()
#
#  Returns:
#	str - str
#
#  Depends:	 p6_string
#>
######################################################################
p6_aws_prompt_info() {

  local active=$(p6_aws_cfg_prompt_info "_active")
  local source=$(p6_aws_cfg_prompt_info "_source")
  local saved=$(p6_aws_cfg_prompt_info "_saved")

  local sts=$(p6_aws_sts_prompt_info "$(p6_aws_env_shared_credentials_file_active)")

  local str
  local item
  for item in "$active" "$source" "$saved" "$sts"; do
    if ! p6_string_blank "$item"; then
      str=$(p6_string_append "$str" "$item" "
")
    fi
  done

  str=$(p6_echo $str | perl -p -e 's,^\s*,,')

  p6_return_str "$str"
}
