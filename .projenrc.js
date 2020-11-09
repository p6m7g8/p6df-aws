const { NodeProject } = require('projen');

const project = new NodeProject({
  authorAddress: "pgollucci@p6m7g8.com",
  authorName: "Philip M. Gollucci",
  name: "p6df-aws",
  repository: "https://github.com/p6m7g8/p6df-aws.git",

  projenUpgradeSecret: 'PROJEN_GITHUB_TOKEN',
});

project.mergify.addRule({
  name: 'Label core contributions',
  actions: {
    label: {
      add: ['contribution/core']
    }
  },
  conditions: [
    'author~=^(pgollucci)$',
    'label!=contribution/core'
  ],
});

project.mergify.addRule({
  name: 'Label auto-merge for core',
  actions: {
    label: {
      add: ['auto-merge']
    }
  },
  conditions: [
    'label=contribution/core',
    'label!=auto-merge'
  ],
});

project.synth();
