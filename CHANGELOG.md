# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.1] - 2022-11-15

### Fixed

- Use correct code signing certificate

## [1.0.0]

### Added

- Implement Code Signing
- Publish to PSGallery on merge to main or master
- Use temporary internal cert for process validation

### Changed

- Migrated primary development to IPSec internal
  - Code signing security reasons

## [0.0.3] - 2022-08-29

### Added

- Get-IpNetworkBase
- Documentation for new functions
- Convert-IpToMaskLen
- Get-IpNetworkEndIp
- Get-IpNetworkStartIp
- Test-IpRangeIsSubnet
- Test-ValidMask

### Updated

- IpNetwork Class instantiator uses Get-IpNetworkBase to set the IpAddress of the resultant object
- about_Ip.Tools discusses use of Class
- Pester Tests now load module using **Using**
- jscpd default configuration with threshold

### Fixed

- Various documentation example inconsistencies
- Not using the Network Base address when defining an IpNetwork caused some Test-IpInNetwork tests to fail
- [#2](https://github.com/IPSecMSSP/ip.tools/issues/5) New-IpNetwork should force the IpAddress property to use the Network Base Address

## [0.0.2] - 2021-12-22

### Added

- Get-IpNetworkBase
- Documentation for new functions
- Convert-IpToMaskLen
- Get-IpNetworkEndIp
- Get-IpNetworkStartIp
- Test-IpRangeIsSubnet
- Test-ValidMask

### Updated

- IpNetwork Class instantiator uses Get-IpNetworkBase to set the IpAddress of the resultant object
- about_Ip.Tools discusses use of Class
- Pester Tests now load module using **Using**
- jscpd default configuration with threshold

### Fixed

- Various documentation example inconsistencies
- Not using the Network Base address when defining an IpNetwork caused some Test-IpInNetwork tests to fail
- [#1](https://github.com/IPSecMSSP/ip.tools/issues/1) Linting Issue from first run of Mega-Linter

## [0.0.1] - 2021-11-26

### Added

- Initial release of IP.Tools
- Convert-MaskLenToIp
- New-IpNetwork
- Get-IpBogon
- Test-IpInNetwork
- Test-IpBogon
- Remove-IpBogon

### Changed

- Nothing

### Deprecated

- Nothing

### Removed

- Nothing

### Fixed

- Nothing

### Security

- Nothing

### Known Issues

[Unreleased]: https://github.com/IPSecMSSP/ip.tools
[1.0.0]: https://github.com/IPSecMSSP/ip.tools/releases/tag/v1.0.0
[0.0.3]: https://github.com/IPSecMSSP/ip.tools/releases/tag/v0.0.3
[0.0.2]: https://github.com/IPSecMSSP/ip.tools/releases/tag/v0.0.2
[0.0.1]: https://github.com/IPSecMSSP/ip.tools/releases/tag/v0.0.1
