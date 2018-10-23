Describe 'Function Set-VsoProgress' {
    Context 'Functionality' {
        It 'does not throw' {
            Set-VsoProgress test *>&1 |
            Should -Not -BeNullOrEmpty
        }
    }
}
