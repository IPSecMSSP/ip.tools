---
external help file: IP.Tools-help.xml
Module Name: IP.Tools
schema: 2.0.0
---

# Test-IpRangeIsSubnet

## SYNOPSIS

Test if the provided IP range specifies the beginning and end of a subnet.

## SYNTAX

```powershell
Test-IpRangeIsSubnet [-StartAddress] <ipaddress> [-EndAddress] <ipaddress> [<CommonParameters>]
```

## DESCRIPTION

Test if the provided IP range specifies the beginning and end of a subnet.

## EXAMPLES

### Example 1

```powershell
PS > Test-IpRangeIsSubnet -StartAddress "192.168.10.10" -EndAddress "192.168.10.20"
```

Returns $false

### Example 2

```powershell
PS > Test-IpRangeIsSubnet -StartAddress "192.168.10.0" -EndAddress "192.168.10.15"
```

Returns [ipaddress]255.255.255.240

## PARAMETERS

### StartAddress

String of dotted quad notation for an IP Address, or an IpAddress object.  Start Address to test.

### EndAddress

String of dotted quad notation for an IP Address, or an IpAddress object.  End Address to test.

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### IpAddress or String to test

## OUTPUTS

### boolean $false if not subnet

### ipaddress object for mask if is subnet

## NOTES

## RELATED LINKS

[IP.Tools Project](https://github.com/IPSecMSSP/ip.tools)
