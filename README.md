[![](https://ci.appveyor.com/api/projects/status/r3tg6hf53jli0bid?svg=true)](https://ci.appveyor.com/project/codingsteff/chocolatey-packages)
[Update status](https://gist.github.com/codingsteff/11d4abbe6bb1fcd50426bad5b7ea88de)

# Chocolatey-Packages
My Chocolatey packages

# Prerequisites
[Automatic Chocolatey Package Update Powershell Module](https://github.com/majkinetor/au)

      Install-PackageProvider -Name NuGet -Force
      Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
      Install-Module au -Scope CurrentUser
      Get-Module au -ListAvailable | select Name, Version

# Use Cases
## Update all packages
    update_all.ps1 (push will execute!)

## Update single package
    cd PACKAGE
    update.ps1` or `choco pack

## Force package update
    cd PACKAGE
    $au_Force = $true
    update.ps1` or `choco pack

# Test
## Local Test package
    choco install teamviewer.host.*.nupkg  -fdv -s "%cd%"
    choco uninstall teamviewer.host

# Info
## Template
[au-packages-template](https://github.com/majkinetor/au-packages-template)