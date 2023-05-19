Invoke-Expression (&starship init powershell)

Function gst { git status }
Function gpl { git pull --rebase }
Function gph { git push; git push --tags }
Function gcmt { git commit }

Set-PSReadLineOption -HistorySearchCursorMovesToEnd

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Exit with ctrl-d
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
