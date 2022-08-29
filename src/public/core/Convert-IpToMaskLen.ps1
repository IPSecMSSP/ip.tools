function Convert-IpToMaskLen {
  <#
    .SYNOPSIS
        Convert a Subnet Mask to PrefixLength
    .DESCRIPTION
        Convert a Subnet Mask to a Prefix Length
    .EXAMPLE
        PS C:\> Convert-IpToMaskLen 255.255.0.0
        16

        This example counts the relevant network bits of the dotted SubnetMask 255.255.0.0.
    .INPUTS
        [string]
    .OUTPUTS
        [string]
  #>

  [CmdletBinding()]

  param (
    # SubnetMask to convert
    [Parameter(Mandatory)]
    [System.Net.IpAddress]$SubnetMask
  )

  Begin {
    $Me = $MyInvocation.MyCommand.Name

    Write-Verbose "$($Me): $($SubnetMask)"
  }

  Process {
    $Octets = $SubnetMask.IPAddressToString.Split('.')
    Write-Verbose "$($Me): Octets: $($Octets)"
    foreach($Octet in $Octets) {
      while(0 -ne $Octet){
        $Octet = ($Octet -shl 1) -band [byte]::MaxValue
        $result++
      }
    }

    $TestMask = Convert-MaskLenToIp -MaskLen $result

    if ($TestMask -ne $SubnetMask) {
      throw "Invalid Netmask Supplied"
    } else {
      $result -as [string]
    }
  }

  End {

  }

}