
$r = 91
$g = 92
$y = 93
$c = 96
$s = [char]27

@"
${s}[${g}m                           |===${s} ${s}[${r}m   $env:username${s}[0m@${s}[${r}m$env:computername${s}
${s}[${g}m                   I===========${s} ${s}[${r}m   OS:${s}[0m $($OS.Caption)
${s}[${g}m             ==================${s} ${s}[${r}m   Build:${s}[0m $($OS.BuildNumber)
${s}[${r}m   IIIIIIIII${s} ${s}[${g}m ==================${s} ${s}[${r}m   Uptime:${s}[0m $($Uptime)m
${s}[${r}mIIIIIIIIIIII${s} ${s}[${g}m ==================${s} ${s}[${r}m   Shell:${s}[0m PowerShell $($PSVersionTable.PSVersion)
${s}[${r}mIIIIIIIIIIII${s} ${s}[${g}m ==================${s} ${s}[${r}m   CPU:${s}[0m $($CPUInfo.Name)
${s}[${r}mIIIIIIIIIIII${s} ${s}[${g}m ==================${s} ${s}[${r}m   RAM:${s}[0m $($RAMFree)MiB / $($RAMTotal)MiB
${s}[${r}mIIIIIIIIIIII${s} ${s}[${g}m ==================${s}[0m
${s}[${r}mIIIIIIIIIIII${s} ${s}[${g}m ==================${s}[0m

${s}[${c}miiiiiiiiiiii${s} ${s}[${y}m iIIIIIIIIIIIIIIIIi${s}[0m
${s}[${c}miiiiiiiiiiii${s} ${s}[${y}m iIIIIIIIIIIIIIIIIi${s}[0m
${s}[${c}miiiiiiiiiiii${s} ${s}[${y}m iIIIIIIIIIIIIIIIIi${s}[0m
${s}[${c}miiiiiiiiiiii${s} ${s}[${y}m iIIIIIIIIIIIIIIIIi${s}[0m
${s}[${c}miiiiiiiiiiii${s} ${s}[${y}m iIIIIIIIIIIIIIIIIi${s}[0m
${s}[${c}m Iiiiiiiiiii${s} ${s}[${y}m iIIIIIIIIIIIIIIIIi${s}[0m
${s}[${c}m         iiI${s} ${s}[${y}m iIIIIIIIIIIIIIIIIi${s}[0m
${s}[${y}m                 IiiiiIIIIIIIIi${s}[0m
${s}[${y}m                         IiiiIi${s}[0m
"@