Describe 'Function Set-VsoReleaseName' {
    Context 'Functionality' {
        It 'does not throw' {
            Set-VsoReleaseName default *>&1 |
            Should -Not -BeNullOrEmpty
        }
    }
}
