# Chocolatey-Packages

My Chocolatey packages

[![Build Badge](https://ci.appveyor.com/api/projects/status/r3tg6hf53jli0bid?svg=true)](https://ci.appveyor.com/project/codingsteff/chocolatey-packages)
[Update status](https://gist.github.com/codingsteff/11d4abbe6bb1fcd50426bad5b7ea88de)

## Prerequisites

[Automatic Chocolatey Package Update Powershell Module](https://github.com/majkinetor/au)

```ps
Install-PackageProvider -Name NuGet -Force
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module au -Scope CurrentUser
Get-Module au -ListAvailable | select Name, Version
```

## Use Cases

### Update package

```sh
cd PACKAGE
# Force package update (when RemoteVersion is latest)
$au_Force = $true
update.ps1
```

### Update all packages

```sh
# Force package update (when RemoteVersion is latest)
# SET Force = $true in file update_all.ps1
update_all.ps1
```

## Test

### Remove all nupkg files

```sh
Get-ChildItem -Filter *.nupkg -Recurse | Remove-Item
```

### Local Test package

```sh
choco install teamviewer.host.*.nupkg  -fdv -s "%cd%"
choco uninstall teamviewer.host
```

### Manual pack

```ps
choco pack
```

## Push

### Manual push

```ps
# show if apikey is available
choco apikey
# set apikey (from chocolatey.org/account)
choco apikey --key xxx --source https://push.chocolatey.org/
# push current nupkg
choco push
```

## Info

### Template

[au-packages-template](https://github.com/majkinetor/au-packages-template)
