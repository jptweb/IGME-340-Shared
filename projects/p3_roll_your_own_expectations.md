# How to Excel on Project 3

> 📋 **Start Here:** This guide shows you exactly how to succeed on Project 3 by breaking down the grading rubric into actionable items with links to relevant course materials. For project logistics, deadlines, and submission requirements, see the **[Project 3 Instructions](p3_roll_your_own_instructions.md)**.
>
> **Important:** The **Code Submission (70%)** is graded on six categories below. **Documentation (5%)** and **Video Demo (10%)** are separate MyCourses submissions.

This guide breaks down the GRADING RUBRIC (which is attached to the MyCourses Assignment Dropbox) into actionable items. Not everything listed is required—focus on the categories that matter most for your grade. This is just to help people out but the [INSTRUCTIONS for P3](p3_roll_your_own_instructions.md) are still the source of truth!

## Grading Philosophy

This is a **quality-based rubric** where execution matters as much as features:

**Meeting Requirements (80-90 points):**
- Complete all "Must Have" items in each category
- Your project works reliably without crashes
- Code is functional and reasonably organized
- Goes beyond class examples in at least one way
- *This is the "I did the assignment" tier*

**Solid Execution (90-95 points):**
- All requirements met with good quality
- Clean, organized, documented code
- Thoughtful design decisions
- *This is the "I did it well" tier*

**Professional Quality (95-100 points):**
- All requirements met with professional execution
- Polished UI/UX with attention to detail
- Well-architected, maintainable code
- **OR** solid execution + 1-2 advanced features from "Going Beyond"
- *This is the "portfolio-worthy" tier*

**Excellence & Innovation (100-105+ points):**
- Professional quality execution PLUS multiple advanced features
- See "Going 'Above and Beyond'" section below for examples
- Production-quality polish and creative solutions
- Demonstrates mastery beyond course scope
- *This is the "I went above and beyond" tier*

**The key to a high grade:** Document your work! If you implemented something cool but didn't document it, I might miss it during grading.

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

**Related Resources:**
- [Code Organization & DRY Principles](../reference/patterns/code-organization.md)
- [Declarative UI Architecture](../reference/state-management/declarative-ui-architecture.md) - Separation of data and UI

---

## 4. Functional Requirements (20 pts)

### Must Have:
- **Custom Splash Screen** - *[Week 13B](../weekly/13B.md) (coming soon)*
- **Custom App Icon** - *[Week 13B](../weekly/13B.md) (coming soon)*
- **Appropriate App Name** - *[Week 13B](../weekly/13B.md) (coming soon)*
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
- **[BottomNavigationBar](../weekly/11A.md)** - *Week 11A (coming soon)*, OR
- **[TabBar](../weekly/11A.md)** - *Week 11A (coming soon)*, OR
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

### Going Beyond:
- **Responsive layout** - *[Week 14A](../weekly/14A.md) (coming soon) - MediaQuery, LayoutBuilder*
- **[WebView](../weekly/12A.md) or [URL Launcher](../reference/platform-integration/url-launcher.md)** integration
- Advanced navigation patterns with [GoRouter](../reference/navigation/gorouter.md)

**Related Resources:**
- [InkWell & GestureDetector](../reference/widgets/inkwell-gesturedetector.md) - Making widgets clickable
- [ScaffoldMessenger](../reference/notifications/scaffold-messenger.md) - SnackBars for feedback

---

## 6. Visual Design (20 pts)

### Must Have:
- **[Custom font](../reference/styling/text-fonts.md)** - Local or Google Fonts
- **Coordinated colors** - [Theme](../reference/styling/themes.md) or [ColorScheme](../reference/styling/colorscheme.md)
- **Appropriate imagery and icons**
  - [Images & Assets](../reference/widgets/images-assets.md)
  - [SVG Images](../reference/assets/svg-images.md)
- Beyond default Flutter appearance

### Going Beyond:
- Polished visual design with [BoxDecoration](../reference/styling/box-decoration.md) (gradients, shadows, borders)
- **[CachedNetworkImage](../reference/platform-integration/cached-network-image.md)** for network images that are reused across sessions (e.g., user profiles, product catalogs). Not appropriate for random/single-use images or static assets that should be bundled with the app.
- **Sound effects/music** - *[Week 12B](../weekly/12B.md) (coming soon) - AudioPlayers package*
- **Animations** - 🌐 [Flutter Animation Tutorial](https://docs.flutter.dev/ui/animations/tutorial) (external documentation)

**Styling Resources:**
- [BoxDecoration](../reference/styling/box-decoration.md) - Borders, shadows, gradients, rounded corners
- [Themes & ThemeData](../reference/styling/themes.md) - Global app styling
- [Text Styling & Custom Fonts](../reference/styling/text-fonts.md)

---

## Going "Above and Beyond"

**To reach 95-100 points:** Either exceptional execution quality on all requirements, OR solid execution + 1-2 advanced features.

**To exceed 100 points (up to 105+):** Professional execution quality PLUS multiple advanced features. Consider:

### Advanced State Management (choose one if applicable):
- **[Provider pattern](../reference/state-management/provider-pattern.md)** - Centralized state management
- **Firebase integration** - Real-time database, authentication
  - *Note: Firebase covered in IGME-330 - [Firebase Guide](https://github.com/rit-igm-web/igme-330-shared/blob/main/notes/firebase-1.md)*
  - 🌐 [Google Sign-In with Firebase Tutorial](https://medium.com/@dev.lens/flutter-google-sign-in-using-firebase-authentication-step-by-step-ef2ddfb84a2c) (external - advanced)
- **Riverpod** - 🌐 [Riverpod Official Docs](https://riverpod.dev/) (external - advanced state solution, not covered in class)

### Enhanced Features:
- **[Flame game engine](../weekly/11B.md)** - *Week 11B-12B (coming soon)*
- **GPS/Maps integration** - Location services *(not covered in detail)*
- **Camera access** - Device camera features *(not covered in detail)*
- **Responsive design** for tablets - *[Week 14A](../weekly/14A.md) (coming soon)*

### Production Quality:
- **[App Lifecycle Management](../weekly/13A.md)** - *Week 13A (coming soon)*
- Professional error handling patterns
- Smooth loading states with [FutureProvider](../weekly/10B.md) - *Week 10B (coming soon)*

---

> 💡 **Remember:** Document which advanced features you implemented! If it's not documented, it might not get credit.

> 📚 **Full Reference Guide:** See [reference/README.md](../reference/README.md) for complete documentation of all topics covered in this course.

---

## Examples of What Counts as "Going Beyond"

**Strong Examples:**
- Implementing Firebase authentication with multiple sign-in methods
- Building a Flame game with multiple levels and state management
- Creating a responsive design that works beautifully on both phones and tablets
- Integrating advanced animation sequences throughout the app
- Smart caching strategies with CachedNetworkImage for performance optimization
- Provider pattern with multiple ChangeNotifiers managing complex app state
- WebView integration with two-way communication between Flutter and web content
- Professional error handling with retry logic and user feedback

**Moderate Examples:**
- Using Provider for basic state management
- Adding sound effects to key interactions
- Implementing one custom animation
- Using GoRouter instead of basic navigation
- Adding a splash screen with custom branding
- Basic Firebase integration (just saving/loading data)

**Not "Above and Beyond" (These are expected):**
- Having multiple pages (requirement)
- Using SharedPreferences (requirement)
- Adding images and a custom font (requirement)
- Making the UI look better than default Flutter (requirement)
- Writing commented, organized code (requirement)

**The Difference:** "Beyond" means **either** implementing something we didn't cover in class **or** taking something we did cover and pushing it significantly further with additional complexity, polish, or creative application.

---

*Last updated: Week 11 | Fall 2025*
