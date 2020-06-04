p6df::modules::aws::version() { echo "0.0.1" }
p6df::modules::aws::deps() {
    ModuleDeps=(
	p6m7g8/p6aws
	aws/aws-codebuild-docker-images
    )
}

p6df::modules::aws::external::brew() {

  brew install awscli
  brew install awsebcli

  brew tap aws/tap
  brew install aws-sam-cli

  brew inatall amazon-ecs-cli

  brew install aws-iam-authenticator
  brew install aws-okta

  brew install cfn-lint

  brew install aws-shell

  brew install awslogs

  brew tap wallix/awless
  brew install awless

  # cdk pack
  brew install maven
  brew cask install dotnet-sdk
}

p6df::modules::aws::langs::node() {

  npm uninstall -g aws-sdk uuid aws-cdk
  nodenv rehash

  npm install   -g aws-sdk uuid aws-cdk
  nodenv rehash

  npm list --depth 0 -g
}

p6df::modules::aws::langs() {

  # ruby
  gem install cfn-nag
  rbenv rehash

  # js(node)
  p6df::modules::aws::langs::node

  # python
  pip install taskcat
  pip install boto3
  pyenv rehash

  # go
  go get github.com/aws/aws-sdk-go

  # cdk pack
  pip install twine
  pyenv rehash

  # codebuild local
  docker pull amazon/aws-codebuild-local:latest --disable-content-trust=false
}

p6df::modules::aws::home::symlink() {

  ln -fs $P6_DFZ_SRC_DIR/$USER/home-private/aws .aws
}

p6df::modules::aws::init() {

  p6df::modules::aws::cdkaliases
  p6df::util::path_if "$P6_DFZ_SRC_DIR/aws/aws-codebuild-docker-images/local_builds"
}

p6df::modules::aws::cdkaliases() {

  # runs an npm script via lerna for a the current module
  alias lr='lerna run --stream --scope $(node -p "require(\"./package.json\").name")'

  # runs "npm run build" (build + test) for the current module
  alias lb='lr build'
  alias lt='lr test'

  # runs "npm run watch" for the current module (recommended to run in a separate terminal session)
  alias lw='lr watch'
}

p6df::prompt::aws::line() {

  p6_aws_prompt_info
}

p6_aws_prompt_info() {

    local cdk=$(p6_aws_cdk_prompt_info)

    local active=$(p6_aws_cfg_prompt_info "_active")
    local source=$(p6_aws_cfg_prompt_info "_source")
    local saved=$(p6_aws_cfg_prompt_info "_saved")

    local sts=$(p6_aws_sts_prompt_info "$(p6_aws_sts_svc_cred_file)")

    local str
    local item
    for item in "$cdk" "$active" "$source" "$saved" "$sts"; do
	if ! p6_string_blank "$item"; then
	    str=$(p6_string_append "$str" "$item" "
")
	fi
    done

    str=$(echo $str | perl -p -e 's,^\s*,,')

    p6_return_str "$str"
}
