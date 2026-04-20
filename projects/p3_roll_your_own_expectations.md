# How to Excel on Project 3

> 📋 **Start Here:** This guide shows you exactly how to succeed on Project 3 by breaking down the grading rubric into actionable items with links to relevant course materials. For project logistics, deadlines, and submission requirements, see the **[Project 3 Instructions](p3_roll_your_own_instructions.md)**.
>
> **Important:** The **Code Submission (70%)** is graded on six categories below. **Documentation (5%)** and **Video Demo (10%)** are separate MyCourses submissions.

This guide breaks down the GRADING RUBRIC (which is attached to the MyCourses Assignment Dropbox) into actionable items. Not everything listed is required—focus on the categories that matter most for your grade. This is just to help people out but the [INSTRUCTIONS for P3](p3_roll_your_own_instructions.md) are still the source of truth!

## Grading Philosophy

Your project is graded on **six categories** (95 points total); with advanced features you can reach 110. Quality of execution matters:

**Grade Ranges:**
- **70-80:** Meets basic requirements but with quality issues or missing features
- **80-90 (B range):** All "Must Haves" completed with solid, functional quality
- **90-95 (A- range):** All "Must Haves" with strong execution and attention to detail
- **95-100 (A range):** Exceptional polish throughout, **OR** solid execution + advanced feature(s)
- **100-110 (A+ range):** Exceptional polish AND multiple advanced features

**Two Paths to 95+:**
1. **Polish Path:** Make everything beautiful - professional UI, clean code, thoughtful UX
2. **Feature Path:** Solid execution + implement advanced features like Provider, Flame, Firebase
3. **Best Path:** Combine both for 100+

> Because everyones project is differen't it's impossible to just give people a checklist of exactly what to do; so you must carefully understand these guidelines and/or contact me with questions about your features. I may also be able to respond to issues / questions you put in your proposal!

**The key to success:** Document your work! I can only grade what I can see.

---

## 1. Usefulness & Entertainment (10 pts)

Your app/game should be genuinely useful or fun:
- Clear purpose that someone would actually want to use
- Engaging experience that works as intended
- Polish that makes people want to try it

---

## 2. Error Prevention & Handling (10 pts)

Build a robust application:
- [**Input validation**](../reference/input-forms/form-validation.md) where applicable
- Graceful error handling (doesn't crash)
- User-friendly error messages
- [**Keyboard dismissal**](../reference/input-forms/focus-management.md#dismissing-the-keyboard) when appropriate

---

## 3. Code Quality & Organization (15 pts)

**Required:**
- Code comments (see [Commenting Guide](../commenting_guide.md))
- [**Organized into multiple .dart files**](../reference/patterns/code-organization.md#file-organization)
- [**Custom classes**](../reference/patterns/code-organization.md#extracting-to-custom-classes) (at least one)
- Type-aware variables (not just `var`) - see [Week 2B notes](../weekly/2B.md#type-safety)
- [**DRY principles**](../reference/patterns/code-organization.md#method-extraction-dry-principle) (no repeated code blocks)
- Removed debug print statements

**If Using AI Tools (Optional):**
- Must document AI usage in your submission (see [Project Instructions - Section IX](p3_roll_your_own_instructions.md#ix-ai-tools--academic-integrity))
- Comments must explain WHY decisions were made, not just WHAT the code does
- Must demonstrate understanding of all code through documentation
- Be prepared to explain architectural decisions beyond "the AI suggested it"
- Code organization should show thoughtful structure, not just AI output

**Remember:** Whether you write code yourself or use AI assistance, you must be able to explain and justify every architectural decision. Using AI without understanding the code is no different than copying from Stack Overflow without understanding—both are problematic.

**Related Resources:**
- [Code Organization & DRY Principles](../reference/patterns/code-organization.md)
- [Declarative UI Architecture](../reference/state-management/declarative-ui-architecture.md) - Separation of data and UI

---

## 4. Functional Requirements (20 pts)

### Must Have:
- **Custom Splash Screen** - *[Week 13B](../weekly/13B.md)*
- **Custom App Icon** - *[Week 13B](../weekly/13B.md)*
- **Appropriate App Name** - *[Week 13B](../weekly/13B.md)*
- **No debug banner** - Remove the "DEBUG" banner from your app (hint: MaterialApp has a property for this)
- **[SharedPreferences](../reference/data-persistence/shared-preferences.md)** for data persistence
  - *At minimum: save user preferences, settings, or game state*
- **Multiple pages/screens** (at minimum: your main app pages - no specific "about" page required)
  - *Games: Consider menu, game, pause, game-over as separate screens*
  - *Apps: Multiple functional pages based on your app's purpose*
  - *Note: All project documentation is submitted as a separate PDF, not in-app*
  - *Covered in [Week 9A](../weekly/9A.md) - Stupid Clicker Game*
- **No crashes**

### Choose ONE navigation method:
- **[BottomNavigationBar](../reference/navigation/bottomnavigationbar.md)** - *[Week 11A](../weekly/11A.md)*, OR
- **[TabBar](../reference/navigation/tabbar-tabbarview.md)** - *[Week 11A](../weekly/11A.md)*, OR
- **[Named routing](../reference/navigation/named-routes.md)** - Clean string-based navigation

**Navigation Resources:**
- [Basic Navigation](../reference/navigation/basic-navigation.md) - Navigator.push/pop fundamentals
- [Data Passing Between Pages](../reference/navigation/data-passing.md) - Arguments and return values
- [GoRouter Package](../reference/navigation/gorouter.md) - Advanced routing (optional)

### Additional functionality beyond class examples
**Your project should do something we haven't built together in class!** This could be:
- A unique feature or workflow
- Creative application of concepts we've covered
- Integration of a new package or API
- Original game mechanics or app functionality

This doesn't need to be revolutionary - just demonstrate that you've taken what we learned and applied it to something new. **Document what makes your project different from class examples!**

---

## 5. Interface Quality (20 pts)

### Must Have:
- Intuitive, well-labeled interface
- [**Dialogs/alerts**](../reference/navigation/dialogs-alerts.md) with clear instructions where needed
- Works well in portrait orientation
  - Use [**Expanded & Flexible**](../reference/widgets/expanded-flexible.md) widgets for responsive layouts
  - Ensure content fits without overflow on standard phone screens

### Professional Execution (part of getting to 95-100):
- Smooth, polished interactions with [InkWell](../reference/widgets/inkwell-gesturedetector.md) for visual feedback
- Contextual feedback with [SnackBars/ScaffoldMessenger](../reference/notifications/scaffold-messenger.md)
- **[URL Launcher](../reference/platform-integration/url-launcher.md)** for external links (if your app needs them)
- Thoughtful use of loading states and empty states

### Advanced Features (for 100+):
- **Responsive layout** for tablets - [MediaQuery & LayoutBuilder](../reference/responsive-design/mediaquery-layoutbuilder.md) *([Week 14A](../weekly/14A.md))*
- **[WebView](../weekly/12A.md)** integration with complex interactions
- Advanced navigation patterns with [GoRouter](../reference/navigation/gorouter.md)

**Related Resources:**
- [Basic Navigation](../reference/navigation/basic-navigation.md)
- [Data Passing Between Pages](../reference/navigation/data-passing.md)

---

## 6. Visual Design (20 pts)

### Must Have:
- **[Custom font](../reference/styling/text-fonts.md)** - Local or Google Fonts
- **Coordinated colors** - [Theme](../reference/styling/themes.md) or [ColorScheme](../reference/styling/colorscheme.md)
- **Polished visual design** with [BoxDecoration](../reference/styling/box-decoration.md) (gradients, shadows, borders, rounded corners)
- **Appropriate imagery and icons**
  - [Images & Assets](../reference/widgets/images-assets.md)
  - [SVG Images](../reference/assets/svg-images.md)
- Beyond default Flutter appearance

### Professional Execution (part of getting to 95-100):
- **[CachedNetworkImage](../reference/platform-integration/cached-network-image.md)** with smart caching strategies (if your app uses network images)
- Consistent visual hierarchy and spacing throughout
- Thoughtful use of color for meaning (errors, success, warnings)
- Professional iconography and imagery choices

### Advanced Features (for 100+):
- **Sound effects/music** - *[Week 12B](../weekly/12B.md) - AudioPlayers package*
- **Custom animations** - 🌐 [Flutter Animation Tutorial](https://docs.flutter.dev/ui/animations/tutorial) (beyond basic implicit animations)

**Styling Resources:**
- [Themes & ThemeData](../reference/styling/themes.md) - Global app styling
- [Text Styling & Custom Fonts](../reference/styling/text-fonts.md)

---

## Going "Above and Beyond"

**To reach 95-100:** Choose ONE path:
- Path A: Exceptional execution quality on all requirements (professional polish)
- Path B: Solid execution + 1-2 advanced features from the list below

**To reach 100-110:** Professional execution quality PLUS multiple advanced features from below.

### Advanced Features (covered in class - use if they fit your project):
- **[Provider pattern](../reference/state-management/provider-pattern.md)** - Centralized state management *(Week 10A)*
- **[Flame game engine](../weekly/11B.md)** - For game projects *(Week 11B-12B)*
- **Responsive design** for tablets - [MediaQuery & LayoutBuilder](../reference/responsive-design/mediaquery-layoutbuilder.md) *(Week 14A)*
- **[App Lifecycle Management](../weekly/13A.md)** - Proper state handling *(Week 13A)*
- **Smooth loading states** with [FutureProvider](../weekly/10B.md) *(Week 10B)*

### Advanced Features (not covered - extra learning required):
- **Riverpod** - 🌐 [Riverpod Official Docs](https://riverpod.dev/) (advanced state management alternative)
- **Firebase integration** - Real-time database, authentication
  - *Note: Firebase basics covered in IGME-330 - [Firebase Guide](https://github.com/rit-igm-web/igme-330-shared/blob/main/notes/firebase-1.md)*
- **GPS/Maps integration** - Location services
- **[Camera access](../weekly/14A.md)** - Device camera features
- **BLoC pattern** - Another advanced state management approach

### UX Polish Extras *(added March 4, 2026)*

You don't need a "killer app" to reach 100+. A simpler app with **lots of professional polish** can get there too. These are small but meaningful UX touches that real-world apps implement - the kind of details users expect but rarely notice until they're missing:

- **Clear (X) buttons** on TextFields - let users quickly clear input with a suffixIcon ([Week 8B](../weekly/8B.md#i-clear-buttons))
- **Focus node next-field navigation** - pressing the keyboard's enter/next button jumps to the next field instead of doing nothing ([Week 8B](../weekly/8B.md#ii-focus-nodes))
- **Tap-outside keyboard dismissal** - tapping outside a TextField dismisses the keyboard, standard iOS/Android behavior ([Week 8B](../weekly/8B.md#iii-keyboard-dismissal))
- **SingleChildScrollView on forms** - prevents the keyboard from covering input fields ([Week 8B](../weekly/8B.md#iv-singlechildscrollview))

*More items may be added here as the semester progresses.* If you implement UX polish extras, **document them in your submission** so I know to look for them. A quick list in your documentation like "I added clear buttons, focus management, and keyboard dismissal" is all you need.

### Production Polish (can elevate execution quality):
- Professional error handling with retry logic and user feedback
- Advanced animation sequences throughout the app
- WebView integration with two-way communication

> 💡 **Remember:** Document which advanced features you implemented! If it's not documented, it might not get credit.
> 📚 **Full Reference Guide:** See [reference/README.md](../reference/README.md) for complete documentation of all topics covered in this course.


## Examples of What Counts as What

These are examples — you don't need all of them. A few done well is better than many done poorly.

**Professional Execution (gets you to 95-100):**
- BoxDecoration throughout with gradients, shadows, consistent rounded corners
- InkWell feedback on all interactive elements
- URL Launcher for external links where appropriate
- Loading states, empty states, error states all handled gracefully
- Consistent spacing and visual hierarchy
- Thoughtful color usage (not just random colors)
- Clean, well-commented, organized code across multiple files

**Advanced Features (gets you to 100-110):**
- Implementing Firebase authentication with multiple sign-in methods
- Building a Flame game with multiple levels and state management
- Creating responsive design that works on phones AND tablets
- Provider pattern with multiple ChangeNotifiers managing complex app state
- WebView integration with two-way communication between Flutter and web content
- Professional error handling with retry logic and offline support
- Custom animations throughout (not just one simple animation)
- Sound effects/music integrated meaningfully

**NOT "Going Beyond" (these are baseline expectations):**
- Having multiple pages (requirement)
- Using SharedPreferences (requirement)
- Adding images and a custom font (requirement)
- Making the UI look better than default Flutter (requirement)
- Writing commented, organized code (requirement)
- Using basic navigation (requirement)

**The Key Distinction:**
- **Professional Execution** = Doing required things REALLY WELL (polish, attention to detail)
- **Advanced Features** = Adding SUBSTANTIAL new functionality beyond requirements
- Either path can get you to 100. Both together gets you to 110.

---

*Last updated: Week 11 | Fall 2025*
