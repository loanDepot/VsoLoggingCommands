Describe 'Function Add-VsoArtifactLink' {
    Context 'Functionality' {
        It 'does not throw' {
            Add-VsoArtifactLink -Location location *>&1 |
            Should -Not -BeNullOrEmpty
        }
    }
}
