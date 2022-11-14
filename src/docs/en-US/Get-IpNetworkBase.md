---
external help file: IP.Tools-help.xml
Module Name: IP.Tools
schema: 2.0.0
---

# Get-IpNetworkBase

## SYNOPSIS

Get an IpAddress object containing the Base Network Address for the CIDR or IP and Mask supplied.

## SYNTAX

```powershell
Get-IpNetworkBase [-CIDR] <string> [<CommonParameters>]

Get-IpNetworkBase [-IP] <ipaddress> [-Mask] <ipaddress> [<CommonParameters>]
```

## DESCRIPTION

Get an IpAddress object containing the Base Network Address for the CIDR or IP and Mask supplied.  The CIDR or IP address provided may not represent the base address of the network.

## EXAMPLES

### Example 1

```powershell
PS C:> (Get-IpNetworkBase -CIDR "192.168.10.10/24").IPAddressToString

    192.168.10.0
```

Create a new IpNetwork object for the network specified in the CIDR.

### Example 2

```powershell
PS C:> $MyNetwork = Get-IpNetworkBase -IP "192.168.10.18" -Mask "255.255.255.248"

    AddressFamily      : InterNetwork
    ScopeId            :
    IsIPv6Multicast    : False
    IsIPv6LinkLocal    : False
    IsIPv6SiteLocal    : False
    IsIPv6Teredo       : False
    IsIPv6UniqueLocal  : False
    IsIPv4MappedToIPv6 : False
    Address            : 275032256
    IPAddressToString  : 192.168.10.16
```

Create a new IpNetwork object for the network specified in the IP and Mask parameters.

## PARAMETERS

### CIDR

A CIDR Notation string.

### IP

A Dotted Quad notation string representing the base address of the network.

### Mask

A Dotted Quad notation string representing the network mask.

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### IpAddress

## NOTES

## RELATED LINKS

[IP.Tools Project](https://github.com/IPSecMSSP/ip.tools)
