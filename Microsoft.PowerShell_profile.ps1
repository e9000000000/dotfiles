Set-PSReadLineKeyHandler -Chord 'Ctrl+w' -Function BackwardKillWord
function prompt {
    $curDir = $(Get-Location)
    write-host "$curDir" -ForegroundColor Green -NoNewline
    ' '
}
