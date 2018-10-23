[CmdletBinding()]
param()
$Script:PSModuleRoot = $PSScriptRoot
Write-Verbose -Message "This file is replaced in the build output, and is only used for debugging."
Write-Verbose -Message $PSScriptRoot

function Import-ClassOrder
{
    [cmdletbinding()]
    param($cName,$Map)
    Write-Verbose "Checking on [$cName]"
    if($Map.ContainsKey($cName) -and $Map[$cName].Imported -ne $true)
    {
        if($Map[$cName].Base)
        {
            Write-Verbose " Base class [$($Map[$cName].Base)]"
            Import-ClassOrder $Map[$cName].Base $Map
        }
        $cPath = $Map[$cName].Path
        Write-Verbose "Dot Sourcing [$cPath]"
        $cPath
        $Map[$cName].Imported = $true
    }
}

# Class importer
$root = Join-Path -Path $PSScriptRoot -ChildPath 'Classes'
Write-Verbose "Load classes from [$root]"
$classFiles = Get-ChildItem -Path $root -Filter '*.ps1' -Recurse |
            Where-Object Name -notlike '*.Tests.ps1'

$classes = @{}

foreach($file in $classFiles)
{
    $name = $file.BaseName
    $classes[$name] = @{
        Name = $name
        Path = $file.FullName
    }
    $data = Get-Content $file.fullname
    foreach($line in $data)
    {
        if($line -match "\s+($Name)\s*(:|requires)\s*(?<baseclass>\w*)")
        {
            $classes[$name].Base = $Matches.baseclass
        }
    }
}

$importOrder = foreach($className in $classes.Keys)
{
    Write-Verbose $ClassName
    Import-ClassOrder $className $classes
}

foreach($class in $importOrder)
{
    Write-verbose $class
    . $class
}

$folders = 'Includes', 'Internal', 'Private', 'Public', 'Resources'
foreach ($folder in $folders)
{
    $root = Join-Path -Path $PSScriptRoot -ChildPath $folder
    if (Test-Path -Path $root)
    {
        Write-Verbose -Message "Importing files from [$folder]..."
        $files = Get-ChildItem -Path $root -Filter '*.ps1' -Recurse |
            Where-Object Name -notlike '*.Tests.ps1'

        foreach ($file in $files)
        {
            Write-Verbose -Message "Dot sourcing [$($file.BaseName)]..."
            . $file.FullName
        }
    }
}

Write-Verbose -Message 'Exporting Public functions...'
$functions = Get-ChildItem -Path "$PSScriptRoot\Public" -Filter '*.ps1'

Export-ModuleMember -Function $functions.BaseName
