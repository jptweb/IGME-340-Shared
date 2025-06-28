# Setting up Flutter Environment

Before you can do any development with Flutter there are a few things you need to do. The steps are similar for both OSX and Windows, and is essentially:

1. Download Flutter and put the files someplace on your drive.
1. Download and install Android Studio.
1. Download and install Visual Studio Code.
1. On OSX, install Xcode.

Follow this guide based on your platform of choice.

## Windows

### Flutter
Download Link: [https://docs.flutter.dev/get-started/install/windows/desktop?tab=download](https://docs.flutter.dev/get-started/install/windows/desktop?tab=download)

1. Download the latest version and unzip the contents of the folder to someplace on your hard drive, ex: C:\flutter. 
    * NOTE: The zip file already contains a "flutter" folder, so you can just extract the entire contents fo the zip file to your drive.

1. Update your Windows PATH variable
    1. Press the `Windows` key
    1. Start typing environment and look for `Edit the system environment variables` and open it.
    1. Click the `Environment Variables` button.
    1. In the top `User variables for <username>` section, double click the `Path` entry.
    1. Click `New` and enter `<install directory>\flutter\bin`.
    1. Click `OK` and close out of the Window.
    

### Android Studio
Download Link: [https://developer.android.com/studio](https://developer.android.com/studio)

1. Install Android Studio.
1. Once installed, run Android Studio and on the start screen, click the `More Actions` and choose `SDK Manager`. 
1. In the `Settings` screen, under the `Appearance & Behavior > System Settings > Android SDK` section.
    1. Click the `SDK Tools` tab.
        1. Check `Android SDK Command-line Tools (latest)`.
        1. Click `Apply`.
1. Exit Android Studio

### Test the Environment
Now you need to test our setup to ensure we have everything needed to start developing Flutter apps.

1. Open a `Command Prompt` window; Click the `Windows` Key and type `cmd`.
1. Enter the command `flutter doctor`.
1. Note any issues and determine if they need addressing.
    * NOTE: usual first time installation warnings are license acceptance or missing C++ components for Desktop development. 
1. If you are prompted for licenses, you can run the following command:
    
    `futter doctor –android-licenses`

    Answer `Yes` to accept all the licenses.

1. If you want to deploy to Windows desktop, you will need to install Visual Studio 2022.

### Visual Studio Code

Download Link: [https://code.visualstudio.com/Download](https://code.visualstudio.com/Download)

Lastly, we need to setup Visual Studio Code as our IDE.

1. Install the IDE with options to add context menu options so we can `Open with` options (which are optional).
1. Once installed, run `VSCode` and go to the `Extensions` and install the following extensions:
    1. Flutter (this also installs the Dart extension).
    1. Material Icon Theme.


## OSX

# macOS Flutter Setup Instructions

## Overview
This guide complements the [official Flutter macOS installation documentation](https://docs.flutter.dev/get-started/install/macos/mobile-ios) with additional context and tips for IGME-340 students.

## Prerequisites
- macOS 10.15 (Catalina) or later
- At least 2.8 GB of free disk space (more recommended)
- Git (comes pre-installed on macOS)
- Xcode (for iOS development)

## Installation Method: VS Code Extension (Recommended)

The Flutter team now recommends installing Flutter through VS Code, which simplifies the setup process significantly.

### Step 1: Install VS Code
1. Download [Visual Studio Code](https://code.visualstudio.com/) if you don't already have it
2. Install VS Code by dragging it to your Applications folder

### Step 2: Install Flutter via VS Code
1. Open VS Code
2. Open the Command Palette (`Cmd + Shift + P`)
3. Type "Flutter: New Project"
4. VS Code will prompt you to install the Flutter SDK if it's not already installed
5. Follow the prompts to download and install Flutter automatically

### Step 3: Install Xcode (for iOS Development)
1. Install Xcode from the [Mac App Store](https://apps.apple.com/us/app/xcode/id497799835)
2. This is a large download (several GB) so plan accordingly
3. Once installed, open Xcode at least once to accept the license agreements
4. Install additional components when prompted

### Step 4: Configure iOS Development Tools
After Xcode is installed, run these commands in Terminal:

```bash
# Install Xcode command line tools
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch

# Install CocoaPods (iOS dependency manager)
sudo gem install cocoapods
```

### Step 5: Verify Your Installation
Run this command in Terminal to check your Flutter setup:

```bash
flutter doctor
```

You should see checkmarks for:
- Flutter
- Android toolchain (if you've set up Android Studio)
- Xcode
- VS Code

## Common Issues and Solutions

### Issue: "flutter" command not found
If the `flutter` command isn't recognized after VS Code installation:

1. Find where VS Code installed Flutter (usually in `~/development/flutter`)
2. Add Flutter to your PATH by adding this to your `~/.zshrc` file:
   ```bash
   export PATH="$PATH:$HOME/development/flutter/bin"
   ```
3. Reload your terminal or run `source ~/.zshrc`

### Issue: CocoaPods installation fails
If you get permission errors installing CocoaPods:
```bash
# Use homebrew instead
brew install cocoapods
```

### Issue: iOS Simulator won't start
1. Open Xcode
2. Go to Xcode → Preferences → Locations
3. Make sure a Command Line Tools version is selected

## Testing Your Setup

### Create a Test Project
1. In VS Code, open Command Palette (`Cmd + Shift + P`)
2. Run "Flutter: New Project"
3. Choose "Application"
4. Name it "test_app"
5. Select a folder to create it in

### Run on iOS Simulator
1. Open the iOS Simulator: `open -a Simulator`
2. In VS Code, press `F5` or click Run → Start Debugging
3. Your app should launch in the iOS Simulator

### Run on Physical iPhone (Optional)
1. Connect your iPhone via USB
2. Trust the computer on your iPhone when prompted
3. In VS Code, select your iPhone from the device selector in the bottom bar
4. Press `F5` to run

## Next Steps
- Complete the [Flutter codelab](https://docs.flutter.dev/get-started/codelab)
- Set up [Android Studio](https://developer.android.com/studio) if you want to develop for Android
- Review the [Dart language tour](https://dart.dev/guides/language/language-tour)

## Helpful Resources
- [Official Flutter macOS Install Guide](https://docs.flutter.dev/get-started/install/macos/mobile-ios)
- [Flutter Doctor Troubleshooting](https://docs.flutter.dev/get-started/install/macos/mobile-ios#troubleshooting)
- [VS Code Flutter Extension Documentation](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)

## Getting Help
If you encounter issues:
1. Run `flutter doctor -v` for detailed diagnostic information
2. Check the error messages carefully - they often include the solution
3. Search for the specific error message online
4. Ask in class or during office hours with your `flutter doctor` output ready
