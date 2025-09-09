# IGME-340 Project & Homework Submission Guide

## Quick Reference Checklist

Before submitting ANY Flutter project or homework:

- [ ] Run `flutter clean` in your project terminal
- [ ] Verify project size is under 20MB (should be ~1-2MB after cleaning)
- [ ] Create a folder with your name and put your project inside
- [ ] Zip the folder (not just the project files)
- [ ] Submit to MyCourses assignment dropbox

## Detailed Submission Process

### Step 1: Clean Your Project
**⚠️ CRITICAL:** Always run this command before zipping your project:

```bash
flutter clean
```

**Why this matters:**
- Flutter builds create 450+ MB of temporary files
- MyCourses has file size limits
- Clean projects upload faster and are easier to grade
- After cleaning, your project should be under 10MB (usually 1-2MB)

### Step 2: Verify Your Project Structure

After running `flutter clean`, your project should contain:
- `lib/` folder (your Dart code)
- `pubspec.yaml` file
- `android/`, `ios/`, `web/` folders (platform configs)
- `README.md`
- **NO** `build/` folder (this gets removed by `flutter clean`)

### Step 3: Create Named Submission Folder

**Create a folder structure like this:**
```
LastName_FirstName_AssignmentName/
    └── your_flutter_project/
        ├── lib/
        ├── pubspec.yaml
        ├── android/
        └── ...
```

**Example:**
```
Smith_John_HW1/
    └── my_awesome_app/
        ├── lib/
        ├── pubspec.yaml
        └── ...
```

### Step 4: Zip and Submit

1. Right-click on your named folder (e.g., `Smith_John_HW1`)
2. Choose "Compress" (Mac) or "Send to > Compressed folder" (Windows)
3. Upload the resulting `.zip` file to the MyCourses assignment dropbox

## Important Notes

### File Size Guidelines
- **After `flutter clean`:** Project should be 1-10MB
- **Before `flutter clean`:** Project may be 450+ MB (too large!)
- **If still too large:** Check for extra files, images, or assets

### Common Submission Mistakes to Avoid

❌ **DON'T:**
- Submit without running `flutter clean`
- Put spaces or special characters in folder names
- Submit individual files instead of the complete project
- Forget to include your name in the folder structure
- Submit from cloud drives or network locations

✅ **DO:**
- Always run `flutter clean` first
- Use underscores instead of spaces in names
- Submit the complete project folder
- Include your name clearly in the submission
- Submit from local storage (C:\ or ~/Documents)

### Platform-Specific Notes

**Windows Users:**
```cmd
cd path\to\your\project
flutter clean
```

**Mac/Linux Users:**
```bash
cd path/to/your/project
flutter clean
```

## Troubleshooting

### "Project Too Large" Error
1. Ensure you ran `flutter clean`
2. Check for unnecessary asset files
3. Remove any additional test projects from the folder

### "Project Won't Run After Submission"
The grader will run:
```bash
flutter pub get
flutter run
```
This rebuilds the project and restores dependencies.

### Missing Files Error
Make sure you're submitting the **entire project folder**, not just the `lib` directory.

## Assignment-Specific Requirements

### Dart Exercises (Homework 1-5)
- Create individual `.dart` files as requested
- Place all files in a single project's `lib` folder
- Name files clearly (e.g., `basics01.dart`, `basics02.dart`)

### Flutter Projects
- Submit complete Flutter app project
- Ensure app runs without errors
- Include any required assets in proper folders

### Lab Assignments
- Follow specific lab instructions for file organization
- Always include screenshots if requested
- Submit source code AND documentation as specified

## Getting Help

If you're having trouble with submissions:

1. **First:** Check this guide thoroughly
2. **Second:** Ask on Slack in the #general channel and/or DM me in Slack (asking in general can sometimes help others with similar questions).
4. **Last Resort:** Email me directly with:
   - Description of the problem
   - Screenshots of error messages
   - Your exact folder structure

## Quick Tips for Success

- **Start early** - Don't wait until the last minute
- **Test your submission** - Try opening your zipped project on another computer
- **Keep backups** - Always keep a copy of your work
- **Read assignment requirements** - Some assignments have special submission needs

---

**Remember:** Following these guidelines ensures your work can be graded properly and helps you avoid late penalties due to submission issues.

*Questions? Message me on Slack or during office hours.*
