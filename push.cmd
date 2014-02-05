@echo Off

@call "%~dp0setmsbuild.cmd"

IF ["%1"] == [""] (
   call "%~dp0pack.cmd"
)

echo %msbuild% "%~dp0src\BuildTargets\NuGetPush.proj" /nologo /verbosity:m
%msbuild% "%~dp0src\BuildTargets\NuGetPush.proj" /nologo /verbosity:m
