function prompt {
  if ("$(Get-Location)" -Eq $HOME) {
    $p = "~"
  } else {
    $p = Split-Path -leaf -path (Get-Location)
  }
  $dt = [System.DateTime]::Now.ToString("HH:mm.ss");

  Write-Host " $dt" -NoNewline
    Write-Host " $p" -ForegroundColor Cyan -NoNewline
    " "
}

function gst { git status $args }
function gpl { git pull --rebase $args }
function gph { git push }
function gcmt { git commit -m "$args" }
function ssh { ssh.exe $args; $Host.UI.RawUI.WindowTitle = "PowerShell" }

Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Exit with ctrl-d
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

$null = Register-EngineEvent -SourceIdentifier 'PowerShell.OnIdle' -MaxTriggerCount 1 -Action {
  Import-Module Z
    Import-Module posh-git
    Import-Module CompletionPredictor
}

Set-Alias j z
Set-Alias j z
Set-Alias l dir
Set-Alias k kubectl
Set-Alias vsb "$(& 'C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe' -latest -products * -property installationPath)\Common7\Tools\Launch-VsDevShell.ps1"
function kn { k -n (Split-Path -leaf -path (Get-Location)) $args }

If (Get-Command -Name "kubectl" -ErrorAction SilentlyContinue) {
  Invoke-Expression "$(kubectl completion powershell)"
  Register-ArgumentCompleter -CommandName 'k' -ScriptBlock $__kubectlCompleterBlock
  Register-ArgumentCompleter -CommandName 'kn' -ScriptBlock $__kubectlCompleterBlock
}