# IGME-340 Spring 2026 - Complete Course Roadmap

## Course Overview Summary
Multi-platform development focused on Flutter/Dart, progressing from foundational skills (Weeks 1-5) to project-based learning (Weeks 6-14). Android-first approach ensuring all students can participate regardless of computer type.

### Important Dates
- 01/20: Last day of Add/Drop period
- 01/19: Martin Luther King Jr. Day - No Classes
- 03/08-03/15: Spring Break - No Classes
- 04/03: Last day to drop with grade of "W"
- 04/27: Last day of classes
- 04/28: Reading Day
- 04/29-05/06: Final Exam Period

---

## Week 1: Course Foundation & Dart Introduction
**Jan 12 & 14**

### [Week 1A](weekly/1A.md) (Monday): Course Introduction
- **Administrative:** Syllabus, grading structure (70% projects, 20% homework/labs, 10% participation)
- **Platform Overview:** Multiplatform development concepts, why Flutter (46% adoption rate)
- **Dart Basics:** Variables, data types (int, double, String, bool), string interpolation
- **Tools:** DartPad introduction for immediate practice

### [Week 1B](weekly/1B.md) (Wednesday): Dart Fundamentals 
- **Collections:** Lists (arrays), Maps (dictionaries), basic operations
- **Functions:** Basic syntax, arrow functions, named parameters
- **Environment Setup:** Flutter installation guidance, VS Code configuration

**Assignments:** [Lab 00](labs/lab-00-environment-setup.md) (Environment Setup), Dart Exercises 1-3

---

## Week 2: Flutter Development Environment
**Jan 20 & 22**

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

**Assignments:** Dart Exercises 4-6 (Functions, Objects, Classes)

---

## Week 3: Layout Fundamentals
**Jan 27 & 29**

### [Week 3A](weekly/3A.md): Basic Layout Widgets
- **Container:** Sizing behavior, positioning, styling basics
- **Layout Widgets:** Column, Row, spacing property (new Flutter feature)
- **Alignment:** MainAxisAlignment, CrossAxisAlignment
- **Overflow Handling:** SingleChildScrollView for scrollable content
- **Widget Shortcuts:** Using Cmd/Ctrl + Period for quick widget wrapping

### [Week 3B](weekly/3B.md): Buttons & Theme System
- **Button Types:** ElevatedButton, OutlinedButton, TextButton, IconButton
- **Styling:** Inline styles with styleFrom(), custom icons and text
- **Theme System:** ThemeData, ColorScheme.fromSeed (47 color generation), light/dark themes
- **Global Styling:** App-wide button themes, text themes, accessing themes with Theme.of(context)

**Assignments:** [Lab 01](labs/lab-01-layout-basics.md) (Layout Basics), [Lab 02](labs/lab-02-themes-and-buttons.md) (Buttons & Themes)

---

## Week 4: Interactive Elements & Assets
**Feb 3 & 5**

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

**Major Project:** Project 1 - Design to Spec (layout-focused, matching exact specifications)

---

## Week 5: Advanced UI Components
**Feb 10 & 12**

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
**Feb 17 & 19**

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
**Feb 24 & 26**

### [Week 7A](weekly/7A.md): Asynchronous Programming & HTTP Requests
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

## Week 8: Advanced UI & Navigation Prep
**Mar 3 & 5**

### [Week 8A](weekly/8A.md): Advanced Text Fields & Responsive Design
- **Responsive Design:** Expanded widget for dynamic sizing, orientation handling
- **Focus Management:** FocusNode, FocusManager, programmatic focus control
- **Text Field Enhancement:** Suffix icons, onTapOutside, onEditingComplete
- **Keyboard Handling:** Dismissal patterns, handling keyboard overlap
- **Professional UX:** Focus flow, responsive layouts, keyboard behavior

### [Week 8B](weekly/8B.md): API Practice & GIF Finder Prep
- **API Practice:** Using DummyJSON or similar practice API
- **TextField-Driven Requests:** Injecting user input into API endpoint URLs
- **End-to-End Flow:** User input → API call → display results
- Remaining time: Project 2 proposal / lab work

---

## Spring Break (Mar 8-15) - No Classes

---

## Week 9: Data Persistence & Navigation Fundamentals
**Mar 17 & 19**

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
**Mar 24 & 26**

### [Week 10A](weekly/10A.md): GoRouter & Provider Pattern
- **GoRouter Package:** Navigation 2.0, URL-style routing with parameters
- **Provider Pattern:** ChangeNotifier, ChangeNotifierProvider, global state management
- **Context Methods:** context.watch() vs context.read(), automatic UI updates
- **State Architecture:** Eliminating setState, centralized data management
- **notifyListeners():** Triggering UI rebuilds across multiple pages

### [Week 10B](weekly/10B.md): Async State Management
- **FutureProvider:** Provider wrapper for async operations, API integration
- **Custom Providers:** Creating ChangeNotifier classes for business logic
- **Consumer Widget:** Alternative syntax for accessing provider data
- **JSON Models:** Structured data classes, API response handling
- **Network Error Handling:** Robust error patterns for API failures

**Project 2 Prototype Due**

---

## Week 11: Navigation UI & Game Development Introduction
**Mar 31 & Apr 2**

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
**Apr 7 & 9**

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
**Apr 14 & 16**

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

## Week 14: Course Wrap-up
**Apr 21 & 23**

### [Week 14A](weekly/14A.md): Camera & Image Picker
- **image_picker Package:** Taking photos, recording video, selecting from gallery
- **Android Emulator Setup:** Virtual Scene mode, webcam passthrough, walking around the virtual environment
- **Platform Configuration:** iOS permissions (Info.plist), Android setup
- **Course Evaluations:** https://rit.smartevals.com/
- **Lab Time:** Project 3 work session

### [Week 14B](weekly/14B.md): Responsive Design & Publishing Overview
- **Responsive Design:** MediaQuery.sizeOf(), LayoutBuilder - Flutter's equivalents to CSS media queries
- **Publishing Overview:** Brief look at Google Play Store and Apple App Store processes
- **Course Reflection:** Key takeaways, next steps in Flutter development
- **Lab Time:** Final Project 3 work session, Q&A

---

## Finals Week: Apr 29 - May 6
**Scheduled Time: TBD**

**Project 3 Final Submissions & Presentations**
- Format details will be announced as the semester progresses
- Likely a rapid-fire presentation format (possibly via Zoom) where everyone can show off their projects

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
WebView, Audio Players, Shared Preferences, URL Launcher, Cached Network Image

---

## Project Timeline
- **Project 1 (Week 4-7):** Design to Spec - Layout and styling focus
- **Project 2 (Week 8-11):** Web Service Application - API integration and navigation
- **Project 3 (Week 11-14):** Roll Your Own - Game development or advanced application

*This roadmap reflects the planned course delivery and covers all major Flutter concepts needed for professional mobile app development.*
