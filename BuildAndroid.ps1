$gameSource = "D:\Documents\Programming\Lua\Games\Numbergame\*"
$loveAndroidPath = "C:\Dev\love-android"

Function Remove-GameFile {
    param ($Path)
    if (Test-Path -Path $Path -PathType Leaf) {
        Remove-Item $Path
    }
}

Remove-GameFile "$loveAndroidPath\app\src\main\assets\game.love"
Remove-GameFile "$loveAndroidPath\app\build\outputs\apk\embed\debug\app-embed-debug.apk"
Remove-GameFile "$loveAndroidPath\app\build\outputs\apk\embed\release\app-embed-release-unsigned.apk"

Compress-Archive -Path $gameSource -DestinationPath "$loveAndroidPath\app\src\main\assets\game.zip"
Rename-Item -Path "$loveAndroidPath\app\src\main\assets\game.zip" -NewName "game.love"
Set-Location -Path $loveAndroidPath
./gradlew assembleEmbed