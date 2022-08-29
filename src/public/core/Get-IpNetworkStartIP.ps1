function Get-IpNetworkStartIP {
  [CmdletBinding(DefaultParameterSetName = 'CIDR')]
  [OutputType([ipaddress])]
  param (
      [Parameter(ParameterSetName='CIDR',
      Mandatory=$true,
      ValueFromPipeline=$true,
      Position = 1)]
      [String]$CIDR,

      [Parameter(ParameterSetName='IpMask',
        Mandatory=$true,
        Position = 0)]
      [string] $IP,

      [Parameter(ParameterSetName='IpMask',
        Mandatory=$true,
        Position = 1)]
      [string] $Mask,

      [Parameter(ParameterSetName='Network',
        Mandatory=$true,
        ValueFromPipeline=$true,
        Position = 1)]
      [IpNetwork] $Network,

      [Parameter(Mandatory=$false)]
      [switch]$ExcludeNetwork
  )

  Begin {
    $Me = $MyInvocation.MyCommand.Name

    Write-Verbose $Me
  }

  Process {
    Switch ($PSCmdlet.ParameterSetName) {
      "CIDR" {
        Write-Verbose "$($Me): Invoked with CIDR"
        $Network = [IpNetwork]::new($CIDR)
      }
      "IpMask" {
        Write-Verbose "$($Me): Invoked with IP/Mask"
        $Network = [IpNetwork]::new($IP, $Mask)
      }
      "Network" {
        Write-Verbose "$($Me): Invoked with IpNetwork Object"

      }
    }

    $NetworkIP = $Network.IPAddress.GetAddressBytes()
    [Array]::Reverse($NetworkIP)
    $NetworkIP = ([ipaddress]($NetworkIP -join ".")).Address

    if($ExcludeNetwork) {
      $StartIP = $NetworkIP + 1
    } else {
      $StartIP = $NetworkIP
    }

    # Convert to Double
    If (($StartIP.GetType()).Name -ine "double") {
      $StartIP = [Convert]::ToDouble($StartIP)
    }

    $StartIP = [ipaddress]$StartIP

    Return $StartIP
  }

  End {

  }

}