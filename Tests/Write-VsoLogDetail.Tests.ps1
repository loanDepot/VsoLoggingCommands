Describe 'Function Write-VsoLogDetail' {
    Context 'Functionality' {
        It 'does not throw' {
            Write-VsoLogDetail message *>&1 |
            Should -Not -BeNullOrEmpty
        }
    }
}
