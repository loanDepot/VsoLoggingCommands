Describe 'Function Set-VsoComplete' {
    Context 'Functionality' {
        It 'does not throw' {
            Set-VsoComplete complete *>&1 |
            Should -Not -BeNullOrEmpty
        }
    }
}
