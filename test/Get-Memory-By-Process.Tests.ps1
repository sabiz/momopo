Describe 'Get-Memory-By-Process' {
    BeforeAll {
        . ((Split-Path -Path $PSScriptRoot) + '\src\' + (Split-Path -Leaf $PSCommandPath.Replace('.Tests.ps1','.ps1')))

        $testingValue = Get-Memory-By-Process
    }

    It 'Attribute-Name' {
        $names = $testingValue | Get-Member | Select-Object -ExpandProperty Name
        $names | Should -Contain 'Name'
    }

    It 'Attribute-MemoryUsage' {
        $names = $testingValue | Get-Member | Select-Object -ExpandProperty Name
        $names | Should -Contain 'MemoryUsage'
    }

    It 'Attribute-MemoryUsageBytes' {
        $names = $testingValue | Get-Member | Select-Object -ExpandProperty Name
        $names | Should -Contain 'MemoryUsageBytes'
    }

    It 'Order' {
        $values = $testingValue | Select-Object -ExpandProperty MemoryUsageBytes
        $values | Should -Be ($values | Sort-Object -Descending)
    }
}