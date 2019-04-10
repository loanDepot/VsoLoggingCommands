Describe 'Function Add-VsoSummary' {
    Context 'Functionality' {
        It 'does not throw' {
            Add-VsoSummary -Path path *>&1 |
                Should -Not -BeNullOrEmpty
        }

        It 'Can add multiple things to a summary' {
            $path = TestDrive:\temp.md

            'Test_One' | Add-VsoSummary -Path $path *>&1 |
                Should -Not -BeNullOrEmpty
            $path | Should -FileContentMatchMultiline 'Test_One'

            'Test_Two' | Add-VsoSummary -Path $path *>&1 |
                Should -Not -BeNullOrEmpty
            $path | Should -FileContentMatchMultiline 'Test_One'
            $path | Should -FileContentMatchMultiline 'Test_Two'
        }
    }
}
