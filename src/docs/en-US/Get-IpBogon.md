---
external help file: IP.Tools-help.xml
Module Name: IP.Tools
schema: 2.0.0
---

# Get-IpBogon

## SYNOPSIS

Get a list of IP Bogon Addresses

## SYNTAX

```powershell
Get-IpBogon
```

## DESCRIPTION

Get a list of IP Bogon (Internet non-routable) Addresses in **IpNetwork** format consisting of **IPAddress** objects contained in the IpAddress and IpNetmask properties.

## EXAMPLES

### Example 1

```powershell
PS > Get-IpBogon
```

Get a list of the IP Bogon addresses and their respective network masks.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

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
