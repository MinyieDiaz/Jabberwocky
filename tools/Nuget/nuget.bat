setlocal enabledelayedexpansion
for /r ..\..\src\ %%i in (*.nuspec) do  (
set projfile=%%i
set projfile=!projfile:nuspec=csproj!
..\..\.nuget\NuGet.exe pack !projfile! -IncludeReferencedProjects -symbols -Build -OutputDirectory .\symbols -Prop Configuration=Release
)

..\..\.nuget\NuGet.exe pack ..\..\Jabberwocky.Library.nuspec -NoPackageAnalysis -Version 2.0.1.0 -OutputDirectory .

..\..\.nuget\NuGet.exe pack ..\..\diagnostics\Jabberwocky.Core.CodeAnalysis/Jabberwocky.Core.CodeAnalysis/Jabberwocky.Core.CodeAnalysis.nuspec -NoPackageAnalysis -OutputDirectory . -Prop Configuration=Release
..\..\.nuget\NuGet.exe pack ..\..\diagnostics\Jabberwocky.Glass.CodeAnalysis/Jabberwocky.Glass.CodeAnalysis/Jabberwocky.Glass.CodeAnalysis.nuspec -NoPackageAnalysis -OutputDirectory . -Prop Configuration=Release