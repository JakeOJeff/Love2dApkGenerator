$gameSource = "D:\Documents\Programming\Lua\Test\main2\"
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
7z a "$loveAndroidPath\app\src\main\assets\game.love" $gameSource/*
Set-Location -Path $loveAndroidPath
./gradlew assembleEmbed