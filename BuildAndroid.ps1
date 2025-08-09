$gameSource = "D:\Documents\Programming\Lua\Dev\Teleprompter\"
$loveAndroidPath = "C:\Dev\love-android"
$buildType = "Debug"
$7zip = "C:\Program Files\7-Zip\7z.exe" # Path to 7z ( safer )

#embed record build
Remove-Item -Path "$loveAndroidPath\app\src\main\assets\game.love" -ErrorAction SilentlyContinue
Remove-Item -Path "$loveAndroidPath\app\build\outputs\apk\embed\debug\app-embed-record-$($buildType.ToLower()).apk"

& $7zip a "$loveAndroidPath\app\src\main\assets\game.love" $gameSource/*
Set-Location -Path $loveAndroidPath
./gradlew assembleEmbedRecord$buildType