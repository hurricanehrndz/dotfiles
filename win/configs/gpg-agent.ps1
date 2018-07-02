#requires -version 5
<#
.SYNOPSIS
  <Overview of script>
.DESCRIPTION
  <Brief description of script>
.PARAMETER <Parameter_Name>
    <Brief description of parameter input required. Repeat this attribute if required>
.INPUTS
  <Inputs if any, otherwise state None>
.OUTPUTS
  <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>
.NOTES
  Version:        1.0
  Author:         <Name>
  Creation Date:  <Date>
  Purpose/Change: Initial script development
  
.EXAMPLE
  <Example goes here. Repeat this attribute for more than one example>
#>

#---------------------------------------------------------[Initialisations]--------------------------------------------------------
Start-Process -WindowStyle Hidden -FilePath 'C:\Program Files (x86)\GnuPG\bin\gpg-connect-agent.exe' -ArgumentList '/bye'
Start-Sleep -Seconds 5

#----------------------------------------------------------[Declarations]----------------------------------------------------------
#Script Version
$sScriptVersion = "1.0"

#bash variables
$BashHome = $(bash -l -c "echo `$HOME")
$WslGpgSock = "$($BashHome)/.gnupg/S.gpg-agent"
$WslGpgExtraSock = "$($BashHome)/.gnupg/S.gpg-agent.extra"

#Gpg Variables
$GpgSock = "$env:APPDATA\gnupg\S.gpg-agent"
$GpgExtraSock = "$env:APPDATA\gnupg\S.gpg-agent.extra"
$WinGpgSockOnWsl = $GpgSock -replace "C`:\\","/mnt/c/" -replace "\\","/"
$WinGpgExtraSockOnWsl = $GpgSock -replace "C`:\\","/mnt/c/" -replace "\\","/"
$GpgNonce = "$WslGpgSock.nonce"
$GpgExtraNonce = "$WslGpgExtraSock.nonce"


#-----------------------------------------------------------[Functions]------------------------------------------------------------

Function Start-GpgTcpSockBridge {
  Param(
    [parameter(Mandatory=$true)]
    [String]
    $WslSock,
    [parameter(Mandatory=$true)]
    [String]
    $SockPort,
    [parameter(Mandatory=$true)]
    [String]
    $SockNonce
  )
  
  Process{
    Try{
      $cmd = "socat UNIX-LISTEN:$($WslSock),fork \`"SYSTEM: cat $($SockNonce) - | socat STDIO \\\`"TCP4:localhost:$($SockPort)\\\`"\`""
      bash -l -c "rm -f \`"$WslSock\`""
      Start-Process -WindowStyle Hidden -ArgumentList "-l -c `"$($cmd)`"" bash
    } Catch {
      Break
    }
  }
  
}

#-----------------------------------------------------------[Execution]------------------------------------------------------------
# WIN gpg sock details
$GpgSockPort = $(Get-Content -Head 1 "$GpgSock")
$GpgExtraSockPort = $(Get-Content -Head 1 "$GpgExtraSock")

# Setup Nonce
bash -l -c "tail -n+2 `"$WinGpgSockOnWsl`" > `"$GpgNonce`""
bash -l -c "tail -n+2 `"$WinGpgExtraSockOnWsl`" > `"$GpgExtraNonce`""

$global:WslGpgSockExists = 0
$global:WslGpgExtraSockExists = 0
bash -c "ps -C socat -o args=" |
  ForEach-Object {
  $BashProcessFullCmdline = "$_"
  if (("$BashProcessFullCmdline" -match "$WslGpgSock") -and ("$BashProcessFullCmdline" -match "$GpgSockPort")) {
    $global:WslGpgSockExists = 1
  }
  if (("$BashProcessFullCmdline" -match "$WslGpgExtraSock") -and ("$BashProcessFullCmdline" -match "$GpgExtraSockPort")) {
    $global:WslGpgExtraSockExists = 1
  }
}

#Start Wsl Gpg Sock bridges
if ( "$global:WslGpgSockExists" -ne "1" ) {
  Write-Host "Starting Win Gpg Sock Bridge..."
  Start-GpgTcpSockBridge -WslSock "$WslGpgSock" -SockPort $GpgSockPort -SockNonce "$GpgNonce"
}
if ( "$global:WslGpgExtraSockExists" -ne "1" ) {
  Write-Host "Starting Win Gpg Extra Sock Bridge..."
  Start-GpgTcpSockBridge -WslSock "$WslGpgExtraSock" -SockPort $GpgExtraSockPort -SockNonce "$GpgExtraNonce"
}