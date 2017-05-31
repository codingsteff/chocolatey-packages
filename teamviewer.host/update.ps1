import-module au

$url = 'https://download.teamviewer.com/download/TeamViewer_Host_Setup.exe'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
      "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
    }
  }
}

function global:au_GetLatest {
  $downloadUri = "https://www.teamviewer.com/en/download/windows/"
  $page = Invoke-WebRequest -Uri $downloadUri
  $versionElement = $page.ParsedHtml.body.getElementsByClassName('DownloadVersion') | Select-Object -First 1
  $version = $versionElement.innerHtml.Replace("v", "")

  return @{ URL32 = $url; Version = $version }
}

update -ChecksumFor 32