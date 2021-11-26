---
external help file: IP.Tools-help.xml
Module Name: IP.Tools
schema: 2.0.0
---

# Remove-IpBogon

## SYNOPSIS

Filter out Bogons from the provided list of IP addresses

## SYNTAX

```powershell
Remove-IpBogon [-Address] <ipaddress> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION

Filter out IP Bogon (Internet non-routable) Addresses from the provided list of IP Addresses in either **string** or **ipaddress** format.

## EXAMPLES

### Example 1

```powershell
PS > $IPList = Get-ListFromSomewhere
PS > $FilteredList = $IPList | Remove-IpBogon
```

Obtain a list of addresses from somewhere (such as a SIEM) and filter out the IP Bogons from this list.

### Example 2

```powershell
PS > $IPList = Get-ListFromSomewhere
PS > $FilteredList = ($IPList | Remove-IpBogon).IpAddressToString
```

Obtain a list of addresses from somewhere (such as a SIEM) and filter out the IP Bogons from this list, keeping only the string representations of the addresses.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### String or IpAddress

## OUTPUTS

### IpAddress

## NOTES

## RELATED LINKS

[IP.Tools Project](https://github.com/jberkers42/ip.tools)
[IP Bogon Ranges](https://ipgeolocation.io/resources/bogon.html)
[RFC1112](https://www.rfc-editor.org/rfc/rfc1112.html)
[RFC1122](https://www.rfc-editor.org/rfc/rfc1122.html)
[RFC1918](https://www.rfc-editor.org/rfc/rfc1918.html)
[RFC2544](https://www.rfc-editor.org/rfc/rfc2544.html)
[RFC5736](https://www.rfc-editor.org/rfc/rfc5736.html)
[RFC5737](https://www.rfc-editor.org/rfc/rfc5737.html)
[RFC3927](https://www.rfc-editor.org/rfc/rfc3927.html)
[RFC6598](https://www.rfc-editor.org/rfc/rfc6598.html)
