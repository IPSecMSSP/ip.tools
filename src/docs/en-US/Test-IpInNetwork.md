---
external help file: IP.Tools-help.xml
Module Name: IP.Tools
schema: 2.0.0
---

# Test-IpInNetwork

## SYNOPSIS

Test if the provided IP is part of the provided network

## SYNTAX

```powershell
Test-IpInNetwork [-Address] <ipaddress> [-Network] <Object> [<CommonParameters>]
```

## DESCRIPTION

Test whether the provided IP is a part of the provided network

## EXAMPLES

### Example 1

```powershell
PS > Test-IpInNetwork -Address "192.168.10.10" -Network (New-IpNetwork "192.168.10.0/24")
```

Test if the provided address is a part of the provided network.

Returns $true

### Example 2

```powershell
PS > Test-IpInNetwork -Address "8.8.8.8" -Network "192.168.10.0/24"
```

Test if the provided address is apart of the specified network.

Returns $false

## PARAMETERS

### Address

String of dotted quad notation for an IP Address, or an IpAddress object.  Address to test.

### Network

IpNetwork object, consisting of an IpAddress and a Netmask or String in CIDR Notation.  Network to test against.

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### IpAddress or String to test

## OUTPUTS

### boolean

## NOTES

## RELATED LINKS

[IP.Tools Project](https://github.com/jberkers42/ip.tools)
