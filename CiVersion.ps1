function SetCiVersion()
{
    dir -Include *.nuspec -Recurse |
    % { SetCiVersion-NuSpec $_ }
}

function SetCiVersion-NuSpec($file)
{
    (Get-Content $file) |
    % {
        $exp1 = ([regex]'(^\s*<version>)(\d+\.\d+\.\d+)(</version>\s*$)')
        $match1 = $exp1.match($_)
        $exp2 = ([regex]'(^\s*<dependency\s*id="AutoTest\.ArgumentNullException"\s*version=")(\d+\.\d+\.\d+)("\s*/>\s*$)')
        $match2 = $exp2.match($_)
        if ($match1.success)
        {
            $version = New-Object Version($match1.groups[2].value + '.0')
            $replaced = $exp1.replace($_, $match1.groups[1].value + $version.Major + '.' + $version.Minor + '.' + $version.Build + '.' + $env:APPVEYOR_BUILD_NUMBER + '-sha-' + $env:APPVEYOR_REPO_COMMIT.Substring(0,10) + $match1.groups[3].value)
            $replaced
        }
        elseif ($match2.success)
        {
            $version = New-Object Version($match2.groups[2].value + '.0')
            $replaced = $exp2.replace($_, $match2.groups[1].value + $version.Major + '.' + $version.Minor + '.' + $version.Build + '.' + $env:APPVEYOR_BUILD_NUMBER + '-sha-' + $env:APPVEYOR_REPO_COMMIT.Substring(0,10) + $match2.groups[3].value)
            $replaced
        }
        else
        {
            $_
        }
    } |
    Set-Content $file -encoding ASCII
}

SetCiVersion $args[0]
