function Get-IpNetworkBase {
  <#
    .SYNOPSIS
      Get the Base Network address for the supplied IP/Mask
    .DESCRIPTION
      Get the Base Network address for the supplied IP/Mask
    .PARAMETER CIDR
      [string] containing CIDR notation for network address
    .PARAMETER IP
      [IPAddress] object or Dotted Quad notation string representing the IP address
    .PARAMETER Mask
      [IpNetwork] Object or Dotted Quad notation string representing the Netmask
    .INPUTS
      CIDR Strings
    .OUTPUTS
      [IpAddress] Object
    .EXAMPLE
      PS> (Get-IpNetworkBase -CIDR 192.168.100.20/24).IPAddressToString
      192.168.100.0


    .EXAMPLE
      Use Pipeline to convert MaskLen to IP Address

      PS> 27 | Convert-MaskLenToIp


    .LINK
      https://github.com/jberkers42/ip.tools
  #>
  [CmdletBinding(DefaultParameterSetName = 'CIDR')]
  [OutputType([IpAddress])]
  param(
    [Parameter(ParameterSetName='CIDR',
      Mandatory=$true,
      Position = 0,
      ValueFromPipeline=$true)]
    [string] $CIDR,

    [Parameter(ParameterSetName='IpMask',
      Mandatory=$true,
      Position = 0)]
    [IpAddress] $IP,

    [Parameter(ParameterSetName='IpMask',
      Mandatory=$true,
      Position = 1)]
    [IpAddress] $Mask
  )

  Begin {
    $Me = $MyInvocation.MyCommand.Name

    Write-Verbose $Me
  }

  Process {
    If ($PSCmdlet.ParameterSetName -eq "CIDR") {
      ([IpAddress]$IP, $MaskLen) = $CIDR -split '/'
      [IpAddress]$Mask = Convert-MaskLenToIp $MaskLen
    }
    Write-Verbose "IP: $($IP); Mask: $($Mask);"
    [IpAddress]$Net = ($IP.Address -band $Mask.Address)
    return $Net
  }

  End {

  }

}