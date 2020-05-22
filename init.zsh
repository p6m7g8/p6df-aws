p6df::modules::aws::version() { echo "0.0.1" }
p6df::modules::aws::deps() { ModuleDeps=(p6m7g8/p6aws) }

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

  brew tap wallix/awless
  brew install awless
}

p6df::modules::aws::langs::node() {

  npm uninstall -g aws-sdk uuid typescript aws-cdk
  nodenv rehash

  npm install -g aws-sdk uuid typescript aws-cdk
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
  pyenv rehash

  # go
  go get github.com/aws/aws-sdk-go

  # cdk pack
  brew install maven
  brew install dotnet-sdk
  pip install twine
  pyenv rehash
}

p6df::modules::aws::home::symlink() {

  ln -fs $P6_DFZ_SRC_DIR/$USER/home-private/aws .aws
}

p6df::modules::aws::init() {

  p6df::modules::aws::cdkaliases
}

p6df::modules::aws::cdkaliases() {

  # runs an npm script via lerna for a the current module
  alias lr='lerna run --stream --scope $(node -p "require(\"./package.json\").name")'

  # runs "npm run build" (build + test) for the current module
  alias lb='lr build'
  alias lt='lr test'

  # runs "npm run watch" for the current module (recommended to run in a separate terminal session):
  alias lw='lr watch'
}

p6df::prompt::aws::line() {

  p6_aws_cfg_prompt_info "_active"
  p6_aws_cfg_prompt_info "_source"
  p6_aws_cfg_prompt_info "_saved"

  p6_aws_sts_prompt_info "$(p6_aws_sts_svc_cred_file)"
}
