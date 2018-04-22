Function Invoke-PSScreenfetch {
    [CmdletBinding()]
    [Alias('screenfetch')]
    param()

    if ($OS.name -like "*Windows 10*") {
        .$PSScreenFetchRoot\OS\windows10.ps1
    }
    else {
        throw 'Only Windows 10 Operating Systems are currently supported'
    }
}
