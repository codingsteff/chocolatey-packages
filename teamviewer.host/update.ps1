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
  # Bug: Invoke-WebRequest hangs
  # https://github.com/PowerShell/PowerShell/issues/2812
  # Workarround UseBasicParsing
  #$page = Invoke-WebRequest -Uri $downloadUri
  #$versionElement = $page.ParsedHtml.body.getElementsByClassName('DownloadVersion') | Select-Object -First 1
  #$version = $versionElement.innerHtml.Replace("v", "")
  $page = Invoke-WebRequest -Uri $downloadUri -UseBasicParsing
  $version = extractVersion($page)

  return @{ URL32 = $url; Version = $version }
}

function extractVersion($page) {
  $locater = "<p class=""DownloadVersion"">"
  $start = $page.Content.IndexOf($locater)
  $part = $page.Content.Substring($start+$locater.Length)
  $end = $part.IndexOf("</p>")
  $version = $part.Substring(0, $end)
  return $version.Replace("v", "")
}

update -ChecksumFor 32