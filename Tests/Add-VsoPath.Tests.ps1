Describe 'Function Add-VsoPath' {
    Context 'Functionality' {
        It 'does not throw' {
            Add-VsoPath path *>&1 |
            Should -Not -BeNullOrEmpty
        }
    }
}
