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

$script:PSScreenFetchRoot = $PSScriptRoot

(Join-Path $PSScriptRoot Private\*.ps1 -Resolve -ErrorAction SilentlyContinue).ForEach{ . $_ }
(Join-Path $PSScriptRoot Public\*.ps1 -Resolve).ForEach{ . $_  }

Export-ModuleMember -Function "*-*" -Alias "screenfetch"

#region retrieve OS Information
. $PSScriptRoot\Private\Get-OSInformation.ps1
#endregion

