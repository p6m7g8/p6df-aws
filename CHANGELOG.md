# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

### [2.1.1](https://github.com/p6m7g8/p6df-aws/compare/v2.1.0...v2.1.1) (2021-04-04)


### Features

* **deps:** adds aws-vault ([272d630](https://github.com/p6m7g8/p6df-aws/commit/272d63033c824792f08c90e2be720712056cfbd1))


### Bug Fixes

* **api:** typo ([#30](https://github.com/p6m7g8/p6df-aws/issues/30)) ([1ad2f36](https://github.com/p6m7g8/p6df-aws/commit/1ad2f36b7c44c52dd53962cf552ef0d749eb31ba))
* **prompt:** use the right function ([#33](https://github.com/p6m7g8/p6df-aws/issues/33)) ([166a18c](https://github.com/p6m7g8/p6df-aws/commit/166a18cd0ecd95d5e15f7aac8c1e0ca2edebdf76))


* **deps:** catch up with p6aws updates ([#32](https://github.com/p6m7g8/p6df-aws/issues/32)) ([8e4dbe9](https://github.com/p6m7g8/p6df-aws/commit/8e4dbe9f07f08f173c9f27aaac3cf3b95fb6f581))
* **link:** remove rendundant symlinks; echo for now ([#35](https://github.com/p6m7g8/p6df-aws/issues/35)) ([d7a1393](https://github.com/p6m7g8/p6df-aws/commit/d7a139371b27af180054a88d46620f4dbfc41e08))
* **lint:** replaces cfn_nag (ruby gem) w/ cfn-guard (cargo crate) ([#34](https://github.com/p6m7g8/p6df-aws/issues/34)) ([2743bd3](https://github.com/p6m7g8/p6df-aws/commit/2743bd3081c85856c9a3923475896d85cb405a44))
* **README:** updates generator ([#31](https://github.com/p6m7g8/p6df-aws/issues/31)) ([bff49f0](https://github.com/p6m7g8/p6df-aws/commit/bff49f00ca726b24ebb0ce00854d03392a91996b))
* **vscode:** splits vscode extensions to their languages ([#36](https://github.com/p6m7g8/p6df-aws/issues/36)) ([d308b97](https://github.com/p6m7g8/p6df-aws/commit/d308b9758e7fa459249557902afa55cac2d6259f))
* **ws:** indents ([7957188](https://github.com/p6m7g8/p6df-aws/commit/7957188ca9d508b1fb0a8e8b9bb37ca1be57a03f))
* Coc -> .github ([cca4313](https://github.com/p6m7g8/p6df-aws/commit/cca43133ed0a662085cb46beb92a31e3182cb505))

## [2.1.0](https://github.com/p6m7g8/p6df-aws/compare/v2.0.0...v2.1.0) (2020-12-06)


### Features

* **api:** centralize ::version() ([c655ae2](https://github.com/p6m7g8/p6df-aws/commit/c655ae298141df26188f7511db7cd78bc553a6e7))
* **github:** adds ISSUE_TEMPLATEs ([#25](https://github.com/p6m7g8/p6df-aws/issues/25)) ([be80c45](https://github.com/p6m7g8/p6df-aws/commit/be80c45c71bb270dddb1b84a417d826c0eee148d))
* **mergify:** re-gens ([71917ca](https://github.com/p6m7g8/p6df-aws/commit/71917ca057c9eeeb92d224ddc918278df42fdde2))


### Bug Fixes

* **langs:** fixes typos, turns on verbosity ([#29](https://github.com/p6m7g8/p6df-aws/issues/29)) ([0f07500](https://github.com/p6m7g8/p6df-aws/commit/0f0750008feb8383f4398fe9cc14e3d951bcb11a))


* **README:** fixes module expansion, adds CodeCov and Synk badges ([#28](https://github.com/p6m7g8/p6df-aws/issues/28)) ([5e8fe77](https://github.com/p6m7g8/p6df-aws/commit/5e8fe775b7c5fded764ebcfbcde84d32153b8929))
* **README:** updates to template v2.0 ([#26](https://github.com/p6m7g8/p6df-aws/issues/26)) ([3699ca1](https://github.com/p6m7g8/p6df-aws/commit/3699ca1004517a5cdfe67a1aea1267321d3064e1))
* **semantic:** no longer needed, defaults are fine ([#24](https://github.com/p6m7g8/p6df-aws/issues/24)) ([1460eeb](https://github.com/p6m7g8/p6df-aws/commit/1460eeb3b13e9a9bbee9a2460bde30722424d29a))

## [2.0.0](https://github.com/p6m7g8/p6df-aws/compare/v1.0.1...v2.0.0) (2020-10-11)


### Features

* **api:** fixes depends, `aws-okta is EOL` ([#19](https://github.com/p6m7g8/p6df-aws/issues/19)) ([4f7c575](https://github.com/p6m7g8/p6df-aws/commit/4f7c5753e08d560e28efa40ea2550e577c91fdfd))
* **bew:** add copilot, fargate, amplify clis ([#16](https://github.com/p6m7g8/p6df-aws/issues/16)) ([d5ec79c](https://github.com/p6m7g8/p6df-aws/commit/d5ec79c383e72d882896979400ccca1d7a0f701e))
* **brew:** adds eksctl ([#14](https://github.com/p6m7g8/p6df-aws/issues/14)) ([351291e](https://github.com/p6m7g8/p6df-aws/commit/351291eac8fb6891adc0536f026da947e8951886))
* **langs:** setup the aws eks kubectl cli per doc ([#15](https://github.com/p6m7g8/p6df-aws/issues/15)) ([cb78f3e](https://github.com/p6m7g8/p6df-aws/commit/cb78f3ec75da35986d3710b93154636f99bc596a))


### Bug Fixes

* **langs:** move aws-cdk node module to p6df-awscdk ([#18](https://github.com/p6m7g8/p6df-aws/issues/18)) ([ec2226c](https://github.com/p6m7g8/p6df-aws/commit/ec2226c55e4caa483ca947cacfbcc21c6ba7996b))


* **api:** move cdk to cdk, eks to eks, functionalize, +ec2instanceconnectcli ([#17](https://github.com/p6m7g8/p6df-aws/issues/17)) ([2207420](https://github.com/p6m7g8/p6df-aws/commit/2207420b0e366246b5af6595b259ce13f9ff45a4))

### [1.0.1](https://github.com/p6m7g8/p6df-aws/compare/v1.0.0...v1.0.1) (2020-09-20)


### Features

* **prompt:** adds eks prompt ([#13](https://github.com/p6m7g8/p6df-aws/issues/13)) ([53b8ba9](https://github.com/p6m7g8/p6df-aws/commit/53b8ba9e6806cb3e8a0ed7a4c107c71a5bdcb1b0))


### Bug Fixes

* **version:** match tag ([#12](https://github.com/p6m7g8/p6df-aws/issues/12)) ([84456cd](https://github.com/p6m7g8/p6df-aws/commit/84456cd774fc1ab01f115a3298a54bc329748537))

## 1.0.0 (2020-06-07)


### Features

* **cicd:** setups semantic-version ([#8](https://github.com/p6m7g8/p6df-aws/issues/8)) ([8f1f9fa](https://github.com/p6m7g8/p6df-aws/commit/8f1f9fa4a4e047729a1e7160dcb468acf1c28065))
* **codebuild:** setups up local codebuilds ([#9](https://github.com/p6m7g8/p6df-aws/issues/9)) ([be0a34f](https://github.com/p6m7g8/p6df-aws/commit/be0a34f958011cbccae8428ddd0c414ec1ed3860))
* **deps:** adds awslogs, pushes npm deps into monrepos ([#10](https://github.com/p6m7g8/p6df-aws/issues/10)) ([4455204](https://github.com/p6m7g8/p6df-aws/commit/445520402028b2c7aaa7ca5e59949f9c95456867))
* **langs/node:** adds tslint and eslint globally ([#7](https://github.com/p6m7g8/p6df-aws/issues/7)) ([2f6cb8e](https://github.com/p6m7g8/p6df-aws/commit/2f6cb8e8fec527550db86c6177089a6bf8ddbfd2))


* **brews:** comments out awscli ([#6](https://github.com/p6m7g8/p6df-aws/issues/6)) ([32882bc](https://github.com/p6m7g8/p6df-aws/commit/32882bc19a3eeba8983d6a282e18d3a75474d4c8))
* **doc:** regens ([#11](https://github.com/p6m7g8/p6df-aws/issues/11)) ([abd0e3c](https://github.com/p6m7g8/p6df-aws/commit/abd0e3cf54c6543032c49743c2b10bbe35ab91cd))
* **mergify:** adds config ([58b54da](https://github.com/p6m7g8/p6df-aws/commit/58b54da025dd4263ec073a1e1c3dde20c6c67702))
* **prompt:** adds cdk to the mix ([f543ead](https://github.com/p6m7g8/p6df-aws/commit/f543ead698983d722596223e0662169259a6b0a8))
* **prompt:** p6ify ([#4](https://github.com/p6m7g8/p6df-aws/issues/4)) ([d236bf3](https://github.com/p6m7g8/p6df-aws/commit/d236bf3ea3a537732f44b9d8545c2087d0aa157f))
* **prompt:** standardize on _prompt_info ([#2](https://github.com/p6m7g8/p6df-aws/issues/2)) ([a83f7de](https://github.com/p6m7g8/p6df-aws/commit/a83f7de6567e565a5e17c6d3c01222e250ba6e1e))
* **semqntic:** adds semantic.yml ([#3](https://github.com/p6m7g8/p6df-aws/issues/3)) ([0bbbd35](https://github.com/p6m7g8/p6df-aws/commit/0bbbd354f6c3db6dbbf7ef9292133e0123fa05a1))
