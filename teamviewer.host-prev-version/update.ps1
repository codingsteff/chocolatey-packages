import-module au

$url = 'https://download.teamviewer.com/download/version_12x/TeamViewer_Host_Setup.exe'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
      "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
    }
  }
}

function global:au_GetLatest {
  $downloadUri = "  https://www.teamviewer.com/en/download/previous-versions/"
  # Bug: Invoke-WebRequest hangs
  # https://github.com/PowerShell/PowerShell/issues/2812
  # Workarround UseBasicParsing
  #$page = Invoke-WebRequest -Uri $downloadUri
  #$versionElement = $page.ParsedHtml.body.getElementsByClassName('DownloadVersion') | Select-Object -First 1
  #$version = $versionElement.innerHtml.Replace("v", "")
  $page = Invoke-WebRequest -Uri $downloadUri -UseBasicParsing
  $version = extractVersion($page)

  $Latest = @{ URL32 = $url; Version = $version; PackageName = 'teamviewer.host' }
  return $Latest
}

function extractVersion($page) {
  $locater = "v12."
  $start = $page.Content.IndexOf($locater)
  $part = $page.Content.Substring($start)
  $end = $part.IndexOf("</span>")
  $version = $part.Substring(0, $end)
  return $version.Replace("v", "").Replace("(", "").Replace(")", "")
}

update -ChecksumFor 32