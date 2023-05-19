winget install --id Starship.Starship

Copy-Item .\src\powershell\profile.ps1 -Destination $PROFILE

$path = "~\.config"
If(!(test-path -PathType container $path))
{
      New-Item -ItemType Directory -Path $path
}

Copy-Item .\src\starship.toml -Destination ~\.config\
Copy-Item .\src\vimrc.vim -Destination ~\.vimrc

. $PROFILE