$ErrorActionPreference = 'Stop'

$packageName = 'teamviewer.host'
$url32       = 'https://download.teamviewer.com/download/version_15x/TeamViewer_Host_Setup.exe'
$checksum32  = 'e84d2c372ce240afc06bbb190c3523aec3de8e21926dce88b9851b58a16dba5d'

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'EXE'
  url                    = $url32
  checksum               = $checksum32
  checksumType           = 'sha256'
  silentArgs             = '/S'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}
Install-ChocolateyPackage @packageArgs
