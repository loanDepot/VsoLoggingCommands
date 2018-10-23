Describe 'Function Write-VsoWarning' {
    Context 'Functionality' {
        It 'does not throw' {
            Write-VsoWarning test *>&1 |
                Should -Not -BeNullOrEmpty
        }
    }
}
