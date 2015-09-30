$global:admin = "$"
$currentUser = [system.security.principal.windowsidentity]::GetCurrent()
$principal = new-object System.Security.Principal.WindowsPrincipal($currentUser)
if($principal.IsInRole("Administrators"))
{
  $admin = "#"
}

[system.consolecolor]$global:OldColor = "White"

function prompt
{
  $random = new-object random
  $color = [system.consolecolor]$random.next(10, 16)
  
  while($global:oldColor -eq $color)
  {
    $color = [system.consolecolor]$random.next(10, 16)
  }

  $global:oldColor = $color

  $host.ui.rawui.windowtitle = "$($global:admin) $(Get-Location)" 
  $d = (Get-Date).ToString("MM/dd hh:mm:ss")
  write-host "$d$admin" -nonewline -foregroundcolor $color
  " "
}