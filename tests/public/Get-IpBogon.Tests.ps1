Describe 'Get-IpBogon' {
  BeforeAll {
    # Setup for Testing
    $here = Split-Path -Parent $PSCommandPath
    . $here\..\_InitializeTests.ps1
  }

  Context 'When called' {

    It 'Should return the expected number of entries.' {
      (Get-IpBogon).Count | Should -Be 14
    }

    It 'Should return a valid [ipnetwork] object.' {
      (Get-IpBogon)[0].GetType().Name | Should -Be 'IpNetwork'
    }

  }

}
