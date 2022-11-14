---
external help file: IP.Tools-help.xml
Module Name: IP.Tools
schema: 2.0.0
---

# Get-IpNetworkEndIp

## SYNOPSIS

Get an IpAddress object containing the Base Network Address for the CIDR or IP and Mask supplied.

## SYNTAX

```powershell
Get-IpNetworkEndIP [-CIDR] <string> [<CommonParameters>]

Get-IpNetworkEndIP [-IP] <string> [-Mask] <string> [<CommonParameters>]

Get-IpNetworkEndIP [-Network] <IpNetwork> [<CommonParameters>]
```

## DESCRIPTION

Get an IpAddress object containing the End IP Address for the CIDR or IP and Mask supplied.

## EXAMPLES

### Example 1

```powershell
PS C:> (Get-IpNetworkEndIp -CIDR "192.168.10.10/24").IPAddressToString

    192.168.10.255
```

Get the string representation of the last IP address in the network specified in the CIDR.

### Example 2

```powershell
PS C:> $MyNetwork = Get-IpNetworkEndIp -IP "192.168.10.18" -Mask "255.255.255.248"

    AddressFamily      : InterNetwork
    ScopeId            :
    IsIPv6Multicast    : False
    IsIPv6LinkLocal    : False
    IsIPv6SiteLocal    : False
    IsIPv6Teredo       : False
    IsIPv6UniqueLocal  : False
    IsIPv4MappedToIPv6 : False
    Address            : 386574528
    IPAddressToString  : 192.168.10.23
```

Get an IpAddress object for the last IP address in the network specified in the IP and Mask parameters.

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
