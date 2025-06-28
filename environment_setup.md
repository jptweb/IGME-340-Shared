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
