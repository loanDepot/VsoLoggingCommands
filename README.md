# VsoLoggingCommands

PowerShell module that exposes [VSO logging commands](https://github.com/Microsoft/azure-pipelines-tasks/blob/master/docs/authoring/commands.md) as cmdlets.

# Git

Clone this repository

    git clone https://tfs/DevOps/_git/VsoLoggingCommands

# Building

Run the build script in the root of the project to install dependent modules and start the build

    .\build.ps1

To just run the build, execute Invoke-Build

    Invoke-Build

    # or do a clean build
    Invoke-Build Clean,Default


Install dev version of the module on the local system after building it.

    Invoke-Build Install
