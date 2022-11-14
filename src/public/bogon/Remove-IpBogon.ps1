function Remove-IpBogon {
  #
  <#
    .SYNOPSIS
      Remove any Bogon IPs from the list of provided IPs.
    .DESCRIPTION
      Remove any Bogon IPs from the list of provided IPs. Each IP is expected to be either a dotted quad notation string representation of the address, or an [ipaddress] object.
    .INPUTS
      [IpAddress] or [string] values to filter
    .OUTPUTS
      Array of [ipaddress] objects that have had IP Bogons removed.
    .EXAMPLE
      PS> $IPs = Get-IpFromSomeSource
      PS> $IPs | Remove-IpBogon

      Obtain a list of IPs from some source (like a SIEM), and filter out the Bogon addresses
    .LINK
        https://github.com/IPSecMSSP/ip.tools
  #>
[cmdletbinding(SupportsShouldProcess)]
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

    if ($PSCmdlet.ShouldProcess($Address, "Remove IP if Bogon")) {
      if (!(Test-IpBogon -Address $Address)) {
        Write-Output $Address
    }
  }

  }

  End {

  }

}
