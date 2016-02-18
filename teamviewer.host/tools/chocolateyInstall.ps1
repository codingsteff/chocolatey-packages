$packageName = 'teamviewer.host'
$fileType = 'exe'
$silentArgs = '/S'
$url = 'http://download.teamviewer.com/download/TeamViewer_Host_Setup-jlv.exe'

Install-ChocolateyPackage $packageName $fileType $silentArgs $url