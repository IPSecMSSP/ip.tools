---
external help file: IP.Tools-help.xml
Module Name: IP.Tools
schema: 2.0.0
---

# New-IpNetwork

## SYNOPSIS

Create a new IpNetwork object containing the Address and Mask supplied.

## SYNTAX

```powershell
New-IpNetwork [-CIDR] <string> [-WhatIf] [-Confirm] [<CommonParameters>]

New-IpNetwork [-IP] <string> [-Mask] <string> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION

Create a new IpNetwork object using either a supplied CIDR Notation adddress, or a pair of IP and NetMask.

## EXAMPLES

### Example 1

```powershell
PS C:> $MyNetwork = New-IpNetwork -CIDR "192.168.10.0/24"
```

Create a new IpNetwork object for the network specified in the CIDR.

### Example 2

```powershell
PS C:> $MyNetwork = New-IpNetwork -IP "192.168.10.0" -Mask "255.255.255.0"
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

### IpNetwork

## NOTES

## RELATED LINKS

[IP.Tools Project](https://github.com/jberkers42/ip.tools)
