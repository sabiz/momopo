function Get-Progress-Bar {
    Param (
        [Parameter(Mandatory = $true)] [int] $width,
        [Parameter(Mandatory = $true)] [float] $progress,
        [Parameter(Mandatory = $true)] [string] $barChar,
        [Parameter(Mandatory = $true)] [string] $backgroundChar
    )
    $barCount = [Math]::Floor($width * $progress)

    return ($barChar * $barCount) + ($backgroundChar * ($width - $barCount))
}