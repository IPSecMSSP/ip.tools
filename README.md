# IP.Tools

![GitHub release](https://img.shields.io/github/v/release/jberkers42/ip.tools?sort=semver)
[![MegaLinter](https://github.com/jberkers42/ip.tools/workflows/MegaLinter/badge.svg?branch=main)](https://github.com/jberkers42/ip.tools/actions?query=workflow%3AMegaLinter+branch%3Amain)

PowerShell module for the analysis and manipulation of IP Address related information.

## Overview

IP.Tools provides various functions to validate and test IP Addresses.  Initially will be limited to IPv4 addresses, but will extend to IPv6 when required.

## Getting Started

### PowerShell Gallery

Install IP.Tools from the [PowerShell Gallery](https://www.powershellgallery.com/) using `Install-Module`.

```powershell
Install-Module -Name IP.Tools -Scope CurrentUser
```

### Local Build

Use `Invoke-Build` to run a local build of IP.Tools...

```powershell
Invoke-Build -Task Build
```

Then you can import the built module into your PowerShell session.

```powershell
Import-Module "<ProjectRoot>\build\IP.Tools\IP.Tools.psd1" -Force
```

## Usage

TODO

## Uninstalling

Remove IP.Tools from your system using `Uninstall-Module`.

```powershell
Uninstall-Module -Name IP.Tools
```

## Importing From Source

If you are working on the module locally and want to import it into your PowerShell session without running through a compile/build, you can just import the module manifest directly from within the ```src``` directory.

```powershell
Import-Module "<ProjectRoot>\src\IP.Tools.psd1" -Force
```

## Contributions

Contributions are very welcome and there are many ways to contribute:

- Open a new bug report, feature request or just ask a question by creating a new issue.
- Participate in issue and pull requests discussion threads, and test fixes or new features.
- Submit your own fixes or features as a pull request.
  - If your change is substantial, please open an issue for discussion beforehand.
