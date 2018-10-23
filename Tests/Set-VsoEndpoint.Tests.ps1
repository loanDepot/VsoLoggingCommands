Describe 'Function Set-VsoEndpoint' {
    Context 'Functionality' {
        It 'does not throw' {
            Set-VsoEndpoint *>&1 |
            Should -Not -BeNullOrEmpty
        }
    }
}
