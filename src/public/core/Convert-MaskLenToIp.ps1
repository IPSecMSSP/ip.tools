function Convert-MaskLenToIp {
  <#
    .SYNOPSIS
      Convert MaskLen from CIDR Notation (IP/MaskLen) to an IP Address object
    .DESCRIPTION
      Convert MaskLen from CIDR Notation (IP/MaskLen) to an IP Address object
    .PARAMETER MaskLen
      Integer value representing the mask length
    .INPUTS
      Integer Mask Lenth
    .OUTPUTS
      [ipaddress] object representing the Netmask
    .EXAMPLE
      Pass a single MaskLen as a parameter

      PS> Convert-MaskLenToIp -MaskLen 24

      AddressFamily      : InterNetwork
      ScopeId            :
      IsIPv6Multicast    : False
      IsIPv6LinkLocal    : False
      IsIPv6SiteLocal    : False
      IsIPv6Teredo       : False
      IsIPv6UniqueLocal  : False
      IsIPv4MappedToIPv6 : False
      Address            : 16777215
      IPAddressToString  : 255.255.255.0

    .EXAMPLE
      Use Pipeline to convert MaskLen to IP Address

      PS> 27 | Convert-MaskLenToIp

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
  [CmdletBinding()]
  [OutputType([ipaddress])]

  param(
    [Parameter(Mandatory=$true,
      ValueFromPipeLine=$true)]
    [ValidateRange([int]0, [int]32)]
    [int]$MaskLen
  )

  Begin {
    $Me = $MyInvocation.MyCommand.Name

    Write-Verbose $Me
  }

  Process {

    [ipaddress]($AllMask - ($AllMask -shr $MaskLen))

  }

  End {

  }

}
