Describe 'Test-IpInNetwork' {
  BeforeAll {
    # Setup for Testing
    $here = Split-Path -Parent $PSCommandPath
    . $here\..\_InitializeTests.ps1
  }

  Context 'When passed an IP that belongs in the network being tested' {

    It 'Should return true' {
      $IpToTest = "192.168.100.10"
      $NetworkToTest = New-IpNetwork "192.168.100.0/24"

      Test-IpInNetwork -Address $IpToTest -Network $NetworkToTest | Should -Be $true
    }

  }

  Context 'When passed an IP that belongs in the string network being tested' {

    It 'Should return true' {
      $IpToTest = "192.168.100.10"
      $NetworkToTest = "192.168.100.0/24"

      Test-IpInNetwork -Address $IpToTest -Network $NetworkToTest | Should -Be $true
    }

  }

  Context 'When passed an IP that does not belong in the network being tested' {

    It 'Should return false' {
      $IpToTest = "192.168.101.10"
      $NetworkToTest = New-IpNetwork "192.168.100.0/24"

      Test-IpInNetwork -Address $IpToTest -Network $NetworkToTest | Should -Be $false
    }

  }

  Context 'When passed an IP that does not belong in the string network being tested' {

    It 'Should return false' {
      $IpToTest = "192.168.101.10"
      $NetworkToTest = "192.168.100.0/24"

      Test-IpInNetwork -Address $IpToTest -Network $NetworkToTest | Should -Be $false
    }

  }

}
