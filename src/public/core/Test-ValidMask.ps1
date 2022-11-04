function Test-ValidMask {
  <#
    .SYNOPSIS
      Test if an IP address represents a valid network mask
    .DESCRIPTION
      Test if an IP address represents a valid network mask.  I.E. the binary representation contains all 1's followed by all 0'
    .PARAMETER Address
      [IPAddress] object or Dotted Quad notation string representing the IP address to test
    .INPUTS
      IP Address
    .OUTPUTS
      [bool] result of test
    .EXAMPLE
      PS> $Mask = "255.255.192.0"
      PS> Test-ValidMask -Address $Mask

    .EXAMPLE
      Use Pipeline to convert MaskLen to IP Address

      PS> 27 | Convert-MaskLenToIp


    .LINK
      https://github.com/jberkers42/ip.tools
  #>
  [cmdletbinding()]
  param (
      [Parameter(Mandatory=$true,
          ValueFromPipeLine=$true)]
      [ipaddress] $Address
  )

  Begin {
      $Me = $MyInvocation.MyCommand.Name

      Write-Verbose $Me

  }

  Process {

    Write-Verbose "Mask To Test: $Address"

    # Convert Address to binary representation
    $binAddress = ($Address.GetAddressBytes() | ForEach-Object {[System.Convert]::ToString($_,2).PadLeft(8,'0')}) -join ''

    $AddressBits = $binAddress.ToCharArray()

    $Last = 1
    $ValidMask = $true
    Foreach ($bit in $AddressBits) {
      if ($bit -eq '1') {
        if ($Last -ne '1') {
          $ValidMask = $false
        }
      }
      $Last = $bit
    }

    Write-Output $ValidMask
  }

  End {

  }
}
