Describe 'Function Set-VsoBuildNumber' {
    Context 'Functionality' {
        It 'does not throw' {
            Set-VsoBuildNumber 1.0.0.0 *>&1 |
            Should -Not -BeNullOrEmpty
        }
    }
}
