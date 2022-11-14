function Test-IpInNetwork {
  <#
    .SYNOPSIS
      Test if an IP address exists in the specified network
    .DESCRIPTION
      Test if an IP address exists in the specified network
    .PARAMETER Address
      [IPAddress] object or Dotted Quad notation string representing the IP address to test
    .PARAMETER Network
      [IpNetwork] Object consisting of IpAddress and IpNetmask to check if IP belongs. If supplied as string, will be converted to IpNetwork before testing.
    .INPUTS
      IP Addresses and networks.
    .OUTPUTS
      [bool] result of test
    .EXAMPLE
      PS> $Network = New-IpNetwork "192.168.100.0/24"
      PS> Test-IpInNetwork -Address 192.168.100.20 -Network $Network


    .EXAMPLE
      Use Pipeline to convert MaskLen to IP Address

      PS> 27 | Convert-MaskLenToIp


    .LINK
      https://github.com/IPSecMSSP/ip.tools
  #>
  [cmdletbinding()]
  param (
      [Parameter(Mandatory=$true,
          ValueFromPipeLine=$true)]
      [ipaddress] $Address,

      [Parameter(Mandatory=$true,
          ValueFromPipeline=$true)]
      [ValidateScript({
        $TypeName = $_ | Get-Member | Select-Object -ExpandProperty TypeName -Unique
        if ($TypeName -eq 'System.String' -and $_ -match "(\d{1,3}\.){3}\d{1,3}\/\d{1,2}") {
          Write-Verbose "Convert From String: $_"
          New-IpNetwork $_
        } elseif ($TypeName -eq 'IpNetwork') {
          Write-Verbose "Taken as IpNetwork Object $_"
          $_
        }
      })]
      $Network
  )

  Begin {
      $Me = $MyInvocation.MyCommand.Name

      Write-Verbose $Me

  }

  Process {

    Write-Verbose "Network To Test: $Network"

    if ($Network.GetType().Name -eq 'String') {
      $Network = New-IpNetwork -CIDR $Network
    }

    if ($Network.IpAddress.Address -eq ($Address.Address -band $Network.IpNetmask.Address)) {
        Write-Output $true
    } else {
        Write-Output $false
    }
  }

  End {

  }
}
