# Love2dExeGenerator

This Powershell program will automate some manual steps needed for APK generation on Windows.
You need to have https://github.com/love2d/love-android setup for this to work.

# To run
Right click the file and chose run with Powershell

# What it does when run
- It will check if there is a app-normal-debug.apk if that's the case it will remove it.
- It will compress your game in a zipfile.
- It will rename the zip to game.love.
- It will run the build command `./gradlew assembleNormal` for building an APK file.

# What you need to configure/change
1) Make sure your folder point to where you installed https://github.com/love2d/love-android for `$file`, `$file2`, `$assetsPath` and `$loveAndroidPath`
2) Change $gameSource to where your game is located (for example `"D:\Documents\Programming\Lua\Games\Numbergame\*"`).
3) `$path3 = "D:\Documents\Programming\Lua\Games\Numbergame\*"` <-- change this to where your game (main.lua) is located.

I'm not a Powerhsell expert so feel free to add to this.
