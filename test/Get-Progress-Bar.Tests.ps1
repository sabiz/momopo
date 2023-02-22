Describe 'Get-Progress-Bar' {
    BeforeAll {
        . ((Split-Path -Path $PSScriptRoot) + '\src\' + (Split-Path -Leaf $PSCommandPath.Replace('.Tests.ps1','.ps1')))
    }

    It '0%' {
        Get-Progress-Bar 10  0 "█"  "▒" | Should -Be ('▒'*10)
    }
    It '5%' {
        Get-Progress-Bar 10 0.05 "█" "▒" | Should -Be ('▒'*10)
    }
    It '10%' {
        Get-Progress-Bar 10 0.1 "█" "▒" | Should -Be ('█'+'▒'*9)
    }
    It '16%' {
        Get-Progress-Bar 20 0.16 "█" "▒" | Should -Be ('█'*3+'▒'*17)
    }
    It '21%' {
        Get-Progress-Bar 10 0.21 "█" "▒" | Should -Be ('█'*2 + '▒'*8)
    }
    It '27%' {
        Get-Progress-Bar 10 0.27 "█" "▒" | Should -Be ('█'*2 + '▒'*8)
    }
    It '33%' {
        Get-Progress-Bar 50 0.33 "█" "▒" | Should -Be ('█'*16 + '▒'*34)
    }
    It '44%' {
        Get-Progress-Bar 10 0.44 "█" "▒" | Should -Be ('█'*4 + '▒'*6)
    }
    It '50%' {
        Get-Progress-Bar 10 0.5 "█" "▒" | Should -Be ('█'*5 + '▒'*5)
    }
    It '57%' {
        Get-Progress-Bar 10 0.57 "█" "▒" | Should -Be ('█'*5 + '▒'*5)
    }
    It '64%' {
        Get-Progress-Bar 32 0.64 "█" "▒" | Should -Be ('█'*20 + '▒'*12)
    }
    It '71%' {
        Get-Progress-Bar 10 0.71 "█" "▒" | Should -Be ('█'*7 + '▒'*3)
    }
    It '80%' {
        Get-Progress-Bar 10 0.8 "█" "▒" | Should -Be ('█'*8 + '▒'*2)
    }
    It '86%' {
        Get-Progress-Bar 150 0.86 "█" "▒" | Should -Be ('█'*129 + '▒'*21)
    }
    It '91%' {
        Get-Progress-Bar 10 0.91 "█" "▒" | Should -Be ('█'*9 + '▒'*1)
    }
    It '99%' {
        Get-Progress-Bar 10 0.99 "█" "▒" | Should -Be ('█'*9 + '▒'*1)
    }
    It '100%' {
        Get-Progress-Bar 10 1 "█" "▒" | Should -Be ('█'*10)
    }
}