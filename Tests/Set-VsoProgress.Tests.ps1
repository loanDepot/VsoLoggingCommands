Describe 'Function Set-VsoProgress' {
    Context 'Functionality' {
        It 'does not throw' {
            Set-VsoProgress *>&1 |
            Should -Not -BeNullOrEmpty
        }
    }
}
