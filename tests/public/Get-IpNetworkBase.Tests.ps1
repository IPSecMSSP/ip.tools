Describe 'Get-IpNetworkBase' {
  BeforeAll {
    # Setup for Testing
    $here = Split-Path -Parent $PSCommandPath
    . $here\..\_InitializeTests.ps1
  }

  Context 'When called with a CIDR parameter' {

    It 'Should return expected value.' {
      $CIDR = "192.168.10.20/28"

      (Get-IpNetworkBase -CIDR $CIDR).IPAddressToString | Should -Be "192.168.10.16"
    }

    It 'Should return a valid [ipnetwork] object.' {
      $CIDR = "192.168.10.0/28"

      (Get-IpNetworkBase -CIDR $CIDR).GetType().Name | Should -Be 'IpAddress'
    }

  }

  Context 'When called via Pipeline' {

    It 'Should return expected value.' {
      $CIDR = "192.168.10.35/27"

      ($CIDR | Get-IpNetworkBase).IPAddressToString | Should -Be "192.168.10.32"
    }

    It 'Should return a valid [ipnetwork] object.' {
      $CIDR = "192.168.10.0/28"

      ($CIDR | Get-IpNetworkBase).GetType().Name | Should -Be 'IpAddress'
    }

  }

  Context 'When called with IP and Mask parameters' {

    It 'Should return expected value.' {
      $IP = "192.168.10.100"
      $Mask = "255.255.255.224"

      (Get-IpNetworkBase -IP $IP -Mask $Mask).IPAddressToString | Should -Be "192.168.10.96"
    }

    It 'Should return a valid [ipnetwork] object.' {
      $IP = "192.168.10.0"
      $Mask = "255.255.255.224"

      (Get-IpNetworkBase -IP $IP -Mask $Mask).GetType().Name | Should -Be 'IpAddress'
    }

  }
}
