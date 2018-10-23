Describe 'Function Add-VsoFile' {
    Context 'Functionality' {
        It 'does not throw' {
            Add-VsoFile path *>&1 |
            Should -Not -BeNullOrEmpty
        }
    }
}
