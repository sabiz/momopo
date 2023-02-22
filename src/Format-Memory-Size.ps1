Function Format-Memory-Size($SizeInBytes) {
    $units = "Bytes", "KB", "MB", "GB"
    $index = 0
    while ($SizeInBytes -gt 1024 -and $index -le $units.length) {
        $SizeInBytes /= 1024
        $index++
        if ($index -ge $units.Length -1) {
            break
        }
    }
    if ($index) {
        return '{0:N2} {1}' -f $SizeInBytes, $units[$index]
    }
    return "$SizeInBytes Bytes"
}
