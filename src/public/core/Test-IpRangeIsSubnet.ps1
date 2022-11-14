function Test-IpRangeIsSubnet {
  <#
    .SYNOPSIS
      Test if supplied IP Range is a valid Subnet
    .DESCRIPTION
      Test if supplied IP Range is a valid Subnet
    .PARAMETER StartAddress
      [IPAddress] object or Dotted Quad notation string representing the Start IP address of the range to test
    .PARAMETER EndAddress
      [IPAddress] object or Dotted Quad notation string representing the End IP address of the range to test
    .INPUTS
      IP Addresses
    .OUTPUTS
      [bool] False if the IP Range does not represent a valid subnet
      [ipaddress] representation of the Subnet Mask
    .EXAMPLE
      PS> $StartAddress = 192.168.1.0
      PS> $EndAddress = 192.168.1.15
      PS> Test-IpRangeIsSubnet -StartAddress $StartAddress -EndAddress $EndAddress

        AddressFamily      : InterNetwork
        ScopeId            :
        IsIPv6Multicast    : False
        IsIPv6LinkLocal    : False
        IsIPv6SiteLocal    : False
        IsIPv6Teredo       : False
        IsIPv6UniqueLocal  : False
        IsIPv4MappedToIPv6 : False
        Address            : 3774873599
        IPAddressToString  : 255.255.255.224

    .LINK
      https://github.com/IPSecMSSP/ip.tools
  #>
  [cmdletbinding()]
  param (
      [Parameter(Mandatory=$true,
          ValueFromPipeLine=$true)]
      [ipaddress] $StartAddress,

      [Parameter(Mandatory=$true,
          ValueFromPipeLine=$true)]
      [ipaddress] $EndAddress
  )

  Begin {
      $Me = $MyInvocation.MyCommand.Name

      Write-Verbose $Me
  }

  Process {

    Write-Verbose "Address Range To Test: $StartAddress - $EndAddress"

    $StartAddressBytes = $StartAddress.GetAddressBytes()
    $EndAddressBytes = $EndAddress.GetAddressBytes()

    $AddressDiffBytes = @()
    for (($octet = 0);  ($octet -lt $StartAddressBytes.Count); $octet++) {
      Write-verbose "Octet $octet"
      $AddressDiffBytes += $StartAddressBytes[$octet] -bxor $EndAddressBytes[$octet]
    }

    Write-Verbose "$($AddressDiffBytes -join '.')"
    [ipaddress]$AddressDiff = $AddressDiffBytes -join '.'

    Write-Verbose $AddressDiff

    [ipaddress]$MaskDiff = ($AllMask - 1) - $AddressDiff.Address

    Write-Verbose $MaskDiff

    # Reverse the bytes
    $Octets = $MaskDiff.IPAddressToString.Split('.')
    [Array]::Reverse($Octets)
    $Mask = [IpAddress]($Octets -join '.')

    if (Test-ValidMask ($Mask)) {
        Write-Output $Mask
    } else {
        Write-Output $false
    }
  }

  End {

  }
}
