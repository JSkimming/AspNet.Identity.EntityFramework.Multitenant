function IncrementVersion-InAllAssemblyInfoFiles($rank)
{
    dir -Include AssemblyInfoCommon.cs -Recurse |
    % { IncrementVersion-InFile $_ $rank }
    dir -Include *.nuspec -Recurse |
    % { IncrementVersion-NuSpec $_ $rank }
}

function IncrementVersion-InFile($file, $rank)
{
    switch ($rank)
    {
        'major' { $exp = ([regex]'(^\s*\[assembly:\s*Assembly.*Version\s*\(\s*)"(\d+\.\d+\.\d+\.\d+)"(\s*\)\s*]\s*$)') }
        default { $exp = ([regex]'(^\s*\[assembly:\s*AssemblyFileVersion\s*\(\s*)"(\d+\.\d+\.\d+\.\d+)"(\s*\)\s*]\s*$)') }
    }

    (Get-Content $file) |
    % {
        $match = $exp.match($_)
        if ($match.success)
        {
            $ov = New-Object Version($match.groups[2].value)
            $nv = Increment-Version $ov $rank
            $replaced = $exp.replace($_, '$1"' + $nv + '"$3')
            $replaced
        }
        else
        {
            $_
        }
    } |
    Set-Content $file -encoding UTF8
}

function IncrementVersion-NuSpec($file, $rank)
{
    (Get-Content $file) |
    % {
        $exp = ([regex]'(^\s*<version>)(\d+\.\d+\.\d+)(-beta)(</version>\s*$)')
        $match = $exp.match($_)
        if ($match.success)
        {
            $ov = New-Object Version($match.groups[2].value + '.0')
            $nv = Increment-Version $ov $rank
            $replaced = $exp.replace($_, $match.groups[1].value + $nv.Major + '.' + $nv.Minor + '.' + $nv.Build + $match.groups[3].value + $match.groups[4].value)
            $replaced
        }
        else
        {
            $_
        }
    } |
    Set-Content $file -encoding ASCII
}

function Increment-Version($version, $rank)
{
    switch ($rank)
    {
        'major' { New-Object Version(($version.Major + 1), 0, 0, 0) }
        'minor' { New-Object Version($version.Major, ($version.Minor + 1), 0, 0) }
        default { New-Object Version($version.Major, $version.Minor, ($version.Build + 1), $version.Revision) }
        'revision' { New-Object Version($version.Major, $version.Minor, $version.Build, ($version.Revision +1 )) }
    }
}

IncrementVersion-InAllAssemblyInfoFiles $args[0]
