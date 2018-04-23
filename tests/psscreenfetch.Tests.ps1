$ModuleManifestName = 'pscreenfetch.psd1'
$ModuleManifestPath = "$PSScriptRoot\..\$ModuleManifestName"
#requires -Version 3
#Variables for Pester tests

$ModulePath = Split-Path -Parent -Path (Split-Path -Parent -Path $MyInvocation.MyCommand.Path)
$ModuleName = 'psscreenfetch'
$ManifestPath = "$ModulePath\psscreenfetch\$ModuleName.psd1"
$ModulePSM1file = "$ModulePath\psscreenfetch\$ModuleName.psm1"
if (Get-Module -Name $ModuleName) {
    Remove-Module $ModuleName -Force
}
Import-Module $ManifestPath -Verbose:$false


# test the module manifest - exports the right functions, processes the right formats, and is generally correct
Describe -Name 'Manifest' -Fixture {
    $ManifestHash = Invoke-Expression -Command (Get-Content $ManifestPath -Raw)

    It -name 'has a valid manifest' -test {
        {
            $null = Test-ModuleManifest -Path $ManifestPath -ErrorAction Stop -WarningAction SilentlyContinue
        } | Should Not Throw
    }

    It -name 'has a valid root module' -test {
        $ManifestHash.RootModule | Should Be "$ModuleName.psm1"
    }

    It -name 'has a valid Description' -test {
        $ManifestHash.Description | Should Not BeNullOrEmpty
    }

    It -name 'has a valid guid' -test {
        $ManifestHash.Guid | Should Be 'da368cd7-7aab-4e56-a428-8dc5f0fcba87'
    }

    It -name 'has a valid version' -test {
        $ManifestHash.ModuleVersion -as [Version] | Should Not BeNullOrEmpty
    }

    It -name 'has a valid copyright' -test {
        $ManifestHash.CopyRight | Should Not BeNullOrEmpty
    }

    It -name 'has a valid license Uri' -test {
        $ManifestHash.PrivateData.Values.LicenseUri | Should Be 'http://opensource.org/licenses/MIT'
    }

    It -name 'has a valid project Uri' -test {
        $ManifestHash.PrivateData.Values.ProjectUri | Should Be 'https://github.com/stefanstranger/psscreenfetch'
    }

    It -name "gallery tags don't contain spaces" -test {
        foreach ($Tag in $ManifestHash.PrivateData.Values.tags) {
            $Tag -notmatch '\s' | Should Be $true
        }
    }
}


Describe -Name 'Module psscreenfetch works' -Fixture {
    It -name 'Passed Module load' -test {
        Get-Module -Name 'psscreenfetch' | Should Not Be $null
    }
}

Describe -Name 'psscreenfetch Aliases work' -Fixture {
    It -Name 'Testing screenfetch alias' -Test {
        $result = (Get-Alias -name screenfetch).Definition
        $result | Should Be "Invoke-PSScreenfetch"
    }
}

Describe -Name 'Test Functions in psscreenfetch Module' -Fixture {
    Context -Name 'Testing Public Functions' -Fixture {

        It -name 'Passes Invoke-PSScreenFetch Function' -test {
            Mock Get-OSInformation { return @{name = "windows 10"} } -ModuleName psscreenfetch
            Invoke-PSScreenFetch | Should Not Be $null
        }
    }
}


