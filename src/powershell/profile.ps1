Invoke-Expression (&starship init powershell)

Function gst { git status $args }
Function gpl { git pull --rebase $args }
Function gph { git push; git push --tags $args }
Function gcmt { git commit -m "$args" }
Function ssh { ssh.exe $args; $Host.UI.RawUI.WindowTitle = "PowerShell" }

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

# white theme !!!
$ISETheme = @{
    Command                  = $PSStyle.Foreground.FromRGB(0x0000FF)
    Comment                  = $PSStyle.Foreground.FromRGB(0x006400)
    ContinuationPrompt       = $PSStyle.Foreground.FromRGB(0x0000FF)
    Default                  = $PSStyle.Foreground.FromRGB(0x0000FF)
    Emphasis                 = $PSStyle.Foreground.FromRGB(0x287BF0)
    Error                    = $PSStyle.Foreground.FromRGB(0xE50000)
    InlinePrediction         = $PSStyle.Foreground.FromRGB(0x93A1A1)
    Keyword                  = $PSStyle.Foreground.FromRGB(0x00008b)
    ListPrediction           = $PSStyle.Foreground.FromRGB(0x06DE00)
    Member                   = $PSStyle.Foreground.FromRGB(0x000000)
    Number                   = $PSStyle.Foreground.FromRGB(0x800080)
    Operator                 = $PSStyle.Foreground.FromRGB(0x757575)
    Parameter                = $PSStyle.Foreground.FromRGB(0x000080)
    String                   = $PSStyle.Foreground.FromRGB(0x8b0000)
    Type                     = $PSStyle.Foreground.FromRGB(0x008080)
    Variable                 = $PSStyle.Foreground.FromRGB(0xff4500)
    ListPredictionSelected   = $PSStyle.Background.FromRGB(0x93A1A1)
    Selection                = $PSStyle.Background.FromRGB(0x00BFFF)
}
Set-PSReadLineOption -Colors $ISETheme

Import-Module Z
Import-Module posh-git
Import-Module CompletionPredictor

Set-Alias j z
