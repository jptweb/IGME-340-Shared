# VS Code & Flutter Workflow Reference

Everything you need for working efficiently in VS Code with Flutter — shortcuts, formatting, debugging, and project cleanup. This is the "how do I work with Flutter day-to-day" page.

## VS Code Shortcuts

### Quick Actions Menu (Cmd/Ctrl + .)

Click on any widget name, then press `Cmd/Ctrl + .` to access:
- **Wrap with widget...** - Surround with a new parent widget
- **Remove this widget** - Delete widget, keep children
- **Extract Widget** - Create a new widget class
- **Extract Method** - Create a function returning the widget

### Widget Snippets

Type these abbreviations and press Tab:

| Snippet | Creates |
|---------|---------|
| `stless` | StatelessWidget template |
| `stful` | StatefulWidget template |

### Essential Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Cmd/Ctrl + .` | Quick actions menu (wrap, extract, remove widget) |
| `Alt/Option + Shift + F` | Auto-format code |
| `Cmd/Ctrl + Space` | Show available properties/autocomplete |
| `F2` | Rename symbol everywhere |
| `Cmd/Ctrl + Shift + R` | Refactor menu |
| `F5` | Start debugging / Continue |
| `Cmd/Ctrl + Shift + F5` | Hot Restart (full rebuild) |
| `Cmd/Ctrl + F5` | Run without debugging |

---

## Trailing Commas & Auto-Formatting

### The Trailing Comma Trick

**Always add a trailing comma** after the last parameter in a widget. This is what tells the formatter to put each parameter on its own line:

```dart
// Without trailing comma - stays on one line (hard to read)
Container(color: Colors.red, height: 100, width: 100)

// With trailing comma - formats with one parameter per line
Container(
  color: Colors.red,
  height: 100,
  width: 100,  // <-- trailing comma here
)
```

Press `Alt/Option + Shift + F` to auto-format after adding commas.

### Fixing the Formatter (Dart 3.8+)

Recent versions of Dart changed the formatter so it decides line breaks for you — it may collapse your parameters back onto one line even with trailing commas.

**The fix:** Add this to your project's `analysis_options.yaml` (in the root of your Flutter project, same level as `pubspec.yaml`):

```yaml
formatter:
  trailing_commas: preserve
```

This goes at the **root level** of the file (not indented under anything). If your `analysis_options.yaml` already has content, just add these two lines at the top or bottom.

**Before the fix:** Formatter ignores your commas and puts short parameter lists on one line.

**After the fix:** Trailing comma = each parameter on its own line. You control the formatting.

Do this for every new project. It takes 5 seconds and saves hours of frustration.

---

## Debugging

### Setting Breakpoints

1. Click in the **gutter** (left of line numbers) — a red dot appears
2. Run in debug mode (`F5`)
3. App pauses when execution hits the breakpoint
4. Use the debug panel to:
   - **Step Over** — execute current line, move to next
   - **Step Into** — go inside a function call
   - **Continue** — resume until next breakpoint
   - **Inspect variables** — hover or check the Variables panel

### Common Debugging Scenario

Set a breakpoint inside a `setState()` call to watch state changes:

```dart
onPressed: () {
  setState(() {
    name = name == 'World' ? 'Flutter' : 'World';  // <-- breakpoint here
  });
},
```

When you tap the button, execution pauses. You can see the current value of `name`, step through the assignment, and continue to watch the UI update.

### "My App is Frozen!"

If your app seems frozen, it's probably **paused at a breakpoint**:
- Look for "Paused" in the debug toolbar at the top of VS Code
- Press Continue (`F5`) or click the play button in the debug toolbar
- Remove breakpoints you're not using (click the red dot to toggle off)

### Print Debugging

Sometimes a quick `print()` is all you need:

```dart
onPressed: () {
  print('Button tapped! Current value: $name');  // shows in Debug Console
  setState(() {
    name = 'Flutter';
  });
},
```

Check the **Debug Console** panel (not Terminal) to see print output.

### Hot Reload vs Hot Restart

| Action | Shortcut | What It Does | When to Use |
|--------|----------|--------------|-------------|
| **Hot Reload** | `Cmd/Ctrl + S` (save) | Updates UI, keeps state | Changed a widget's appearance |
| **Hot Restart** | `Cmd/Ctrl + Shift + F5` | Full restart, resets state | Changed state variables, added new fields |
| **Full Restart** | Stop + `F5` | Completely rebuilds | Things aren't working, need a clean start |

**Rule of thumb:** If hot reload doesn't show your changes, try hot restart. If that doesn't work, stop and restart.

---

## Project Cleanup & Submission

### flutter clean

**Always run this before submitting or zipping a project:**

```bash
flutter clean
```

**Why:**
- Flutter builds create **450+ MB** of temporary files in the `build/` folder
- After cleaning, your project drops to **1-2 MB**
- MyCourses has file size limits — you can't upload 450MB

**When to run it:**
- Before zipping for submission
- When something weird is happening with builds
- When switching Flutter versions
- When your project folder is suspiciously large

### flutter pub get

After cloning, downloading, or cleaning a project, run:

```bash
flutter pub get
```

This re-downloads all the packages listed in `pubspec.yaml`. You'll need this after `flutter clean` or when opening someone else's project.

### Quick Submission Checklist

1. Run `flutter clean` in your project terminal
2. Verify project size is reasonable (should be a few MB, not hundreds)
3. Create a folder: `LastName_FirstName_AssignmentName/`
4. Put your project folder inside it
5. Zip the outer folder
6. Upload to MyCourses

See the full [Submission Guidelines](../../submission-guidelines.md) for detailed steps and folder structure examples.

---

## Common Issues & Solutions

| Problem | Solution |
|---------|----------|
| `const` errors after modifying a widget | Remove the `const` keyword from the parent widget |
| Hot reload not showing changes | Try Hot Restart (`Cmd/Ctrl + Shift + F5`) |
| Quick actions menu not appearing | Click on the **widget name**, not inside the parentheses |
| Code won't format properly | Add trailing commas, then `Alt/Option + Shift + F` |
| Formatter ignoring trailing commas | Add `formatter: trailing_commas: preserve` to `analysis_options.yaml` |
| App seems frozen | Check if debugger is paused at a breakpoint |
| Project is 450+ MB | Run `flutter clean` before zipping |
| "Packages not found" errors | Run `flutter pub get` |
| Emulator not showing | Restart VS Code, run Flutter Doctor |
| Red underlines everywhere in new project | Wait for analysis to finish, or run `flutter pub get` |

---

## When Covered in Course

- **[Week 2B](../../weekly/2B.md)** - Shortcuts, trailing commas, widget extraction, debugging basics
- **[Week 6B](../../weekly/6B.md)** - Dart 3.8+ formatter fix (`analysis_options.yaml`)
- Referenced throughout the course as these tools are used in every class

## Related Topics

- [Flutter on Lab Machines](flutter-lab-machines.md) - Installation and environment setup
- [Code Organization & DRY Principles](../patterns/code-organization.md) - Extract methods, widget extraction, file structure
- [Submission Guidelines](../../submission-guidelines.md) - Full submission process and folder structure
- [Professional Commenting](../../commenting_guide.md) - Code commenting standards

---

*Last updated: Week 9 | IGME-340 Reference*
