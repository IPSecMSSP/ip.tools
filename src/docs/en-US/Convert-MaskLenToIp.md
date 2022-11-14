---
external help file: IP.Tools-help.xml
Module Name: IP.Tools
schema: 2.0.0
---

# Convert-MaskLenToIp

## SYNOPSIS

Convert MaskLen from CIDR Notation (IP/MaskLen) to an IP Address object

## SYNTAX

```powershell
Convert-MaskLenToIp [-MaskLen] <int> [<CommonParameters>]
```

## DESCRIPTION

Convert MaskLen from CIDR (Classless Inter-Domain Routing) Notation (IP/MaskLen) to an IP Address object that represents the netmask.

This can subsequently be used to perform calculations, like checking if a single IP address belongs to a specific network.

## EXAMPLES

### Example 1

```powershell
PS > $Mask = Convert-MaskLenToIp -MaskLen 24
```

Assign the **ipaddress** representation of the mask to a variable.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[IP.Tools Project](https://github.com/IPSecMSSP/ip.tools)
