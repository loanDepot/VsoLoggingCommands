Describe 'Function Add-VsoSummaryFile' {
    Context 'Functionality' {
        It 'does not throw' {
            Add-VsoSummaryFile -Path path *>&1 |
            Should -Not -BeNullOrEmpty
        }
    }
}
