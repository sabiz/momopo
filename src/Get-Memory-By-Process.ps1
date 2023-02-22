. ($PSScriptRoot + "\Format-Memory-Size.ps1")

Function Get-Memory-By-Process() {
    Get-Process |
        Group-Object -Property ProcessName |
        Select-Object "Name", @{n="MemoryUsageBytes"; e={($_.Group | Measure-Object "WS" -Sum).Sum}} |
        Select-Object "Name", "MemoryUsageBytes", @{n="MemoryUsage"; e={Format-Memory-Size($_.MemoryUsageBytes)}} |
        Sort-Object "MemoryUsageBytes" -Descending
}