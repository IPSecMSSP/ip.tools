## Running A Build Will Compile This To A Single PSM1 File Containing All Module Code ##

## If Importing Module Source Directly, This Will Dynamically Build Root Module ##

# Get list of private functions and public functions to import, in order.
$Private = @(Get-ChildItem -Path $PSScriptRoot\private -Recurse -Filter "*.ps1") | Sort-Object Name
$Public = @(Get-ChildItem -Path $PSScriptRoot\public -Recurse -Filter "*.ps1") | Sort-Object Name

$AllMask = [Math]::Pow(2, 32)
New-Variable -Name AllMask -Value $AllMask -Scope Script -Force

Class IpNetwork {

  [ipaddress]$IpAddress
  [ipaddress]$IpNetmask

  IpNetwork ([string]$CIDR) {
    ($IP, $MaskLen) = $CIDR.Split('/')
    $IP = Get-IpNetworkBase -CIDR $CIDR
    Write-Verbose "IP: $($IP); Mask: $($MaskLen)"
    $this.IpAddress = [ipaddress]($IP)
    $this.IpNetmask = [ipaddress](Convert-MaskLenToIp($MaskLen))
  }

  IpNetwork ([IpAddress]$IP, [IpAddress] $Mask) {
    Write-Verbose "IP: $($IP); Mask: $($Mask)"
    $IP = Get-IpNetworkBase -IP $IP -Mask $Mask
    $this.IpAddress = $IP
    $this.IpNetmask = $Mask
  }
}

# Dot source the private function files.
foreach ($ImportItem in $Private) {
  try {
    . $ImportItem.FullName
    Write-Verbose -Message ("Imported private function {0}" -f $ImportItem.FullName)
  }
  catch {
    Write-Error -Message ("Failed to import private function {0}: {1}" -f $ImportItem.FullName, $_)
  }
}

# Dot source the public function files.
foreach ($ImportItem in $Public) {
  try {
    . $ImportItem.FullName
    Write-Verbose -Message ("Imported public function {0}" -f $ImportItem.FullName)
  }
  catch {
    Write-Error -Message ("Failed to import public function {0}: {1}" -f $ImportItem.FullName, $_)
  }
}

# Export the public functions.
Export-ModuleMember -Function $Public.BaseName