Describe 'Convert-MaskLenToIp' {
  BeforeAll {
    # Setup for Testing
    $here = Split-Path -Parent $PSCommandPath
    . $here\..\_InitializeTests.ps1
  }

  Context 'When passed a valid mask length as an argument' {

    It 'Should return the correct mask.' {
      (Convert-MaskLenToIp -MaskLen 24).IPAddressToString | Should -Be '255.255.255.0'
    }

    It 'Should return a valid [ipaddress] object.' {
      (Convert-MaskLenToIp -MaskLen 24).GetType().Name | Should -Be 'IPAddress'
    }

  }

  Context 'When passed a valid mask length as pipeline input' {

    It 'Should return the correct mask.' {
      (26 | Convert-MaskLenToIp).IPAddressToString | Should -Be '255.255.255.192'
    }

    It 'Should return a valid [ipaddress] object.' {
      (26 | Convert-MaskLenToIp).GetType().Name | Should -Be 'IPAddress'
    }

  }

  Context 'When passed an invalid mask length' {

    It 'Should return an error.' {
      { Convert-MaskLenToIP -MaskLen 33 } | Should -Throw
    }

    It 'Should return an error.' {
      { Convert-MaskLenToIP -MaskLen "string" } | Should -Throw
    }
  }

}
