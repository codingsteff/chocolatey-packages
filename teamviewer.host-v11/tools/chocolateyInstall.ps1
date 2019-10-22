$ErrorActionPreference = 'Stop'

$packageName = 'teamviewer.host'
$url32       = 'https://download.teamviewer.com/download/version_11x/TeamViewer_Host_Setup.exe'
$checksum32  = 'cd5fae6b121658b1e08ee30b241c3d51c54a506d5b12aa77b94c69d1085c8015'

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
