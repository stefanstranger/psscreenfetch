<#
	===========================================================================
	 Created on:   	04/15/2018 12:00 PM
	 Created by:   	Stefan Stranger
	 Filename:     	PSScreenFetch.psm1
	-------------------------------------------------------------------------
	 Module Name: PSScreenFetch
     Description: This Screenfetch PowerShell module was built to imitate the same behavior as ScreenFetch
                  using Powershell.

	===========================================================================
#>

#region retrieve OS Information
$OS = Get-CimInstance Win32_OperatingSystem
#endregion

Function Invoke-PSScreenfetch {
    [CmdletBinding()]
    [Alias('screenfetch')]
    param()

    if ($OS.name -like "*Windows 10*") {
        & .\psscreenfetch\OS\windows10.ps1
    }
    else {
        throw 'Only Windows 10 Operating Systems are currently supported'
    }
}
