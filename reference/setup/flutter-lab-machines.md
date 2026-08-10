# Flutter Installation on RIT Lab Machines

This guide covers installing Flutter on the lab machines in Golisano (GOL 2435, 2570, 2445, and similar). These instructions are specific to the RIT lab environment.

## Video Walkthrough

**Prefer video?** Watch the full installation walkthrough:
[Flutter/Android Studio Installation Video](https://rit.zoom.us/rec/share/2tWwgzLXa6K0GoC5oepJK7WMSTiAtcFA2GsZn7KDwBfft24cv97DAjQBksONHCRg.RtLP4wUAPsH02U7u) (~40 minutes)

---

## Quick Reference

| What | Where |
|------|-------|
| Install Flutter SDK | `D:\Profiles\YOUR_USERNAME\flutter` |
| Create projects | `D:\Profiles\YOUR_USERNAME\flutter_apps\` |
| Check setup | `Ctrl+Shift+P` → "Flutter: Run Flutter Doctor" |
| Time to set up Chrome | ~5 minutes |
| Time to set up Android | ~15-20 minutes additional |

---

## Why the D:\ Drive Matters

Lab machines use **Deep Freeze** - most of C:\ gets wiped when you log out. However, your profile folder at `D:\Profiles\YOUR_USERNAME\` **persists all semester**.

This means:
- Install Flutter to D:\Profiles, NOT C:\
- Create your projects in D:\Profiles, NOT OneDrive
- Once set up, it should work every time you return to the same machine

**Sit at the same lab machine each week!** Your setup will be waiting for you.

---

## Part 1: Basic Flutter Setup (Chrome Target)

This gets you coding in about 5 minutes. Perfect for following along in class.

### Step 1: Check the Flutter Extension

1. Open **VS Code**
2. Click the **Extensions** icon in the left sidebar (or `Ctrl+Shift+X`)
3. Search for **"Flutter"**
4. The official Flutter extension by Dart Code may already be installed
5. If not, install it (this also installs the Dart extension)

### Step 2: Download the Flutter SDK

1. Open the Command Palette: `Ctrl+Shift+P`
2. Type **"Flutter: Run Flutter Doctor"** or **"Flutter: New Project"**
3. VS Code will notice you don't have the SDK and show a dialog
4. If you see "Locate SDK" and "Download SDK":
   - Choose **"Download SDK"** (first time only)

### Step 3: Choose the Install Location (CRITICAL!)

When the folder picker opens:

1. **Do NOT use the default location** (it's probably OneDrive)
2. Navigate to: **This PC → D:\**
3. Click into **Profiles**
4. Find and click into **YOUR_USERNAME** folder
5. Click **"Clone Flutter"** at this level

The SDK will be installed to `D:\Profiles\YOUR_USERNAME\flutter\`

**Why not OneDrive?** OneDrive paths often contain spaces (like "John Smith") which breaks Flutter.

### Step 4: Add SDK to PATH

After the download completes (a few minutes), you may see a popup asking to add the SDK to PATH.

- Click **"Add SDK to PATH"** if you see it
- This lets you run `flutter` commands in any terminal

### Step 5: Locate the SDK (If Prompted Again)

VS Code sometimes forgets where the SDK is. If you see "Locate SDK":

1. Click **"Locate SDK"**
2. Navigate to: `D:\Profiles\YOUR_USERNAME\flutter`
3. Select the **flutter** folder itself (not a subfolder)
4. Click **"Set Flutter SDK folder"**

### Step 6: Verify with Flutter Doctor

1. Open Command Palette: `Ctrl+Shift+P`
2. Type **"Flutter: Run Flutter Doctor"**
3. Check the output panel

You should see:
- **Flutter** - green checkmark
- **Windows** - green checkmark
- **Chrome** - green checkmark
- **Android toolchain** - may show issues (we'll fix this in Part 2)

**At this point, you can build to Chrome!** That's enough for the first few weeks.

### Step 7: Create Your First Project

1. Open Command Palette: `Ctrl+Shift+P`
2. Type **"Flutter: New Project"**
3. Select **"Application"** (the full counter app, not empty)
4. When the folder picker opens:
   - Navigate to `D:\Profiles\YOUR_USERNAME\`
   - Create a new folder called `flutter_apps` (right-click → New Folder)
   - Go into that folder
   - Click **"Select Folder to create project in"**
5. Enter a project name (e.g., `hello_world`)
   - Use lowercase with underscores
   - **No spaces!**
6. Click **"Trust the Authors"** when prompted

### Step 8: Run on Chrome

1. Open `lib/main.dart` in your new project
2. Look at the bottom-right corner of VS Code - you'll see device options
3. Click where it says "No device" or the current device name
4. Select **"Chrome (web-javascript)"**
5. Click the **dropdown arrow** next to the play button → **"Start Debugging"**
   - Or press **F5**
6. Wait for the build (first time takes a minute or two)
7. Chrome opens with your app running!

**You're done with basic setup!** The counter app should appear and work.

---

## Part 2: Android Studio Setup (Full Mobile Development)

This takes an additional 15-20 minutes but gives you the full Android emulator.

### Step 1: Open Android Studio

1. Search for "Android Studio" in the Windows Start menu
2. Launch it (first launch may take a moment)
3. You may see privacy/analytics prompts - choose your preference
4. If a **Setup Wizard** appears, continue to Step 2
5. If you see the Welcome screen, skip to "If You Don't See the Wizard"

### Step 2: Run the Setup Wizard

1. Click **Next** on the welcome screen
2. Select **Custom** installation (gives more control)
3. Ensure these are checked:
   - Android SDK
   - Android SDK Platform
   - Android Virtual Device
4. Click **Next** through the screens
5. **Accept** all license agreements
6. Click **Finish** and wait for downloads to complete

This installs the core Android development tools.

### Step 3: Install Android Command Line Tools

This is commonly missed and causes Flutter Doctor errors.

1. From the Android Studio Welcome screen, click **More Actions** (or **Configure**)
2. Select **SDK Manager**
3. Click the **SDK Tools** tab (not SDK Platforms)
4. Check the box for **"Android SDK Command-line Tools (latest)"**
5. Click **OK** and confirm the installation
6. Wait for the download to complete

### Step 4: Accept Android Licenses

Open a terminal in VS Code and run:

```bash
flutter doctor --android-licenses
```

Type `y` and press Enter for each license prompt (there are several).

### Step 5: Verify with Flutter Doctor

Run Flutter Doctor again:

1. `Ctrl+Shift+P` → "Flutter: Run Flutter Doctor"
2. Or in terminal: `flutter doctor`

You should now see green checkmarks for:
- Flutter
- Windows Version
- Android toolchain
- Chrome
- VS Code

### Step 6: Create an Android Virtual Device (Emulator)

1. In Android Studio, click **More Actions** → **Virtual Device Manager**
2. You may already have a "Medium Phone" device - that's fine!
3. To create a new one:
   - Click **Create Virtual Device**
   - Select a phone (e.g., Pixel 7)
   - Select a system image (latest stable Android)
   - Click **Finish**
4. Click the **Play button** next to your device to launch it

The first boot (cold boot) takes 30-60 seconds. Be patient!

### Step 7: Run Your App on Android

1. In VS Code, with `lib/main.dart` open
2. Click the device selector at the bottom (currently shows "Chrome")
3. Select your Android emulator (e.g., "Medium Phone API 34")
4. Wait for the emulator to start (if not already running)
5. Click the dropdown → **"Start Debugging"** (or F5)

The first Android build takes several minutes - you'll see Gradle downloading dependencies. This is normal and only happens once.

**Subsequent builds are much faster!** (~30 seconds)

---

## Important Rules

### Path Requirements (No Spaces!)

Flutter breaks with spaces in paths. This applies to:
- Where you install the SDK
- Where you create projects

**Bad paths:**
```
C:\Users\John Smith\flutter           ❌
D:\Profiles\John Smith\flutter        ❌
OneDrive - RIT\flutter                ❌
D:\My Projects\app                    ❌
```

**Good paths:**
```
D:\Profiles\jxt1234\flutter           ✓
D:\Profiles\jxt1234\flutter_apps\     ✓
C:\dev\flutter                        ✓
```

### Where to Save Projects

Always save Flutter projects to `D:\Profiles\YOUR_USERNAME\` on lab machines:
- NOT to OneDrive (spaces in path)
- NOT to Desktop on C:\ (gets wiped)
- NOT to Downloads (gets wiped)

### Chrome vs Android

| Scenario | Use |
|----------|-----|
| Quick testing, following along in class | Chrome |
| Final testing before submission | Android |
| First few weeks of class | Chrome is fine |
| Later projects, especially games | Android required |

---

## Returning to the Lab

When you come back to the same lab machine:

1. Open VS Code
2. Your recent project should appear, or open it manually from D:\Profiles
3. Run Flutter Doctor to verify: `Ctrl+Shift+P` → "Flutter: Run Flutter Doctor"
4. If it can't find the SDK, locate it again at `D:\Profiles\YOUR_USERNAME\flutter`

**Tip:** Sit at the same machine every week. Your setup persists!

---

## Common Issues & Solutions

### "Flutter SDK not found"

**Solution:** Locate the SDK manually
1. `Ctrl+Shift+P` → "Flutter: Change SDK"
2. Navigate to `D:\Profiles\YOUR_USERNAME\flutter`
3. Select the folder

### "Android toolchain - some licenses not accepted"

**Solution:** Run this in VS Code terminal:
```bash
flutter doctor --android-licenses
```
Type `y` for each prompt.

### "cmdline-tools component is missing"

**Solution:** Install command line tools in Android Studio
1. Open Android Studio
2. More Actions → SDK Manager → SDK Tools tab
3. Check "Android SDK Command-line Tools (latest)"
4. Click OK

### Emulator not showing in VS Code

**Solution:**
1. Restart VS Code
2. Run Flutter Doctor
3. Make sure the emulator is actually running in Android Studio

### Build takes forever / stuck at percentage

**Solution:** This is normal for first builds. The progress indicator isn't always accurate. Wait it out - it will complete.

### "Unable to locate a development device"

**Solution:**
1. Check device selector at bottom-right of VS Code
2. Make sure Chrome or an emulator is selected
3. If using Android, make sure emulator is running

### Path has spaces (Flutter commands fail)

**Solution:** Reinstall to a path without spaces
- Use `D:\Profiles\YOUR_USERNAME\flutter` (your username shouldn't have spaces)
- Or use `C:\flutter` if your username has spaces

---

## Time Estimates

| Task | Time |
|------|------|
| Flutter SDK download | 3-5 minutes |
| First Chrome build | 1-2 minutes |
| Subsequent Chrome builds | ~5 seconds (hot reload) |
| Android Studio wizard | 5-10 minutes |
| First Android build | 5-10 minutes |
| Subsequent Android builds | 30-60 seconds |
| Cold boot emulator | 30-60 seconds |
| Warm boot emulator | 10-15 seconds |

---

## When Covered in Course

- **[Week 1B](../../weekly/1B.md)** - In-class setup walkthrough
- **[Lab 00](../../labs/lab-00-environment-setup.md)** - Personal machine setup (separate assignment)

---

## External Resources

- [Flutter Install with VS Code](https://docs.flutter.dev/install/with-vs-code) - Official guide
- [Android Setup for Flutter](https://docs.flutter.dev/platform-integration/android/setup) - Official Android guide
- [Flutter Doctor Documentation](https://docs.flutter.dev/get-started/install/windows#run-flutter-doctor) - Understanding Flutter Doctor output

---

*Last updated: January 2026 | IGME-340 Reference*
