. "$($PSScriptRoot)\src\Get-Memory-By-Process.ps1"
. "$($PSScriptRoot)\src\Get-Memory-Usage.ps1"
. "$($PSScriptRoot)\src\Get-Progress-Bar.ps1"

function Main() {
    Clear-Host
    While($true) {
        $memoryByProcess=Get-Memory-By-Process
        $top5=$memoryByProcess | Select-Object -First 5

        $usage = Get-Memory-Usage
        $usageText = ("Memory : " + ([Math]::Round(($usage * 100), 2, [MidpointRounding]::AwayFromZero)) + "%  ")
        $width = [Math]::Floor(($host.UI.RawUI.WindowSize.Width - $usageText.Length) * 0.4)
        $progressBar = Get-Progress-Bar $width $usage "█" "▒"

        for($i=0; $i -le 10; $i++) {
            momopo:Clear-Line $i
        }
        momopo:Set-Cursor-Pos 0 0
        Write-Host -NoNewLine ($usageText + $progressBar)
        $top5 | Select-Object "Name", "MemoryUsage" | Format-Table 
        Start-Sleep -m 750
    }

}

function momopo:Clear-Line($y) {
    momopo:Set-Cursor-Pos 0 $y
    $width = $host.UI.RawUI.BufferSize.Width
    Write-Host -NoNewline (" " * $width)
}

function momopo:Set-Cursor-Pos($x, $y) {
    $cursorPos = $host.UI.RawUI.CursorPosition
    $cursorPos.X = $x
    $cursorPos.Y = $y
    $host.UI.RawUI.CursorPosition = $cursorPos
}

Main