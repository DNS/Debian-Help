<#
EDIT ~/.config/kdeglobals

[KDE]
WheelScrollLines=8
#>

$a = gc -Raw ~/.config/kdeglobals
$a -Replace '\[KDE\]', "[KDE]`nWheelScrollLines=8" > ~/.config/kdeglobals

