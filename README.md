[![](https://ci.appveyor.com/api/projects/status/r3tg6hf53jli0bid?svg=true)](https://ci.appveyor.com/project/codingsteff/chocolatey-packages)
[Update status](https://gist.github.com/codingsteff/11d4abbe6bb1fcd50426bad5b7ea88de)

# Chocolatey-Packages
Repository for Chocolatey packages

Thanks to [majkinetor](https://github.com/majkinetor) for his great [Automatic Chocolatey Package Update Powershell Module](https://github.com/majkinetor/au)

## Create all packages
`update_all.ps1`

## Create package
`PACKAGE\update.ps1` or `choco pack`

## Local Test package
`choco install teamviewer.host.10.0.*.nupkg  -fdv -s "%cd%"`

`choco uninstall teamviewer.host`