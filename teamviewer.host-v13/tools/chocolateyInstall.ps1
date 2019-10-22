$ErrorActionPreference = 'Stop'

$packageName = 'teamviewer.host'
$url32       = 'https://download.teamviewer.com/download/version_13x/TeamViewer_Host_Setup.exe'
$checksum32  = '09c6cd665c2f2ea0bbbb824a1eb047c82f8191f97e37332ff1f75e804051624b'

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
