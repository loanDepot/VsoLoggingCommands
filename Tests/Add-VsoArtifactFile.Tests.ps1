Describe 'Function Add-VsoArtifactFile' {
    Context 'Functionality' {
        It 'does not throw' {
            Add-VsoArtifactFile -Path path *>&1 |
                Should -Not -BeNullOrEmpty
        }
    }
}
