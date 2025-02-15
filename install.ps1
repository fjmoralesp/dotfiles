$userPath = "C:\Users\angiz"
$DOTFILES = Get-Location

$destinationDirectory = Join-Path $userPath "AppData\Local\rio"
If (Test-Path $destinationDirectory) {
	Remove-Item -Path $destinationDirectory -Recurse -Force
}

Copy-Item -Path (Join-Path $DOTFILES "rio") -Destination $destinationDirectory -Recurse
