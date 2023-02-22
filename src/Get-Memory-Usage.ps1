function Get-Memory-Usage() {
    Get-CimInstance Win32_OperatingSystem | %{(($_.TotalVisibleMemorySize - $_.FreePhysicalMemory)/$_.TotalVisibleMemorySize)}
}