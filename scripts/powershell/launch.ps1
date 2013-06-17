
# give the server 1 second to start before trying to open the URL
Start-Process "powershell" -NoNewWindow -ArgumentList "-Command `"& {start-sleep 1; Start-Process 'http://localhost:8888/'}`""

$wikiDir = Resolve-Path (Join-Path (Split-Path -Parent $MyInvocation.MyCommand.Definition) "/../../..")

Set-Location $wikiDir
& $wikiDir/tools/minihttp/win/MiniHttp.exe --root=$wikiDir
