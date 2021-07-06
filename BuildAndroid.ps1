$file = "C:\Dev\love-android\app\src\main\assets\game.love"
$file2 = "C:\Dev\love-android\app\build\outputs\apk\normal\debug\app-normal-debug.apk"
if (-not(Test-Path -Path $file -PathType Leaf)) {
     try {
      Remove-Item $file2
      Compress-Archive -Path D:\Documents\Programming\Lua\Games\Numbergame\* -DestinationPath C:\Dev\love-android\app\src\main\assets\game.zip
      Rename-Item -Path "C:\Dev\love-android\app\src\main\assets\game.zip" -NewName "game.love"
      Set-Location -Path "C:\Dev\love-android"
      ./gradlew assembleNormal
     }
     catch {
         throw $_.Exception.Message
     }
 }
 else {
   Remove-Item $file
   Remove-Item $file2
   Compress-Archive -Path D:\Documents\Programming\Lua\Games\Numbergame\* -DestinationPath C:\Dev\love-android\app\src\main\assets\game.zip
   Rename-Item -Path "C:\Dev\love-android\app\src\main\assets\game.zip" -NewName "game.love"
   Set-Location -Path "C:\Dev\love-android"
   ./gradlew assembleNormal
 }