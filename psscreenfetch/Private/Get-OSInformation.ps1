#region retrieve OS Information
Function Get-OSInformation {
    if (!$IsLinux) {
        Write-Verbose -Message 'Retrieving OS Information'
        $OS = Get-CimInstance Win32_OperatingSystem

        $object = [pscustomobject]@{
            Name        = $OS.Name
            Caption     = $OS.Caption
            BuildNumber = $OS.BuildNumber
            Uptime      = [math]::Round(((New-TimeSpan -Start $OS.LastBootUpTime -end (Get-Date)).TotalMinutes), 0)
            RAMTotal    = ([math]::round($OS.TotalVisibleMemorySize / 1024, 0))
            RAMFree     = ([math]::round($OS.FreePhysicalMemory / 1024, 0))
        }
        $object
    }
}
#endregion

