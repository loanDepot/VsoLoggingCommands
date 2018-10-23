Describe 'Function Add-VsoArtifactFile' {
    Context 'Functionality' {
        It 'does not throw' {
            Add-VsoArtifactFile -Path path -folder folder *>&1 |
                Should -Not -BeNullOrEmpty
        }
    }
}
