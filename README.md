# Chocolatey-Packages

My Chocolatey packages

[![Build Badge](https://ci.appveyor.com/api/projects/status/r3tg6hf53jli0bid?svg=true)](https://ci.appveyor.com/project/codingsteff/chocolatey-packages)
[Update status](https://gist.github.com/codingsteff/11d4abbe6bb1fcd50426bad5b7ea88de)

## Prerequisites

[Automatic Chocolatey Package Update Powershell Module](https://github.com/majkinetor/au)

      Install-PackageProvider -Name NuGet -Force
      Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
      Install-Module au -Scope CurrentUser
      Get-Module au -ListAvailable | select Name, Version

## Use Cases

### Update single package

    cd PACKAGE
    update.ps1

### Force package update

    cd PACKAGE
    $au_Force = $true
    update.ps1

### Force push to chocolatey

- Reset minor version in teamviewer.host.nuspec
- Clear $checksum32 in chocolateyInstall.ps1

### Update all packages

    update_all.ps1 (push will execute and fail, no api-key!)

## Test

### Local Test package

    choco install teamviewer.host.*.nupkg  -fdv -s "%cd%"
    choco uninstall teamviewer.host

### Manual pack

    choco pack

## Info

### Template

[au-packages-template](https://github.com/majkinetor/au-packages-template)