# IGME-340 Fall 2026 (2261) — Complete Course Roadmap

> **This is the live Fall 2026 (2261) schedule.** The Spring 2026 version is archived at
> `../archives/spring-2026/schedule.md`.

## Course Overview Summary
Multi-platform development focused on Flutter/Dart, progressing from foundational skills (Weeks 1-5) to project-based learning (Weeks 6-15). Android-first approach ensuring all students can participate regardless of computer type. Tue/Thu schedule.

### Important Dates
- 08/24: Classes begin (Monday — first 340 class is Tue 08/25)
- 08/25: First class (Tue, Week 1A)
- 09/07: Labor Day — Monday, no impact on Tue/Thu schedule
- 10/12-10/13: October Break — **8A cancelled** (Tue 10/13)
- 11/25-11/27: Thanksgiving Break — **14B cancelled** (Thu 11/26)
- 12/03: Last 340 class (Thu, Week 15B)
- 12/07: Last Day of Classes (Mon)
- 12/08: Reading Day
- 12/09-12/11, 12/14-12/16: Final Exam Period

### Key Differences from Spring 2026 (2255)
1. **Tue/Thu schedule** instead of Mon/Wed → all dates shift, content unchanged through Week 13.
2. **8A is cancelled** (October Break, Tue Oct 13) — same canonical pattern as Fall 2025. 8B absorbs Expanded layout content alongside Advanced TextFields.
3. **14B is cancelled** (Thanksgiving, Thu Nov 26) — content slides forward (see Weeks 14-15).
4. **15B exists** (no MLK-equivalent loss) → Fall 2026 has a real wrap-up class that Spring 2026 didn't.
5. **14A is no longer optional** (Fall 2025 made it optional pre-Thanksgiving; not repeating that — class is full enough to use the slot).
6. **End-of-semester file mapping:** student notes use canonical content names. Calendar slot 15A teaches `14B.md` (Responsive + Publishing), 15B teaches `15A.md` (Polish Packages — final class). MyCourses shows lesson titles like "14B - Responsive..." inside the Week 15 module. See `semester-comparison.md` for the breakout table.

---

## Week 1: Course Foundation & Dart Introduction
**Aug 25 & 27**

### [Week 1A](weekly/1A.md) (Tuesday): Course Introduction
- **Administrative:** Syllabus, grading structure (70% projects, 20% homework/labs, 10% participation)
- **Platform Overview:** Multiplatform development concepts, why Flutter
- **Dart Basics:** Variables, data types (int, double, String, bool), string interpolation
- **Tools:** DartPad introduction for immediate practice

### [Week 1B](weekly/1B.md) (Thursday): Dart Fundamentals
- **Collections:** Lists (arrays), Maps (dictionaries), basic operations
- **Functions:** Basic syntax, arrow functions, named parameters
- **Environment Setup:** Flutter installation guidance, VS Code configuration

**Assignments:** **sg01 quiz** (Dart Fundamentals) due Fri Aug 28 · Slack setup due Thu Aug 27 · [Lab 00](labs/lab-00-environment-setup.md) due Sun Sep 6 (low-pressure) · [Dart Exercises](exercises/README.md) due Wed Sep 9

---

## Week 2: Flutter Development Environment
**Sep 1 & 3**

### [Week 2A](weekly/2A.md): VS Code Setup & First Flutter App
- **Project Creation:** Command Palette, Flutter project templates, path requirements (no spaces!)
- **Development Cycle:** Running apps, device selection (emulator/Chrome), hot reload/restart
- **Architecture:** Widget tree introduction, StatelessWidget vs StatefulWidget, BuildContext
- **Core Widgets:** MaterialApp, Scaffold, AppBar, basic structure

### [Week 2B](weekly/2B.md): Development Tools & Debugging
- **VS Code Features:** Widget manipulation shortcuts (Cmd/Ctrl + Period), code extraction methods
- **Debugging:** Breakpoints, debug console, Chrome DevTools integration
- **Code Organization:** Extract Method, Extract Widget, Extract Local Variable
- **Best Practices:** Trailing commas, auto-formatting, project management

**Assignments:** **sg02 quiz** (Dart to Flutter) due Mon Aug 31, night before 2A · [Lab 00](labs/lab-00-environment-setup.md) due Sun Sep 6 · [Dart Exercises](exercises/README.md) due Wed Sep 9

---

## Week 3: Layout Fundamentals
**Sep 8 & 10**

### [Week 3A](weekly/3A.md): Basic Layout Widgets
- **Container:** Sizing behavior, positioning, styling basics
- **Layout Widgets:** Column, Row, spacing property
- **Alignment:** MainAxisAlignment, CrossAxisAlignment
- **Overflow Handling:** SingleChildScrollView for scrollable content
- **Widget Shortcuts:** Using Cmd/Ctrl + Period for quick widget wrapping

### [Week 3B](weekly/3B.md): Buttons & Theme System
- **Button Types:** ElevatedButton, OutlinedButton, TextButton, IconButton
- **Styling:** Inline styles with styleFrom(), custom icons and text
- **Theme System:** ThemeData, ColorScheme.fromSeed, light/dark themes
- **Global Styling:** App-wide button themes, text themes, accessing themes with Theme.of(context)

**Assignments:** [Lab 01](labs/lab-01-layout-basics.md) (Layout Basics), [Lab 02](labs/lab-02-themes-and-buttons.md) (Buttons & Themes)

---

## Week 4: Interactive Elements & Assets
**Sep 15 & 17**

### [Week 4A](weekly/4A.md): State Management & Styling
- **Project 1 Launch:** Design to Spec (Minecraft theme) introduction
- **State Management:** setState() fundamentals, button callbacks, UI rebuilding
- **AppBar Customization:** Background colors, elevation, leading/action widgets
- **Advanced Styling:** BoxDecoration (borders, shadows, backgrounds), Color.fromARGB()
- **Images:** Local assets (pubspec.yaml configuration), Network images, AssetImage vs NetworkImage

### [Week 4B](weekly/4B.md): Custom Fonts & Dialogs
- **Font Installation:** Manual font setup, assets folder structure, pubspec.yaml font declarations
- **Google Fonts:** Package limitations, compatibility issues with certain fonts
- **Clickable Widgets:** InkWell (with ripple effects), GestureDetector, Material wrapper
- **Dialog Boxes:** showDialog(), AlertDialog, barrierDismissible, Navigator.pop()
- **iOS Styling:** CupertinoAlertDialog for platform-specific design

**Major Project:** Project 1 - Design to Spec

---

## Week 5: Advanced UI Components
**Sep 22 & 24**

### [Week 5A](weekly/5A.md): Stack & Communication Widgets
- **Stack Widget:** Overlaying widgets, positioning with Positioned
- **SVG Images:** flutter_svg package, vector graphics handling
- **ScaffoldMessenger:** SnackBar, MaterialBanner with cascade notation (..)
- **Communication Patterns:** Showing temporary messages, user feedback

### [Week 5B](weekly/5B.md): Project 1 Support & Code Organization
- **Project 1 Support:** Focus shifted to helping with current project needs
- **Code Organization:** Extract Method for reducing repetition (DRY principle)
- **GestureDetector:** Implementing clickable containers for Project 1
- **Dialog Implementation:** showDialog patterns for Project 1 requirements
- **Professional Patterns:** Widget extraction, method naming conventions

---

## Week 6: User Input & Forms
**Sep 29 & Oct 1**

### [Week 6A](weekly/6A.md): DropdownList & TextFields
- **DropdownButton:** DropdownMenuItem, selection handling, dynamic options with .map()
- **TextField Basics:** onSubmitted callbacks, capturing user input
- **Input Styling:** InputDecoration (borders, labels, padding, fill colors)
- **Keyboard Types:** TextInputType (numeric, datetime, email) for appropriate contexts
- **TextEditingController:** Better text field management, initialization and cleanup

### [Week 6B](weekly/6B.md): Form Validation & Advanced Input
- **Form Management:** Global keys, form validation patterns, validator functions
- **TextFormField:** Validation with validator property, auto-validation modes
- **Validation Packages:** email_validator from pub.dev
- **CheckBox Widgets:** Basic checkboxes, CheckboxListTile, tri-state checkboxes
- **ListView:** Basic ListView, ListView.builder for dynamic content, ListTile widgets

**Assignments:** [Lab 03](labs/lab-03-textfields-dropdownbuttons.md) (TextFields & Dropdowns)

---

## Week 7: External Data & Advanced Layouts
**Oct 6 & 8**

### [Week 7A](weekly/7A.md): Asynchronous Programming & HTTP Requests
- **Warm-up (optional, ungraded):** [dart-03: Maps](exercises/dart-03-Maps.md) and [dart-07: Async](exercises/dart-07-Async.md), held back from the Week 1 bundle for exactly this week
- **API Integration:** HTTP package, GET/POST requests, authentication with Bearer tokens
- **Async Programming:** Future, async/await, error handling with try-catch
- **JSON Handling:** Parsing API responses with jsonDecode()
- **ListView.Builder:** Dynamically generating lists from API data
- **State Management:** Using setState() to update UI after async operations

### [Week 7B](weekly/7B.md): GridView & Giphy API Integration
- **Giphy API:** Real API integration, authentication with API keys, nested JSON responses
- **GridView:** GridView.count, GridView.builder, SliverGridDelegate
- **GridTile:** Structured grid items with headers/footers
- **Widget Inspector:** Visual debugging tools, widget tree navigation
- **Code Standards:** Professional commenting, widget extraction techniques

**Assignments:** [Lab 04](labs/lab-04-gif-finder.md) (Gif Finder)

---

## Week 8: October Break + Combined 8A/8B Class
**Oct 13 (🔴 break) & Oct 15**

### Week 8A (Tuesday): 🔴 No class — October Break (Oct 12-13)

### [Week 8B](weekly/8B.md) (Thursday): Expanded + Advanced TextFields & Connecting Forms to APIs
Combined session — Expanded layouts (canonical Spring 8A content) folded into 8B since October Break removes 8A. Use the 2255_8b override / a Fall-specific guide if pace differs from Spring.

- **Expanded Widget:** Automatic remaining-space filling in Rows and Columns; cross-axis sizing with `width: double.infinity` (compressed segment, ~15-20 min)
- **Focus Management:** FocusNode, FocusManager, programmatic focus control
- **Text Field Enhancement:** Clear buttons, suffix icons, onTapOutside, onEditingComplete
- **Keyboard Handling:** Three dismissal patterns, SingleChildScrollView for overlap
- **TextField → API Bridge:** Connecting form input to a live DummyJSON search request
- **GIF Finder / Project 2 Prep:** The full pattern: TextField → URL → fetch → parse → display

---

## Week 9: Data Persistence & Navigation Fundamentals
**Oct 20 & 22**

### [Week 9A](weekly/9A.md): Data Storage & External Integration
- **Data Persistence:** shared_preferences package for local storage
- **External Apps:** url_launcher for opening web browsers
- **Image Caching:** CachedNetworkImage for efficient image loading

### [Week 9B](weekly/9B.md): Page Navigation Fundamentals
- **Navigation Stack:** Understanding push/pop behavior, Navigator methods
- **MaterialPageRoute:** Basic page navigation with full widget references
- **Named Routes:** String-based navigation, route definitions in MaterialApp
- **Data Passing:** Route arguments, ModalRoute.of(context) for data retrieval
- **Navigation Methods:** push, pushReplacement, pop patterns

**Project 2 Proposal Due mid week**

---

## Week 10: Advanced Navigation & State Management
**Oct 27 & 29**

### [Week 10A](weekly/10A.md): GoRouter & Provider Pattern
- **GoRouter Package:** Navigation 2.0, URL-style routing with parameters
- **Provider Pattern:** ChangeNotifier, ChangeNotifierProvider, global state management
- **Context Methods:** context.watch() vs context.read(), automatic UI updates
- **State Architecture:** Eliminating setState, centralized data management
- **notifyListeners():** Triggering UI rebuilds across multiple pages

### [Week 10B](weekly/10B.md): Provider from Scratch — Wizard Directory
- **FutureProvider patterns:** Provider wrapper for async operations, API integration
- **Custom Providers:** Creating ChangeNotifier classes for business logic
- **Consumer Widget:** Alternative syntax for accessing provider data
- **JSON Models:** Structured data classes, API response handling
- **Network Error Handling:** Robust error patterns for API failures

**Project 2 Prototype Due**

---

## Week 11: Navigation UI & Game Development Introduction
**Nov 3 & 5**

### [Week 11A](weekly/11A.md): Navigation UI Components
- **TabBar System:** DefaultTabController, TabBar, TabBarView, Tab widgets
- **BottomNavigationBar:** BottomNavigationBarItem, multiple page management
- **State Preservation:** IndexedStack vs direct widget switching
- **AutomaticKeepAliveClientMixin:** State maintenance for TabBar pages
- **Navigation State:** Managing currentIndex, onTap handlers

### [Week 11B](weekly/11B.md): Flame Game Engine Basics
- **Project 3 Overview:** Roll Your Own Application requirements
- **Flame Setup:** GameWidget, FlameGame base class, game lifecycle
- **Sprite Components:** Loading and displaying game sprites
- **Input Handling:** PanDetector, TapCallbacks, JoystickComponent
- **Game Architecture:** Component-based design, mixins for behaviors

**Project 2 Due, Project 3 Proposals Due**

---

## Week 12: Game Development & Audio
**Nov 10 & 12**

### [Week 12A](weekly/12A.md): Game UI Integration
- **Flame Overlays:** UI layers on top of game canvas, overlay management
- **Flutter Integration:** Combining game widgets with Material design
- **WebView Integration:** webview_flutter package, HTML content in games
- **Game Controls:** Pause/resume functionality, game state management
- **Transparent UI:** Material backgrounds, overlay positioning

### [Week 12B](weekly/12B.md): Provider with Games & Audio
- **GameWidget.controlled:** Required pattern for Provider integration
- **Game State Management:** ChangeNotifier with Flame games
- **Audio System:** audioplayers package, background music vs sound effects
- **Audio Context:** Preventing channel conflicts, multiple audio streams
- **Memory Management:** Proper disposal of audio players and providers

**Project 3 Prototype Due**

---

## Week 13: Lifecycle & Production Prep
**Nov 17 & 19**

### [Week 13A](weekly/13A.md): Application Lifecycle & Complex Navigation
- **Application Lifecycle:** WidgetsBindingObserver, AppLifecycleState handling
- **Resource Management:** Pausing games/audio when app backgrounded
- **Game Navigation:** Flame games within BottomNavigationBar structure
- **External Game Control:** Provider-based game references, cross-widget communication
- **IndexedStack:** Preventing game widget disposal when switching tabs
- **Professional Patterns:** Lifecycle state handling, memory leak prevention

### [Week 13B](weekly/13B.md): Splash Screens & App Icons
- **Splash Screens:** flutter_native_splash package, app startup experience
- **Custom Icons:** flutter_launcher_icons package, app icon generation
- **Platform Requirements:** Icon sizes, adaptive icons for Android
- **Asset Tools:** easyappicon.com for quick icon generation

---

## Week 14: Camera + Thanksgiving
**Nov 24 & Nov 26 (🔴)**

### [Week 14A](weekly/14A.md) (Tuesday): Camera & Image Picker
**No longer optional** — class is full enough to use the slot, and there's no participation overhead by this point.
- **image_picker Package:** Taking photos, recording video, selecting from gallery
- **Android Emulator Setup:** Virtual Scene mode, webcam passthrough, walking around the virtual environment
- **Platform Configuration:** iOS permissions (Info.plist), Android setup
- **Course Evaluations:** https://rit.smartevals.com/
- **Lab Time:** Project 3 work session

### Week 14B (Thursday): 🔴 No class — Thanksgiving (Nov 25-27)

---

## Week 15: Responsive + Final Class (slid content)
**Dec 1 & 3**

> **File-naming note:** Calendar slot 15A teaches `14B.md` content (Responsive + Publishing); calendar slot 15B teaches `15A.md` content (Polish Packages). Files keep canonical names — MyCourses shows lesson titles like "14B - Responsive..." inside the Week 15 module. See `semester-comparison.md` Weeks 14-15 Detail.

### Week 15A (Tuesday) — teaching [`14B.md`](weekly/14B.md) content: Responsive Design & Publishing Overview
- **Responsive Design:** MediaQuery.sizeOf(), LayoutBuilder — Flutter's equivalents to CSS media queries
- **Publishing Overview:** Brief look at Google Play Store and Apple App Store processes; quick `flutter build web` deploy demo
- **Lab Time:** Project 3 work session, Q&A

### Week 15B (Thursday) — teaching [`15A.md`](weekly/15A.md) content: Final Class — Polish Packages + Wrap-up
- **Look how far you've come:** brief retrospective
- **Polish-package tour (drop-in, no architecture changes):** flutter_animate, skeletonizer, lottie, confetti, share_plus
- **Sample app:** [github.com/jptweb/flutter-polish-sample-app](https://github.com/jptweb/flutter-polish-sample-app) — clone and steal whatever fits Project 3
- **What's beyond this class:** Riverpod, Bloc, Firebase, testing, CI/CD, crash reporting (search-when-ready list)
- **Final push for Project 3:** open lab time, course evaluations reminder

---

## Finals Week: Dec 9-11, 14-16
**Scheduled time: TBD**

**Project 3 Final Submissions & Presentations**
- Format details will be announced as the semester progresses
- Likely a rapid-fire presentation format where everyone can show off their projects

---

## Widget Coverage Summary

### Core Layout Widgets
Container, Column, Row, Stack, Expanded, Padding, SizedBox, Center, Align

### Input & Forms
TextField, TextFormField, DropdownButton, CheckBox, CheckboxListTile, Form

### Lists & Grids
ListView, ListView.builder, ListTile, GridView, GridView.builder, GridTile

### Navigation & Structure
Scaffold, AppBar, BottomNavigationBar, TabBar, TabBarView, Drawer

### Buttons & Interaction
ElevatedButton, OutlinedButton, TextButton, IconButton, InkWell, GestureDetector

### Display Widgets
Text, Image, Icon, Card, AlertDialog, SnackBar, MaterialBanner

### Game Development
GameWidget, SpriteComponent, JoystickComponent, Game Overlays

### State Management
StatefulWidget, Provider, ChangeNotifier, FutureProvider, Consumer

### Platform Integration
WebView, Audio Players, Shared Preferences, URL Launcher, Cached Network Image, Camera/Image Picker

---

## Project Timeline
- **Project 1 (Week 4-7):** Design to Spec — Layout and styling focus
- **Project 2 (Week 8-11):** Web Service Application — API integration and navigation
- **Project 3 (Week 11-15):** Roll Your Own — Game development or advanced application

---

## Open items / decisions still needed before semester start

> Cross-check against [`00-Course-Overview/Fall-2026-Build-Log.md`](../00-Course-Overview/Fall-2026-Build-Log.md), which is the live "what's left" list. This section is schedule-specific.

- [x] ~~Confirm Fall 2026 grade structure~~ **RESOLVED 2026-08-09:** Projects 65 (P1 20 / P2 20 / P3 25), Labs & Exercises 20, Participation 10, Study Guide Quizzes 5. See `00-Course-Overview/assignments.md`.
- [ ] Decide whether 8B's combined Expanded + Advanced TextFields content needs a 2261-specific guide or if existing `2255_8b.md` serves
- [ ] Decide whether to create stub teaching guides for 14A (newly non-optional), 15A (now teaching `14B.md`), 15B (now teaching `15A.md`) — see CLAUDE.md slim template
- [ ] Confirm Lab 04 (GIF Finder) rework lands before Fall — see `00-Course-Overview/fall-2026-fixes.md`
- [ ] Sub-question still open from May 2026: do we want to swap to Responsive-before-Camera ordering? Current draft keeps Camera first; revisit before publishing this schedule

*Fall 2026 (term 2261). Promoted to the live `schedule.md` on 2026-08-09; the Spring 2026 version moved to `archives/spring-2026/schedule.md`. Last updated: 2026-08-09.*
