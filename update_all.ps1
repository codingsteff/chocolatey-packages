param($Name = $null)
Set-Location $PSScriptRoot

if (Test-Path update_vars.ps1) { . ./update_vars.ps1 }

$options = [ordered]@{
    Timeout = 100
    Push    = $true
    Threads = 10

    # Save text report in the local file report.txt
    Report = @{
        Type = 'text'
        Path = "$PSScriptRoot\report.txt"
    }

    # Then save this report as a gist using your api key and gist id
    Gist = @{
        ApiKey = $Env:github_api_key
        Id     = $Env:github_gist_id
        Path   = "$PSScriptRoot\report.txt"
    }

    # Persist pushed packages to your repository
    Git = @{
        User = ''
        Password = $Env:github_api_key
    }

    # Then save run info which can be loaded with Import-CliXML and inspected
    RunInfo = @{
        Path = "$PSScriptRoot\update_info.xml"
    }

    # Finally, send an email to the user if any error occurs and attach previously created run info
    Mail = if ($Env:mail_user) {
            @{
                To        = $Env:mail_user
                Server    = 'smtp.gmail.com'
                UserName  = $Env:mail_user
                Password  = $Env:mail_pass
                Port      = 587
                EnableSsl = $true
            }
           } 
}

updateall -Name $Name -Options $options | Format-Table
$global:updateall = Import-CliXML $PSScriptRoot\update_info.xml

#Uncomment to fail the build on AppVeyor on any package error
if ($updateall.error_count.total) { throw 'Errors during update' }
