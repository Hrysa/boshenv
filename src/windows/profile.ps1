oh-my-posh init pwsh --config "~\oh-my-posh\mojo.omp.json" | Invoke-Expression

Function gst { git status }
Function gpl { git pull --rebase }
Function gph { git push; git push --tags }
Function gcmt { git commit }

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Exit with ctrl-d
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
