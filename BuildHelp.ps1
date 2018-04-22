Import-Module "$env:home\Documents\GitHub\psscreenfetch\psscreenfetch" -verbose
New-MarkdownHelp -Module psscreenfetch -OutputFolder "$env:home\Documents\GitHub\psscreenfetch\psscreenfetch\docs"

# re-import your module with latest changes
Import-Module "$env:home\Documents\GitHub\psscreenfetch\psscreenfetch" -verbose -Force
Update-MarkdownHelp "$env:home\Documents\GitHub\psscreenfetch\psscreenfetch\docs" -Verbose

#Update for single new Command
New-MarkdownHelp -Command 'Get-psscreenfetchFolder' -OutputFolder "$env:home\Documents\GitHub\psscreenfetch\psscreenfetch\docs"


New-ExternalHelp "$env:home\Documents\GitHub\psscreenfetch\psscreenfetch\docs" -OutputPath "$env:home\\Documents\GitHub\psscreenfetch\psscreenfetch\en-US" -Force

#Test
remove-module psscreenfetch -force
Import-Module "$env:home\Documents\GitHub\psscreenfetch\psscreenfetch" -Verbose