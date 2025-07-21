Install-Module -Force Z -AllowClobber
Install-Module -Force CompletionPredictor -Repository PSGallery
Install-Module -Force posh-git

Copy-Item .\src\powershell\profile.ps1 -Destination $PROFILE

$path = "~\.config"
If(!(test-path -PathType container $path))
{
      New-Item -ItemType Directory -Path $path
}

Copy-Item .\src\vimrc.vim -Destination ~\.vimrc

. $PROFILE
