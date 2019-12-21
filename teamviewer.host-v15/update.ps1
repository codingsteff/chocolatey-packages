import-module au

$url = 'https://download.teamviewer.com/download/version_15x/TeamViewer_Host_Setup.exe'
$packageName = 'teamviewer.host'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $tmp = New-TemporaryFile
    Invoke-WebRequest -Uri $url -OutFile $tmp
    $version = (Get-Command $tmp).Version
    return @{ URL32 = $url; Version = $version; PackageName = $packageName }
}

update -ChecksumFor 32