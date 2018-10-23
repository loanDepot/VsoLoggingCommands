Describe 'Function Add-VsoTag' {
    Context 'Functionality' {
        It 'does not throw' {
            Add-VsoTag tag *>&1 |
            Should -Not -BeNullOrEmpty
        }
    }
}
