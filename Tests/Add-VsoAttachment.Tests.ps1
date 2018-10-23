Describe 'Function Add-VsoAttachment' {
    Context 'Functionality' {
        It 'does not throw' {
            Add-VsoAttachment -Path path -Name name -Type type *>&1 |
                Should -Not -BeNullOrEmpty
        }
    }
}
