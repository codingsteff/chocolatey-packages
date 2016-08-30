# Chocolatey-Packages
Repository for Chocolatey packages

Thanks to [majkinetor](https://chocolatey.org/profiles/majkinetor) for his great [Automatic Chocolatey Package Update Powershell Module](https://github.com/majkinetor/au)

## Create all packages
`update_all.ps1`

## Create package
`PACKAGE\update.ps1` or `choco pack`

## Local Test package
`choco install teamviewer.host.10.0.*.nupkg  -fdv -s "%cd%"`

`choco uninstall teamviewer.host`