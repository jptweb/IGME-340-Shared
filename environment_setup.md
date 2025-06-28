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

### Step 1: Install Xcode
**Why first?** Xcode is large and takes time to install, so start here.

1. Open the **App Store** on your Mac
2. Search for **Xcode** and install it (this will take a while - it's several GB)
3. Once installed, open Xcode and accept the license agreement
4. Install additional components when prompted

### Step 2: Install Flutter
Download Link: [https://docs.flutter.dev/get-started/install/macos](https://docs.flutter.dev/get-started/install/macos)

1. Download the latest stable Flutter SDK for macOS
2. Extract the zip file to a location like `~/development/` (avoid paths with spaces)
   ```bash
   cd ~/development
   unzip ~/Downloads/flutter_macos_*-stable.zip
   ```
3. Add Flutter to your PATH by editing your shell profile:
   
   **For zsh (default on newer macOS):**
   ```bash
   echo 'export PATH="$PATH:$HOME/development/flutter/bin"' >> ~/.zshrc
   source ~/.zshrc
   ```
   
   **For bash:**
   ```bash
   echo 'export PATH="$PATH:$HOME/development/flutter/bin"' >> ~/.bash_profile
   source ~/.bash_profile
   ```

### Step 3: Install Android Studio
Download Link: [https://developer.android.com/studio](https://developer.android.com/studio)

1. Download and install Android Studio for Mac
2. Launch Android Studio and complete the setup wizard
3. On the welcome screen, click **More Actions** → **SDK Manager**
4. In the SDK Manager:
   - Go to the **SDK Tools** tab
   - Check **Android SDK Command-line Tools (latest)**
   - Check **Android SDK Build-Tools**
   - Click **Apply** to install

### Step 4: Install Visual Studio Code
Download Link: [https://code.visualstudio.com/](https://code.visualstudio.com/)

1. Download and install VS Code for Mac
2. Open VS Code and install the Flutter extension:
   - Open Extensions panel (Cmd+Shift+X)
   - Search for "Flutter" 
   - Install the official Flutter extension (this will also install the Dart extension)

### Step 5: Configure iOS Development
1. Install Xcode command line tools:
   ```bash
   sudo xcode-select --install
   ```
2. Accept the Xcode license:
   ```bash
   sudo xcodebuild -license accept
   ```
3. Install CocoaPods (iOS dependency manager):
   ```bash
   sudo gem install cocoapods
   ```

### Step 6: Test Your Environment
1. Open **Terminal** 
2. Run the Flutter doctor command:
   ```bash
   flutter doctor
   ```
3. Address any issues flagged by Flutter doctor:
   - **Android licenses**: Run `flutter doctor --android-licenses` and accept all
   - **iOS setup issues**: Usually resolved by running Xcode once and accepting licenses
   - **Missing dependencies**: Follow the specific instructions provided

### Step 7: Create and Test a Project
1. Create a new Flutter project:
   ```bash
   flutter create my_test_app
   cd my_test_app
   ```
2. Test on iOS Simulator:
   ```bash
   open -a Simulator
   flutter run
   ```
3. Test on Android Emulator:
   - Open Android Studio
   - Create/start an Android Virtual Device (AVD)
   - Run `flutter run` in your project directory

## Troubleshooting Common Issues

- **Xcode issues**: Make sure you've opened Xcode at least once and accepted all agreements
- **PATH issues**: Restart your terminal after modifying shell profiles
- **Android licenses**: Run `flutter doctor --android-licenses` if prompted
- **CocoaPods issues**: Try `sudo gem install cocoapods` if iOS builds fail

## Verification
Your setup is complete when `flutter doctor` shows green checkmarks for:
- ✓ Flutter (Channel stable)
- ✓ Android toolchain
- ✓ Xcode - develop for iOS and macOS
- ✓ VS Code

**Success!** You now have a complete Flutter development environment capable of building for both iOS and Android platforms.
 
