Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))

Copy-Item .\src\windows\profile.ps1 -Destination $PROFILE


$path = "~\oh-my-posh"
If(!(test-path -PathType container $path))
{
      New-Item -ItemType Directory -Path $path
}

Copy-Item .\src\mojo.omp.json -Destination ~\oh-my-posh\
. $PROFILE