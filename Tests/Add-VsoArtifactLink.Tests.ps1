Describe 'Function Add-VsoArtifactLink' {
    Context 'Functionality' {
        It 'does not throw' {
            Add-VsoArtifactLink -Location location -name name -type filepath *>&1 |
            Should -Not -BeNullOrEmpty
        }
    }
}
