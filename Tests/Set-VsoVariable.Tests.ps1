Describe 'Function Set-VsoVariable' {
    Context 'Functionality' {
        It 'does not throw' {
            Set-VsoVariable -Name test -Value test *>&1 |
            Should -Not -BeNullOrEmpty
        }
    }
}
