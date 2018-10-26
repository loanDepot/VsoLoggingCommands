Describe 'Function Set-VsoCompleteStatus' {
    Context 'Functionality' {
        It 'does not throw' {
            Set-VsoCompletestatus -Status complete *>&1 |
                Should -Not -BeNullOrEmpty
        }
    }
}
