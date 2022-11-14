---
external help file: IP.Tools-help.xml
Module Name: IP.Tools
schema: 2.0.0
---

# Get-IpNetworkStartIp

## SYNOPSIS

Get an IpAddress object containing the Base Network Address for the CIDR or IP and Mask supplied.

## SYNTAX

```powershell
Get-IpNetworkStartIP [-CIDR] <string> [-ExcludeNetwork] [<CommonParameters>]

Get-IpNetworkStartIP [-IP] <string> [-Mask] <string> [-ExcludeNetwork] [<CommonParameters>]

Get-IpNetworkStartIP [-Network] <IpNetwork> [-ExcludeNetwork] [<CommonParameters>]
```

## DESCRIPTION

Get an IpAddress object containing the Start IP Address for the CIDR or IP and Mask supplied.

## EXAMPLES

### Example 1

```powershell
PS C:> (Get-IpNetworkStartIp -CIDR "192.168.10.10/24").IPAddressToString

    192.168.10.0
```

Get the string representation of the first IP address in the network specified in the CIDR. Counts the Network IP as the first IP by default.

### Example 2

```powershell
PS C:> (Get-IpNetworkStartIp -CIDR "192.168.10.10/24" -ExcludeNetwork).IPAddressToString

    192.168.10.1
```

Get the string representation of the first IP address in the network specified in the CIDR. Skips the Network IP as the first IP.

### Example 3

```powershell
PS C:> $MyNetwork = Get-IpNetworkStartIp -IP "192.168.10.18" -Mask "255.255.255.248"

    AddressFamily      : InterNetwork
    ScopeId            :
    IsIPv6Multicast    : False
    IsIPv6LinkLocal    : False
    IsIPv6SiteLocal    : False
    IsIPv6Teredo       : False
    IsIPv6UniqueLocal  : False
    IsIPv4MappedToIPv6 : False
    Address            : 269134016
    IPAddressToString  : 192.168.10.16
```

Create a new IpAddress object for the first IP address in the subnet specified in the IP and Mask parameters.

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
