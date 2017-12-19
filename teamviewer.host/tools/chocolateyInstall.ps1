$ErrorActionPreference = 'Stop'

$packageName = 'teamviewer.host'
$url32       = 'https://download.teamviewer.com/download/TeamViewer_Host_Setup.exe'
$checksum32  = '0f03a06c7d7dcfeaabd07a17c593e8b7f14113edada8e59eed005a439941db55'

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
