function Get-IpBogon {
  <#
    .SYNOPSIS
        Return a list of IP Bogons with [ipaddress] objects representing the IP and Mask
    .DESCRIPTION
        Return a list of IP Bogons (Internet non-routable addresses) with [ipaddress] objects representing both IP and Mask.

        IP Bogons are Internet non-routable addresses that are either reserved for Private use (RFC1918), or are otherwise not available.
    .INPUTS
        None
    .OUTPUTS
        Array of [ipaddress] objects representing IP Bogons.
    .EXAMPLE
        PS> $Bogons = Get-IpBogon.ps1
    .LINK
        https://github.com/jberkers42/ip.tools
  #>
  [CmdletBinding()]

  $Bogons = @()
  $Bogons += '0.0.0.0/8'          # RFC1122 "This" network
  $Bogons += '10.0.0.0/8'         # RFC1918 Private-use networks
  $Bogons += '100.64.0.0/10'      # RFC6598 Carrier-grade NAT
  $Bogons += '127.0.0.0/8'        # RFC1122 IPv4 Loopback
  $Bogons += '169.254.0.0/16'     # RFC3927 IPv4 Link local
  $Bogons += '172.16.0.0/12'      # RFC1918 Private-use networks
  $Bogons += '192.0.0.0/24'       # RFC5736 IETF protocol assignments
  $Bogons += '192.0.2.0/24'       # RFC5737 TEST-NET-1
  $Bogons += '192.168.0.0/16'     # RFC1918 Private-use networks
  $Bogons += '198.18.0.0/15'      # RFC2544 Network interconnect device benchmark testing
  $Bogons += '198.51.100.0/24'    # RFC5737 TEST-NET-2
  $Bogons += '203.0.113.0/24'     # RFC5737 TEST-NET-3
  $Bogons += '224.0.0.0/4'        # RFC1112 Multicast
  $Bogons += '240.0.0.0/4'        # Reserved for future use

  $BogonIps = @()

  foreach ($Bogon in $Bogons) {

      $BogonIp = [IpNetwork]::new($Bogon)

      $BogonIPs += $BogonIp
  }

  Write-Output $BogonIps

}
