---
external help file: IP.Tools-help.xml
Module Name: IP.Tools
schema: 2.0.0
---

# Test-IpBogon

## SYNOPSIS

Test if the provided IP is a Bogon

## SYNTAX

```powershell
Test-IpBogon [-Address] <ipaddress> [<CommonParameters>]
```

## DESCRIPTION

Test whether the provided IP is an IP Bogon (Internet non-routable) Addresses.

## EXAMPLES

### Example 1

```powershell
PS > Test-IpBogon -Address "192.168.10.10"
```

Test if the provided address is a Bogon, with RFC1918 address.

Returns $true

### Example 2

```powershell
PS > Test-IpBogon -Address "8.8.8.8"
```

Test if the provided address is a Bogon, with Google DNS address.

Returns $false

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### IpAddress or String to test

## OUTPUTS

### IpNetwork

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
