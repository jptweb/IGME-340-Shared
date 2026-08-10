# Lab 00: Flutter Development Environment Setup

## Overview

Setting up Flutter is fiddly, and it goes wrong for a lot of people the first time. That's expected, so this lab is graded on **documenting your process**, not on having a flawless setup by the deadline.

**What that means practically:** get as far as you can, write down where you got stuck, and submit that. A detailed "here's the error I hit and what I tried" is a full-credit submission. Even failures are useful, both to you and to me.

**You are not blocked in the meantime.** Weeks 1A and 1B need nothing installed at all (DartPad runs in a browser), and from Week 2A onward you can target Chrome instead of an Android emulator if the emulator is fighting you. So take the time you need, and tell me early if you're stuck rather than quietly falling behind.

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

## Video Walkthrough (Optional but Helpful)

If you'd like to see the VS Code install flow before tackling it yourself, watch the in-class walkthrough:

**[Flutter/Android Studio Installation Video](https://rit.zoom.us/rec/share/2tWwgzLXa6K0GoC5oepJK7WMSTiAtcFA2GsZn7KDwBfft24cv97DAjQBksONHCRg.RtLP4wUAPsH02U7u)** (~40 minutes)

> **Heads up:** This was recorded on the RIT lab machines (Windows, installing to `D:\Profiles\YOUR_USERNAME\`). On your personal machine the **VS Code flow is the same**, but pick your own no-spaces install path (e.g., `C:\dev\flutter` on Windows, `~/development/flutter` on Mac) instead of `D:\Profiles`.

---

## Setup Instructions

Flutter's documentation has evolved - there are now multiple paths to get set up. We recommend the **VS Code method** as it's the simplest.

### Option A: VS Code Method (Recommended)

VS Code can install the Flutter SDK for you automatically. **Follow the official guide** - it's always up to date:

**Official Guide:** https://docs.flutter.dev/install/with-vs-code

Here's the gist (but use the official guide for the full details):

1. Install VS Code: https://code.visualstudio.com/
2. Install the Flutter extension from the Extensions marketplace
3. Command Palette (`Ctrl/Cmd + Shift + P`) → "Flutter: New Project"
4. When prompted, select **"Download SDK"**
5. **CRITICAL: Choose a path with NO SPACES!** (see warning section below)
6. Click "Clone Flutter" → wait → click "Add SDK to PATH"
7. Restart VS Code

> **PATH Warning:** The "Add SDK to PATH" button works about 75% of the time. If it doesn't work for you, you'll need to manually add Flutter to your PATH - the official guide covers this.

**After Flutter SDK is installed, set up Android:**
- Guide: https://docs.flutter.dev/platform-integration/android/setup
- You need Android Studio for the Android SDK and emulator
- Run `flutter doctor --android-licenses` to accept licenses

### Option B: Manual Installation

If you prefer more control, you can install Flutter manually:
- https://docs.flutter.dev/install/manual

### Verify Your Installation

Test `flutter doctor` in **two places** - sometimes PATH works in one but not the other:

**1. Inside VS Code's terminal:**
- Open VS Code
- Terminal → New Terminal (or `` Ctrl/Cmd + ` ``)
- Run: `flutter doctor`

**2. In a regular terminal/command prompt:**
- Open Terminal (Mac) or Command Prompt/PowerShell (Windows) - NOT inside VS Code
- Run: `flutter doctor`

If it works in VS Code but not in the regular terminal, your PATH isn't set up system-wide. This is fixable but annoying - see the official docs on updating your PATH, or just use VS Code's terminal for now.

**Goal:** Get check marks for:

- Flutter
- Android toolchain (or at least Chrome for now)
- VS Code
- Connected device (or you'll use an emulator)

**You can ignore issues with:**

- Visual Studio (Windows desktop development)
- Xcode (unless you're on Mac and want iOS development)

### Chrome is Your Friend (Early On)

**Good news:** For the first few weeks, you can run Flutter apps in Chrome instead of the Android emulator:
- If Android is giving you trouble, you can still follow along in class
- Chrome runs faster on slower machines
- You can keep working while troubleshooting Android setup

**Web setup guide:** https://docs.flutter.dev/platform-integration/web/setup

**However:** You will eventually need to test on Android for projects. The sooner you get it working, the better. Worst case: develop with Chrome on your machine and come into the lab to test on Android before submitting.

---

## THE #1 SETUP KILLER: Spaces in Paths

**This causes more problems than anything else.** Flutter does NOT handle spaces in file paths well.

### Bad Paths (WILL cause problems):
```
C:\Users\John Smith\flutter          ❌ (space in username)
C:\Program Files\flutter             ❌ (space in "Program Files")
/Users/Jane Doe/Developer/flutter    ❌ (space in username)
```

### Good Paths:
```
C:\flutter                           ✓
C:\dev\flutter                       ✓
C:\Users\jsmith\flutter              ✓ (no space in short username)
/Users/jdoe/development/flutter      ✓
```

### If Your Username Has a Space:
- Install Flutter somewhere else like `C:\flutter` or `C:\dev\flutter`
- Do NOT install in your user folder if it has spaces
- This applies to Flutter SDK location AND your project folders

---

## Storage Requirements

**You need at least 20GB of free space** on your computer for Flutter development.

### Why So Much?
- Flutter SDK: ~2-3GB
- Android Studio + SDK: ~5-8GB
- A single Flutter project can grow to **4GB+** after building (before `flutter clean`)
- Multiple projects = storage adds up fast

### If You Have a Small Drive (e.g., 256GB MacBook)

Flutter will technically run, but you'll likely run out of space during the semester. **This is manageable if you plan ahead:**

1. Run `flutter clean` on projects you're not actively working on
2. Use the classroom lab machines for development
3. Delete old projects when you're done with them

### Virtual Machine Option (Emergency Backup)

If storage is a serious constraint, I can set you up on a virtual machine at **rles.rit.edu**:
- Has ample hard drive space
- Can run Flutter with Chrome target
- **Cannot run Android Studio** (too slow)
- You'd develop on the VM, then come to lab to test on Android before submitting

This is slow and not ideal - it's an emergency option, not a primary solution.

### The Important Part

**Let me know early if storage might be an issue.** In Fall, only 2 out of 30 students had this problem - it's not common, but it can really mess you up if you don't realize it until a deadline.

- **Tell me early** → I can help you plan, set up the VM, be flexible with extensions
- **Tell me the day before a project is due** → Not a valid reason for an extension at that point

You don't need to buy a new computer. You just need to plan around limited storage and use the lab when needed. But that requires knowing about it ahead of time!

### While You Wait (Optional)

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
   - We'll cover setup and troubleshooting in class 1B

---

## Lab Machine Option

**You can succeed in this class even if your personal machine can't run Android Studio!**

### The Classroom Lab Machines
- Our classroom (GOL 2435) has lab machines with Android Studio available
- Open lab hours are also available (check GCCIS website)
- We'll walk through setting up Flutter on lab machines in class 1B

### How Lab Machines Work
- Lab machines "reset" after you log out
- **BUT:** If we install Flutter in the correct location, it persists all semester
- We'll show you exactly where to install so your setup stays

### Your Options (Best to "Works")

| Scenario | What To Do |
|----------|------------|
| **Best:** Full setup on your machine | Develop anywhere, test on Android emulator |
| **Good:** Chrome-only on your machine | Develop at home, test on Android in lab periodically |
| **Works:** Lab machines only | Do your development work in the classroom/open lab |

**Either way:** Everyone should set up the lab machines in class 1B. It's good practice, and you'll have a backup if your personal machine has issues later.

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

- VS Code with Flutter extension installed
- Flutter SDK (VS Code can install this for you!)
- Android SDK via Android Studio (or at least Chrome working for now)
- To run `flutter doctor` at least once

---

## Getting Help

### This is YOUR Responsibility

**Environment setup is a critical job skill.** On co-ops and jobs, you'll need to set up development environments - often with less guidance than you're getting here. Use this as practice!

**That said, I'm here to help - but you must reach out:**
- Office hours are available (check syllabus)
- Post in Slack - I check it regularly
- I've had students not get this working until mid-semester and fail
- **If you don't ask for help, I can't help you**

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
