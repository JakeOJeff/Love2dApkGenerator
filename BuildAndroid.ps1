$file = "C:\Dev\love-android\app\src\main\assets\game.love"
$file2 = "C:\Dev\love-android\app\build\outputs\apk\embed\debug\app-embed-debug.apk"
$file3 = "C:\Dev\love-android\app\build\outputs\apk\embed\release\app-embed-release-unsigned.apk"
$gameSource = "D:\Documents\Programming\Lua\Games\Numbergame\*"
$assetsPath = "C:\Dev\love-android\app\src\main\assets\game.zip"
$loveAndroidPath = "C:\Dev\love-android"

if (-not(Test-Path -Path $file -PathType Leaf)) {
     try {
      Remove-Item $file2
      Remove-Item $file3
      Compress-Archive -Path $gameSource -DestinationPath $assetsPath
      Rename-Item -Path $assetsPath -NewName "game.love"
      Set-Location -Path $loveAndroidPath
      ./gradlew assembleEmbed
     }
     catch {
         throw $_.Exception.Message
     }
 }
 else {
   Remove-Item $file
   Remove-Item $file2
   Remove-Item $file3
   Compress-Archive -Path $gameSource -DestinationPath $assetsPath
   Rename-Item -Path $assetsPath -NewName "game.love"
   Set-Location -Path $loveAndroidPath
   ./gradlew assembleEmbed
 }
