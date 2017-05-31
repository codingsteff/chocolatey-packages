import-module au

$releases = ''

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    $re    = ''
    $url   = $download_page.links | Where-Object href -match $re | Select-Object -First 1 -expand href

    $version  = $url -split '[._-]|.exe' | Select-Object -Last 1 -Skip 2

    return @{ URL32 = $url; Version = $version }
}

update
