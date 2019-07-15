[CmdletBinding()]
Param()

try {
    if (!(Get-Module GsriModpackLib -ListAvailable)) { Install-Module GsriModpackLib -Scope CurrentUser }
    Import-Module GsriModpackLib -Force
    
    $PluginPath = 'Core\@TFAR\teamspeak\task_force_radio.ts3_plugin'
    Install-TaskForceAddon -PluginSource "$PSScriptRoot\$PluginPath" -Verbose:($PSBoundParameters['Verbose'] -eq $true)
}
catch {
    $Message = $_.Exception.Message
    Write-Host -ForegroundColor Red "`n *** $Message ***`n"
}
finally {
    Pause
}