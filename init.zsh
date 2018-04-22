p6df::modules::aws::version() { echo "0.0.1" }
p6df::modules::aws::deps() { 
	ModuleDeps=()
}

# aws
# awsdocs
# awslabs
# aws-samples
# awscli
 
p6df::modules::aws::externali::brew() { 

  brew tap wallix/awless
  brew install awless

  brew install awscli
  brew install aws-shell
}

p6df::modules::aws::init() {

  source <(awless completion zsh)
}

p6df::modules::aws::init
