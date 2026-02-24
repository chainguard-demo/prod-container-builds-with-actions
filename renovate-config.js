module.exports = {
  branchPrefix: 'test-renovate/',
  username: 'renovate-release',
  gitAuthor: 'Renovate Bot <bot@renovateapp.com>',
  onboarding: true,
  platform: 'github',
  forkProcessing: 'enabled',
  dryRun: 'full', // Beachte: Bei 'full' werden keine PRs erstellt, nur Logs geschrieben!
  repositories: ['prod-container-build-with-actions'],
  extends: [
    'config:base'
  ],

  // 2. Optional: Explizit alle Manager erlauben (falls du einschränken wolltest)
  // Wenn weggelassen, sind standardmäßig alle aktiv.
  enabledManagers: null, 

  packageRules: [
    {
      description: 'lockFileMaintenance',
      matchUpdateTypes: [
        'pin',
        'digest',
        'patch',
        'minor',
        'major',
        'lockFileMaintenance',
      ],
      dependencyDashboardApproval: false,
      minimumReleaseAge: null,
    },
  ],
};
