Describe 'Function Set-VsoEndpoint' {
    Context 'Functionality' {
        It 'does not throw' {
            Set-VsoEndpoint -value value -id id -field url *>&1 |
            Should -Not -BeNullOrEmpty
        }
    }
}
