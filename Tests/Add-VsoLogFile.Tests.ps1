Describe 'Function Add-VsoLogFile' {
    Context 'Functionality' {
        It 'does not throw' {
            Add-VsoLogFile Path *>&1 |
            Should -Not -BeNullOrEmpty
        }
    }
}
