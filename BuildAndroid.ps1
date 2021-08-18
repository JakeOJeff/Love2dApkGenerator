$gameSource = "D:\Documents\Programming\Lua\Games\Numbergame\*"
$loveAndroidPath = "C:\Dev\love-android"

 if (Test-Path -Path "$loveAndroidPath\app\src\main\assets\game.love" -PathType Leaf) {
   try {
    Remove-Item "$loveAndroidPath\app\src\main\assets\game.love"
   }
   catch {
    throw $_.Exception.Message
  }
}

 if (Test-Path -Path "$loveAndroidPath\app\build\outputs\apk\embed\debug\app-embed-debug.apk" -PathType Leaf) {
   try {
    Remove-Item "$loveAndroidPath\app\build\outputs\apk\embed\debug\app-embed-debug.apk"
   }
   catch {
    throw $_.Exception.Message
  }
}

 if (Test-Path -Path "$loveAndroidPath\app\build\outputs\apk\embed\release\app-embed-release-unsigned.apk" -PathType Leaf) {
   try {
    Remove-Item "$loveAndroidPath\app\build\outputs\apk\embed\release\app-embed-release-unsigned.apk"
   }
   catch {
    throw $_.Exception.Message
  }
}

Compress-Archive -Path $gameSource -DestinationPath "$loveAndroidPath\app\src\main\assets\game.zip"
Rename-Item -Path "$loveAndroidPath\app\src\main\assets\game.zip" -NewName "game.love"
Set-Location -Path $loveAndroidPath
./gradlew assembleEmbed