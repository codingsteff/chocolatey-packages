$ErrorActionPreference = 'Stop'

$packageName = 'teamviewer.host'
$url32       = 'https://download.teamviewer.com/download/version_15x/TeamViewer_Host_Setup.exe'
$checksum32  = '3d63518ac5eebaed2257f87e08bc064e15bf256505b4d48ec464defb672fd886'

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
