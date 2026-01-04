# Lab 00: Flutter Development Environment Setup

## Overview

This is the most important assignment of the semester! Without a working development environment, you cannot complete any of the coursework. Setup can be challenging, so we've given you the weekend plus Monday. Document your process - even failures are valuable learning experiences!

## Learning Objectives

- Install and configure Flutter development environment
- Verify your setup with Flutter Doctor
- Practice following technical documentation
- Prepare for Week 2 when we'll create our first Flutter apps

## Why Official Documentation?

Rather than providing our own step-by-step instructions:

- **It's always current** - Flutter updates frequently; any instructions we write today may be outdated tomorrow
- **Real-world skill** - Following official documentation is a critical developer skill you'll use throughout your career
- **Platform differences** - Your setup varies significantly between Windows, Mac, Intel vs Apple Silicon, etc.
- **Problem-solving practice** - Debugging installation issues builds important troubleshooting skills

---

## Setup Instructions

### Step 1: Install Flutter

Follow the official guide for your operating system:

- **Windows:** https://docs.flutter.dev/get-started/install/windows
- **macOS:** https://docs.flutter.dev/get-started/install/macos
- **Linux:** https://docs.flutter.dev/get-started/install/linux

**Important:** Follow ALL steps including:

- Downloading Flutter SDK
- Updating your PATH
- Running `flutter doctor`
- Installing Android Studio (for Android SDK)
- Accepting Android licenses

### Step 2: Install VS Code

- Download VS Code: https://code.visualstudio.com/
- Install the Flutter extension from the Extensions marketplace
- The Flutter extension will also install the Dart extension automatically

### Step 3: Verify Installation

Open a terminal/command prompt and run:

```bash
flutter doctor
```

This command checks your environment and displays a report of the status of your Flutter installation.

**Goal:** Get check marks for:

- Flutter
- Android toolchain
- VS Code
- Connected device (or you'll use an emulator)

**Note:** You can ignore issues with:

- Chrome (we're focusing on mobile)
- Visual Studio (Windows desktop development)
- Xcode (unless you're on Mac and want iOS development)

### Step 4: While You Wait (Optional)

Flutter downloads can be large! While waiting or if you get stuck:

1. Visit DartPad: https://dartpad.dev
2. Try writing some Dart code
3. No submission needed - just explore!

---

## What to Submit

### Required Screenshot:

- **Flutter Doctor Output** - Terminal/command prompt showing your `flutter doctor` results

### Required Document:

Create **setup_notes.txt** containing:

1. Your operating system (e.g., Windows 11, macOS Sonoma 14.2, etc.)
2. Which IDE you installed (VS Code recommended)
3. Time spent on setup (approximately)
4. Any issues you encountered
5. How you resolved them (or what you're still stuck on)
6. Questions you have

---

## Grading: Effort-Based

### Full Credit:

- Submitted `flutter doctor` screenshot (even with errors!)
- Submitted setup_notes.txt with your experience
- Showed effort to follow the installation steps

**You get full credit even if Flutter isn't completely working yet!** The point is to attempt the setup and document where you're stuck so we can help.

### No Credit:

- No submission
- No evidence of attempting setup
- No documentation

---

## Common Issues & Tips

### Windows:

- Run command prompt as Administrator
- Make sure you have at least 10GB free space

### Mac:

- For Android development, you still need Android Studio
- Apple Silicon (M1/M2/M3) users may need Rosetta 2
- Run `sudo xcodebuild -license accept` if prompted
- Xcode is only needed if you want to test on iOS (not required for this class)

### All Platforms:

- Be patient - downloads can be 2-3GB
- Android Studio is needed for Android SDK (even if using VS Code)
- Accept Android licenses: `flutter doctor --android-licenses`

---

## Can't Get It Working?

**That's totally normal!** Environment setup is notoriously difficult. If you're stuck:

1. **Document everything** in your setup_notes.txt:
   - What step you're on
   - Exact error messages
   - What you've tried

2. **Submit what you have:**
   - Screenshot showing how far you got
   - Detailed notes about the issues

3. **Get help:**
   - Post in Slack
   - We'll have troubleshooting time in Week 2

---

## Submission Instructions

1. Take a screenshot of your `flutter doctor` output
2. Create your setup_notes.txt file
3. Create a folder named: `LastName_FirstName_Lab00`
4. Put both files in the folder
5. ZIP the folder
6. Submit via MyCourses (check MyCourses for due date)

---

## Important Notes

### Why Early Deadline?

- Week 2 we'll be creating Flutter projects in class
- You need a working environment to follow along
- This gives you time to troubleshoot
- Even if not 100% working, submit what you have so we know who needs help

### You Do NOT Need:

- Paid developer accounts ($99 Apple, $25 Google)
- A physical phone (we'll use emulators)
- To create a Flutter project yet (that's Week 2!)
- Perfect check marks on everything

### You DO Need:

- Flutter SDK installed and in your PATH
- VS Code with Flutter extension
- Android SDK (via Android Studio)
- To run `flutter doctor` at least once

---

## Getting Help

### Before Asking for Help:

1. Google the exact error message
2. Try the suggestion from `flutter doctor -v` (verbose mode)
3. Check if you need to restart after PATH changes
4. Make sure you accepted Android licenses

### When Asking for Help Include:

- Your OS and version
- Screenshot of the error
- What step you're stuck on
- What you've already tried

---

## Next Steps

Once your environment is set up, you'll be ready for Week 2 when we start building Flutter apps. The Dart exercises are separate and will help you learn the language fundamentals.

**Remember:** Every developer has struggled with environment setup. It's frustrating but normal! The troubleshooting skills you develop here will serve you throughout your career.
