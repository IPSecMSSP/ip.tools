function Test-IpBogon {

  [cmdletbinding()]
  param (
      [Parameter(Mandatory=$true,
          ValueFromPipeLine=$true)]
      [ipaddress] $Address
  )

  Begin {
      $Me = $MyInvocation.MyCommand.Name

      Write-Verbose $Me

      $IpBogons = Get-IpBogon
  }

  Process {

      $IsBogon = $false

      foreach ($Bogon in $IpBogons) {
          if (Test-IpInNetwork -Address $Address -Network $Bogon) {
              $IsBogon = $true
          }
      }

      Write-Output $IsBogon

  }

  End {
      Clear-Variable 'IpBogons'
  }

}
