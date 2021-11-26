Describe 'Remove-IpBogon' {
  BeforeAll {
    # Setup for Testing
    $here = Split-Path -Parent $PSCommandPath
    . $here\..\_InitializeTests.ps1

}

  Context 'When called with all bogons' {

    It 'Should return no entries.' {
      $TestFileName = $PSScriptRoot + '\data\Remove-IpBogon-mixed.json'
      $IPData = Get-Content $TestFileName | ConvertFrom-Json -Depth 5
      $IPList = $IPData.allbogon

      ($IPList | Remove-IpBogon).Count | Should -Be 0
    }
  }

  Context 'When called with no bogons' {

    It 'Should return All entries.' {
      $TestFileName = $PSScriptRoot + '\data\Remove-IpBogon-mixed.json'
      $IPData = Get-Content $TestFileName | ConvertFrom-Json -Depth 5
      $IPList = $IPData.nobogon

      ($IPList | Remove-IpBogon).Count | Should -Be $IPList.Count
    }

  }

  Context 'When called with mixed addresses' {

    It 'Should return non-bogon entries.' {
      $TestFileName = $PSScriptRoot + '\data\Remove-IpBogon-mixed.json'
      $IPData = Get-Content $TestFileName | ConvertFrom-Json -Depth 5
      $IPList = $IPData.nobogon + $IPData.allbogon

      ($IPList | Remove-IpBogon).Count | Should -Be $IPData.nobogon.Count
    }

  }

}
