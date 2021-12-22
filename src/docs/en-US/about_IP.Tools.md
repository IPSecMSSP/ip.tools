# IP.Tools

## about_IP.Tools

### Short Description

PowerShell module for the analysis and manipulation of IP Address related information.

### Long Description

PowerShell module for the analysis and manipulation of IP Address related information.

Created primarily to test whether specific IPs belong to a specific network, filter **Bogons** from a list of IPs, and some other ancillary function.

None of the modules I found handled this in the way I needed it, so this module was born.


## Classes

This module defines a class, **IpNetwork** that is used internally by the module.  If you would like to interact with this class you will need to make use of the module as follows:

```powershell
Using module IP.Tools

$MyNetwork = [IpNetwork]::New("192.168.1.0/24")
```

## EXAMPLES

'''powershell
$Ip = "8.8.8.8"
$MyNetwork = New-IpNetwork "192.168.0.0/24"
if (Test-IpInNetwork -Address $Ip -Network $MyNetwork) {
  Write-Output "There's something strange going on, Google is in your network"
} else {
  Write-Output "Google is outside your network"
}
'''

## NOTE

This module was created for a specific purpose, with a view to extending it as required.  If some IP-related function is missing, please make a suggestion.

## SEE ALSO

Nothing yet
