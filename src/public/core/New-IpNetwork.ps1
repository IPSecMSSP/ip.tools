function New-IpNetwork {
  <#
    .SYNOPSIS
      Create a new IpNetwork object with the specified CIDR or IP and Mask parameters
    .DESCRIPTION
      Create a new IpNetwork object with the specified CIDR or IP and Mask parameters
    .PARAMETER CIDR
      [string] containing CIDR notation for network
    .PARAMETER IP
      [IPAddress] object or Dotted Quad notation string representing the IP address
    .PARAMETER Mask
      [IpNetwork] Object or Dotted Quad notation string representing the Netmask
    .INPUTS
      CIDR Strings
    .OUTPUTS
      [IpNetwork] Object
    .EXAMPLE
      PS> $Network =
      PS> Test-IpInNetwork -Address 192.168.100.20 -Network


    .EXAMPLE
      Use Pipeline to convert MaskLen to IP Address

      PS> 27 | Convert-MaskLenToIp


    .LINK
      https://github.com/jberkers42/ip.tools
  #>
  [CmdletBinding(DefaultParameterSetName = 'CIDR', SupportsShouldProcess)]
  param(
    [Parameter(ParameterSetName='CIDR',
      Mandatory=$true,
      Position = 0,
      ValueFromPipeline=$true)]
    [string] $CIDR,

    [Parameter(ParameterSetName='IpMask',
      Mandatory=$true,
      Position = 0)]
    [string] $IP,

    [Parameter(ParameterSetName='IpMask',
      Mandatory=$true,
      Position = 1)]
    [string] $Mask
  )

  Begin {
    $Me = $MyInvocation.MyCommand.Name

    Write-Verbose $Me
  }

  Process {
    if ($PSCmdlet.ShouldProcess("IpNetwork", "Return new IP Network from CIDR or IP and Mask")) {
      Switch ($PSCmdlet.ParameterSetName) {
        "CIDR" {
          return [IpNetwork]::new($CIDR)
        }
        "IpMask" {
          return [IpNetwork]::new($IP, $Mask)
        }
      }
    }
  }

  End {

  }

}