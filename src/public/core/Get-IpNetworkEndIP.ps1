function Get-IpNetworkEndIP {
  [CmdletBinding(DefaultParameterSetName = 'CIDR')]
  [OutputType([ipaddress])]
  param (
      [Parameter(ParameterSetName='CIDR',
      Mandatory=$true,
      ValueFromPipeline=$true)]
      [string]$CIDR,

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
        Position = 1)]
      [IpNetwork] $Network
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
    Write-Verbose "$($Me): NetworkIP: $($NetworkIP)"
    [Array]::Reverse($NetworkIP)
    Write-Verbose "$($Me): NetworkIP (reversed): $($NetworkIP)"
    $NetworkIP = ([ipaddress]($NetworkIP -join ".")).Address

    $MaskLen = Convert-IpToMaskLen -SubnetMask $Network.IpNetmask

    $NumIPs = ([System.Math]::Pow(2,(32 -$MaskLen)))

    $EndIP = $NetworkIP + $NumIPs - 1

    # Convert to Double
    If (($EndIP.GetType()).Name -ine "double") {
      $EndIP = [Convert]::ToDouble($EndIP)
    }

    $EndIP = [ipaddress]$EndIP

    Return $EndIP
  }

  End {

  }
}