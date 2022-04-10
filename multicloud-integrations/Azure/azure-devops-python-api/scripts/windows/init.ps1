param (
    [switch] $KeepPsReadLine = $false
)

$tempFile = [IO.Path]::GetTempFileName()
cmd.exe /C "$PSScriptRoot\init.cmd && set>$tempFile"
$lines = [System.IO.File]::ReadAllLines("$tempFile")
$curLoc = get-location
$lines|ForEach-Object -Begin { set-location env: } -End { set-location $curLoc } -Process {
    $var = $_.Split('=')
    if ($var.length -gt 1 -and $var[0] -ne "") {
        set-item -path $var[0] -value $var[1]
    }
}
remove-item $tempFile

# Set up aliases

# On Windows 10, PSReadLine is installed by default and it breaks doskey macros.
# Remove it from this particular PowerShell window before running doskey, unless
# the user has explicitly told us to keep it active.
if ((Get-Module PSReadLine) -and ($KeepPsReadLine -eq $false)) {
    # remove PSReadLine because it does not get along well with doskey
    Remove-Module PSReadLine 

    # note: using doskey because Set-Alias is not as powerful
    # NOTE commands in macros.txt work in both Powershell and cmd. Keep it that way!
    # Only add macros to macros.ps.txt when the same macro cannot be used in both Powershell and cmd.
    # In that case, add equivalent macros to both macros.ps.txt and macros.cmd.txt, to ensure that
    # the Powershell and cmd development environments remain functionally identical.
    doskey /exename=powershell.exe /MACROFILE="$PSScriptRoot\macros.txt"
    doskey /exename=powershell.exe /MACROFILE="$PSScriptRoot\macros.ps.txt"
}
