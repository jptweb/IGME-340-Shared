# How to Excel on Project 3

This guide breaks down the GRADING RUBRIC (which is attached to the MyCourses Assignment Dropbox) into actionable items. Not everything listed is required—focus on the categories that matter most for your grade. This is just to help people out but the [INSTRUCTIONS for P3](p3_roll_your_own_instructions.md) are still the source of truth!

## 1. Usefulness & Entertainment (10 pts)
Your app/game should be genuinely useful or fun:
- Clear purpose that someone would actually want to use
- Engaging experience that works as intended
- Polish that makes people want to try it

## 2. Error Prevention & Handling (10 pts)
Build a robust application:
- Input validation where applicable
- Graceful error handling (doesn't crash)
- User-friendly error messages
- Keyboard dismissal when appropriate

## 3. Documentation (10 pts)
**Required:**
- Documentation page accessible from within app
- Explains what you built and how you met requirements
- Lists resources and packages used
- Describes your process
- Highlights features you want graded

> ⚠️ **Critical:** If you want credit for a feature, DOCUMENT IT. I can't grade what I can't find!

## 4. Code Quality & Organization (10 pts)
**Required:**
- Code comments (see [Commenting Guide](../commenting_guide.md))
- Organized into multiple .dart files
- Custom classes (at least one)
- Type-aware variables (not just `var`)
- DRY principles (no repeated code blocks)
- Removed debug print statements

## 5. Functional Requirements (20 pts)
**Must Have:**
- Custom Splash Screen
- Custom App Icon
- Appropriate App Name
- No debug banner
- SharedPreferences for data persistence
- Multiple pages (at minimum: main app + about + documentation)
- No crashes

**Choose ONE navigation method:**
- BottomNavigationBar, OR
- TabBar, OR
- Named routing

**Additional functionality beyond class examples**

## 6. Interface Quality (20 pts)
**Must Have:**
- Intuitive, well-labeled interface
- Clear instructions where needed
- Works well in portrait orientation

**Going Beyond:**
- Responsive layout (MediaQuery)
- WebView or URL Launcher integration
- Advanced navigation patterns

## 7. Visual Design (20 pts)
**Must Have:**
- Custom font
- Coordinated colors (Theme or manual)
- Appropriate imagery and icons
- Beyond default Flutter appearance

**Going Beyond:**
- Polished visual design
- Sound effects/music
- Animations

## Going "Above and Beyond"
To get top marks, go beyond what we covered in class. Consider:

**Advanced State Management:** (choose one if applicable)
- Provider pattern
- Firebase integration
- BLoC or Riverpod

**Enhanced Features:**
- Flame game engine
- GPS/Maps integration
- Camera access
- Responsive design for tablets

> Document which advanced features you implemented!
