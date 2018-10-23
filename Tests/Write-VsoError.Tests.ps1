Describe 'Function Write-VsoError' {
    Context 'Functionality' {
        It 'does not throw' {
            Write-VsoError error *>&1 |
            Should -Not -BeNullOrEmpty
        }
    }
}
