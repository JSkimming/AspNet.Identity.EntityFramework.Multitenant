:: Do nothing if the msbuild variable has been set.
@IF NOT ["%msbuild%"] == [""] GOTO :EOF

:: Use VS2013 if installed.
@IF ["%msbuild%"] == [""] (
    IF EXIST "%VS120COMNTOOLS%vsvars32.bat" (
        echo Setting up variables for Visual Studio 2013.
        CALL "%VS120COMNTOOLS%vsvars32.bat"
        SET msbuild=MSBuild.exe
    )
)

:: Use VS2012 if installed.
@IF ["%msbuild%"] == [""] (
    IF EXIST "%VS110COMNTOOLS%vsvars32.bat" (
        echo Setting up variables for Visual Studio 2012.
        CALL "%VS110COMNTOOLS%vsvars32.bat"
        SET msbuild=MSBuild.exe
    )
)

:: Fall back MSBuild bundled with .NET.
@IF ["%msbuild%"] == [""] (
	echo Using MSBuild from from .NET 4.0.
    SET msbuild="%windir%\Microsoft.NET\Framework\v4.0.30319\msbuild.exe"
)
