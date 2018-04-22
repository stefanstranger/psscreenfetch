#region retrieve OS Informatio
if (!$IsLinux) {
    $Script:OS = Get-CimInstance Win32_OperatingSystem
    $Script:Uptime = [math]::Round(((New-TimeSpan -Start $OS.LastBootUpTime -end (Get-Date)).TotalMinutes), 0)
    $Script:CPUInfo = Get-CimInstance Win32_Processor
    # TotalVisibleMemorySize. Returns the total amount of physical memory that is installed in the computer and accessible to the operating system. This may be a lower number than is installed if some memory is not addressable.
    $Script:RAMTotal = ([math]::round($OS.TotalVisibleMemorySize / 1024, 0))
    # FreePhysicalMemory. Returns the amount of physical memory that is currently not in use.
    $Script:RAMFree = ([math]::round($OS.FreePhysicalMemory / 1024, 0))
}
#endregion

