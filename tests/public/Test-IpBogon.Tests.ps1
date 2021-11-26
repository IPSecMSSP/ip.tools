Describe 'Test-IpBogon' {
  BeforeAll {
    # Setup for Testing
    $here = Split-Path -Parent $PSCommandPath
    . $here\..\_InitializeTests.ps1
  }

  Context 'When passed an IP Address from RFC1918' {

    It 'Should return true' {
      $IpToTest = "192.168.100.10"

      Test-IpBogon -Address $IpToTest | Should -Be $true
    }

  }

  Context 'When passed a Loopback Address' {

    It 'Should return true' {
      $IpToTest = "127.0.0.1"

      Test-IpBogon -Address $IpToTest | Should -Be $true
    }

  }

  Context 'When passed a Link Local Address' {

    It 'Should return true' {
      $IpToTest = "169.254.169.254"

      Test-IpBogon -Address $IpToTest | Should -Be $true
    }

  }

  Context 'When passed a Multicast Address' {

    It 'Should return true' {
      $IpToTest = "224.0.0.8"

      Test-IpBogon -Address $IpToTest | Should -Be $true
    }

  }

  Context 'When passed a "This Network" Address' {

    It 'Should return true' {
      $IpToTest = "0.0.0.8"

      Test-IpBogon -Address $IpToTest | Should -Be $true
    }

  }

  Context 'When passed a Reserved Address' {

    It 'Should return true' {
      $IpToTest = "240.0.100.8"

      Test-IpBogon -Address $IpToTest | Should -Be $true
    }

  }

  Context 'When passed a Limited Broadcast Address' {

    It 'Should return true' {
      $IpToTest = "255.255.255.255"

      Test-IpBogon -Address $IpToTest | Should -Be $true
    }

  }

  Context 'When passed a Public Routable Address' {

    It 'Should return false' {
      $IpToTest = "8.8.8.8"

      Test-IpBogon -Address $IpToTest | Should -Be $false
    }

  }

}
