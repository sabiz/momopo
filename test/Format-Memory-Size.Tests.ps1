Describe 'Format-Memory-Size' {
    BeforeAll {
        . ((Split-Path -Path $PSScriptRoot) + '\src\' + (Split-Path -Leaf $PSCommandPath.Replace('.Tests.ps1','.ps1')))
    }

    It '1 Bytes' {
        Format-Memory-Size(1) | Should -Be '1 Bytes'
    }
    It '12 Bytes' {
        Format-Memory-Size(12) | Should -Be '12 Bytes'
    }
    It '123 Bytes' {
        Format-Memory-Size(123) | Should -Be '123 Bytes'
    }
    It '1 KB' {
        Format-Memory-Size(1234) | Should -Be '1.21 KB'
    }
    It '12 KB' {
        Format-Memory-Size(12345) | Should -Be '12.06 KB'
    }
    It '123 KB' {
        Format-Memory-Size(123456) | Should -Be '120.56 KB'
    }
    It '1 MB' {
        Format-Memory-Size(1234567) | Should -Be '1.18 MB'
    }
    It '10 MB' {
        Format-Memory-Size(12345678) | Should -Be '11.77 MB'
    }
    It '100 MB' {
        Format-Memory-Size(123456789) | Should -Be '117.74 MB'
    }
    It '1 GB' {
        Format-Memory-Size(1234567890) | Should -Be '1.15 GB'
    }
    It '10 GB' {
        Format-Memory-Size(12345678909) | Should -Be '11.50 GB'
    }
    It '100 GB' {
        Format-Memory-Size(123456789098) | Should -Be '114.98 GB'
    }
    It '1000 GB' {
        Format-Memory-Size(1234567890987) | Should -Be '1,149.78 GB'
    }
}