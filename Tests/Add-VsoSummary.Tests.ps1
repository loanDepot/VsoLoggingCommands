Describe 'Function Add-VsoSummary' {
    Context 'Functionality' {
        It 'does not throw' {
            Add-VsoSummary -Path path *>&1 |
            Should -Not -BeNullOrEmpty
        }
    }
}
