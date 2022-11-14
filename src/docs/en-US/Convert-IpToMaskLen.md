---
external help file: IP.Tools-help.xml
Module Name: IP.Tools
schema: 2.0.0
---

# Convert-IpMaskToLen

## SYNOPSIS

Convert IP Address notation Mask to MaskLen as used in CIDR Notation (IP/MaskLen)

## SYNTAX

```powershell
Convert-IpToMaskLen [-SubnetMask] <ipaddress> [<CommonParameters>]
```

## DESCRIPTION

Convert IP Address notation Mask as a string or IpAddress Object to MaskLen as used in CIDR (Classless Inter Domain Routing) Notation (IP/MaskLen).

This can subsequently be used to perform calculations.

## EXAMPLES

### Example 1

```powershell
PS > $MaskLen = Convert-IpToMaskLen -SubnetMask 255.255.255.192
```

Assign the **MaskLen** representation of the mask to a variable.

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
