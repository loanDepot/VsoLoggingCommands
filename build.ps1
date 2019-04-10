[CmdletBinding()]
param($Task = 'Default')

$ProgressPreference = 'SilentlyContinue'

$Script:Modules = @(
    'BuildHelpers',
    'InvokeBuild',
    'Pester',
    'platyPS',
    'PSScriptAnalyzer',
    'DependsOn'
)

$Script:ModuleInstallScope = 'CurrentUser'

'Starting build...'
'Installing module dependencies...'

Get-PackageProvider -Name 'NuGet' -ForceBootstrap | Out-Null

foreach ( $module in $Modules )
{
    "  Installing [$module]"
    $install = Find-Module $module -ErrorAction Stop | Sort-Object Repository | Select-Object -First 1
    $installed = $install | Install-Module -Force -SkipPublisherCheck -AllowClobber -AcceptLicense -Scope $Script:ModuleInstallScope -ErrorAction Stop
    $installed | Import-Module -ErrorAction Stop
    $installed
}

Set-BuildEnvironment
Get-ChildItem Env:BH*
Get-ChildItem Env:APPVEYOR*

$Error.Clear()

'Invoking build'
try
{
    Invoke-Build $Task -Result 'Result'
}
catch
{
    if ($Result.Error)
    {
        "Exception Details"
        $Error[-1] | Format-List -Force
    }
    "Attempting module import to get better error message for common issues"
    $path = Resolve-Path './Output/*/*.psd1'
    Import-Module $path -Verbose -Force
    exit 1
}

exit 0
