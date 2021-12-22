Describe 'New-IpNetwork' {
  BeforeAll {
    # Setup for Testing
    $here = Split-Path -Parent $PSCommandPath
    . $here\..\_InitializeTests.ps1
  }

  Context 'When called with a CIDR parameter' {

    It 'Should return expected value.' {
      $CIDR = "192.168.10.10/28"

      (New-IpNetwork -CIDR $CIDR).IpAddress.IPAddressToString | Should -Be "192.168.10.0"
      (New-IpNetwork -CIDR $CIDR).IpNetmask.IPAddressToString | Should -Be "255.255.255.240"
    }

    It 'Should return a valid [ipnetwork] object.' {
      $CIDR = "192.168.10.0/28"

      (New-IpNetwork -CIDR $CIDR).GetType().Name | Should -Be 'IpNetwork'
    }

  }

  Context 'When called via Pipeline' {

    It 'Should return expected value.' {
      $CIDR = "192.168.10.10/28"

      ($CIDR | New-IpNetwork).IpAddress.IPAddressToString | Should -Be "192.168.10.0"
      ($CIDR | New-IpNetwork).IpNetmask.IPAddressToString | Should -Be "255.255.255.240"
    }

    It 'Should return a valid [ipnetwork] object.' {
      $CIDR = "192.168.10.0/28"

      ($CIDR | New-IpNetwork).GetType().Name | Should -Be 'IpNetwork'
    }

  }

  Context 'When called with IP and Mask parameters' {

    It 'Should return expected value.' {
      $IP = "192.168.10.10"
      $Mask = "255.255.255.224"

      (New-IpNetwork -IP $IP -Mask $Mask).IpAddress.IPAddressToString | Should -Be "192.168.10.0"
      (New-IpNetwork -IP $IP -Mask $Mask).IpNetmask.IPAddressToString | Should -Be "255.255.255.224"
    }

    It 'Should return a valid [ipnetwork] object.' {
      $IP = "192.168.10.0"
      $Mask = "255.255.255.224"

      (New-IpNetwork -IP $IP -Mask $Mask).GetType().Name | Should -Be 'IpNetwork'
    }

  }
}
