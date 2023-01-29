
function momopo:Main() {
    Clear-Host
    While($true) { 
        $memory=momopo:Get-Memory-By-Process
        $top5=$memory | Select-Object -First 5
        $usage=momopo:Get-Memory-Usage

        # Write-Progress -Activity "Memory Usage :" -Status ('{0:N1} %' -f $usage)  -PercentComplete $usage -Id 1

        for($i=0; $i -le 7; $i++) {
            momopo:Clear-Line $i
        }
         
        momopo:Set-Cursor-Pos 0 0
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

function momopo:Get-Memory-Usage() {
    Get-CimInstance Win32_OperatingSystem | %{(($_.TotalVisibleMemorySize - $_.FreePhysicalMemory)/$_.TotalVisibleMemorySize) * 100}
}


function momopo:Get-Memory-By-Process() {
    Get-Process |
        Group-Object -Property ProcessName |
        Select-Object "Name", @{n="MemoryUsageBytes"; e={($_.Group | Measure-Object "WS" -Sum).Sum}} |
        Select-Object "Name", "MemoryUsageBytes", @{n="MemoryUsage"; e={momopo:Format-Memory-Size($_.MemoryUsageBytes)}} |
        Sort-Object "MemoryUsageBytes" -Descending
}

function momopo:Format-Memory-Size($SizeInBytes) {
    $units = "Bytes", "KB", "MB", "GB"
    $index = 0
    while ($SizeInBytes -gt 1024 -and $index -le $units.length) {
        $SizeInBytes /= 1024
        $index++
    }
    if ($index) {
        return '{0:N2} {1}' -f $SizeInBytes, $units[$index]
    }
    return "$SizeInBytes Bytes"
}




momopo:Main