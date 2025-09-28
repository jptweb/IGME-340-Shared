# IGME-340 Fall 2025 - Complete Course Roadmap

## Course Overview Summary
Multi-platform development focused on Flutter/Dart, progressing from foundational skills (Weeks 1-5) to project-based learning (Weeks 6-15). Android-first approach ensuring all students can participate regardless of computer type.

### Important Dates
- 09/02: Last day of Add/Drop period
- 10/13-10/14: Fall Break
- 11/07: Last day to drop with grade of "W"
- 11/27-11/28: Thanksgiving Break
- 12/08: Last day of classes
- 12/09: Reading Day
- 12/10-12/17: Final Exam Period

---

## Week 1: Course Foundation & Dart Introduction
**Aug 26 & 28**

### Week 1A (Tuesday): Course Introduction
- **Administrative:** Syllabus, grading structure (70% projects, 10% each: participation, assessments, homework)
- **Platform Overview:** Multiplatform development concepts, why Flutter (46% adoption rate)
- **Dart Basics:** Variables, data types (int, double, String, bool), string interpolation
- **Tools:** DartPad introduction for immediate practice

### Week 1B (Thursday): Dart Fundamentals 
- **Collections:** Lists (arrays), Maps (dictionaries), basic operations
- **Functions:** Basic syntax, arrow functions, named parameters
- **Environment Setup:** Flutter installation guidance, VS Code configuration

**Homework:** HW1 (Environment Setup), HW2 (Dart ICE 1-3)

---

## Week 2: Flutter Development Environment
**Sep 2 & 4**

### Week 2A: VS Code Setup & First Flutter App
- **Project Creation:** Command Palette, Flutter project templates, path requirements (no spaces!)
- **Development Cycle:** Running apps, device selection (emulator/Chrome), hot reload/restart
- **Architecture:** Widget tree introduction, StatelessWidget vs StatefulWidget, BuildContext
- **Core Widgets:** MaterialApp, Scaffold, AppBar, basic structure

### Week 2B: Development Tools & Debugging
- **VS Code Features:** Widget manipulation shortcuts (Cmd/Ctrl + Period), code extraction methods
- **Debugging:** Breakpoints, debug console, Chrome DevTools integration
- **Code Organization:** Extract Method, Extract Widget, Extract Local Variable
- **Best Practices:** Trailing commas, auto-formatting, project management

**Homework:** Dart ICE 4-6 (Functions, Objects, Classes)

---

## Week 3: Layout Fundamentals
**Sep 9 & 11**

### Week 3A: Basic Layout Widgets
- **Container:** Sizing behavior, positioning, styling basics
- **Layout Widgets:** Column, Row, spacing property (new Flutter feature)
- **Alignment:** MainAxisAlignment, CrossAxisAlignment
- **Overflow Handling:** SingleChildScrollView for scrollable content
- **Widget Shortcuts:** Using Cmd/Ctrl + Period for quick widget wrapping

### Week 3B: Buttons & Theme System
- **Button Types:** ElevatedButton, OutlinedButton, TextButton, IconButton
- **Styling:** Inline styles with styleFrom(), custom icons and text
- **Theme System:** ThemeData, ColorScheme.fromSeed (47 color generation), light/dark themes
- **Global Styling:** App-wide button themes, text themes, accessing themes with Theme.of(context)

**Homework:** Flutter ICE 3A (Layout Basics), Flutter ICE 3B (Buttons & Themes)

---

## Week 4: Interactive Elements & Assets
**Sep 16 & 18**

### Week 4A: State Management & Styling
- **Project 1 Launch:** Design to Spec (Minecraft theme) introduction
- **State Management:** setState() fundamentals, button callbacks, UI rebuilding
- **AppBar Customization:** Background colors, elevation, leading/action widgets
- **Advanced Styling:** BoxDecoration (borders, shadows, backgrounds), Color.fromARGB()
- **Images:** Local assets (pubspec.yaml configuration), Network images, AssetImage vs NetworkImage

### Week 4B: Custom Fonts & Dialogs
- **Font Installation:** Manual font setup, assets folder structure, pubspec.yaml font declarations
- **Google Fonts:** Package limitations, compatibility issues with certain fonts
- **Clickable Widgets:** InkWell (with ripple effects), GestureDetector, Material wrapper
- **Dialog Boxes:** showDialog(), AlertDialog, barrierDismissible, Navigator.pop()
- **iOS Styling:** CupertinoAlertDialog for platform-specific design

**Major Project:** Project 1 - Design to Spec (layout-focused, matching exact specifications)

---

## Week 5: Advanced UI Components
**Sep 23 & 25**

### Week 5A: Stack & Communication Widgets
- **Stack Widget:** Overlaying widgets, positioning with Positioned
- **SVG Images:** flutter_svg package, vector graphics handling
- **ScaffoldMessenger:** SnackBar, MaterialBanner with cascade notation (..)
- **Communication Patterns:** Showing temporary messages, user feedback

### Week 5B: Project 1 Support & Code Organization
- **Project 1 Support:** Focus shifted to helping with current project needs
- **Code Organization:** Extract Method for reducing repetition (DRY principle)
- **GestureDetector:** Implementing clickable containers for Project 1
- **Dialog Implementation:** showDialog patterns for Project 1 requirements
- **Professional Patterns:** Widget extraction, method naming conventions

---

## Week 6: User Input & Forms
**Sep 30 & Oct 2**

### Week 6A: DropdownList & TextFields
- **DropdownButton:** DropdownMenuItem, selection handling, dynamic options with .map()
- **TextField Basics:** onSubmitted callbacks, capturing user input
- **Input Styling:** InputDecoration (borders, labels, padding, fill colors)
- **Keyboard Types:** TextInputType (numeric, datetime, email) for appropriate contexts
- **TextEditingController:** Better text field management, initialization and cleanup

### Week 6B: Form Validation & Advanced Input
- **Form Management:** Global keys, form validation patterns, validator functions
- **TextFormField:** Validation with validator property, auto-validation modes
- **Validation Packages:** email_validator from pub.dev
- **CheckBox Widgets:** Basic checkboxes, CheckboxListTile, tri-state checkboxes
- **ListView:** Basic ListView, ListView.builder for dynamic content, ListTile widgets

**Homework:** Gif Finder Lab preparation

---

## Week 7: External Data & Advanced Layouts
**Oct 7 & 9**

### Week 7A: Asynchronous Programming & HTTP Requests
- **API Integration:** HTTP package, GET/POST requests, authentication with Bearer tokens
- **Async Programming:** Future, async/await, error handling with try-catch
- **JSON Handling:** Parsing API responses with jsonDecode()
- **ListView.Builder:** Dynamically generating lists from API data
- **State Management:** Using setState() to update UI after async operations

### Week 7B: GridView & Giphy API Integration
- **Giphy API:** Real API integration, authentication with API keys, nested JSON responses
- **GridView:** GridView.count, GridView.builder, SliverGridDelegate
- **GridTile:** Structured grid items with headers/footers
- **Widget Inspector:** Visual debugging tools, widget tree navigation
- **Code Standards:** Professional commenting, widget extraction techniques

**Project 1 Due:** Design to Spec completion

---

## Week 8: Advanced UI & Navigation Prep  
**Oct 14 & 16**

### Week 8A: Fall Break - No Class

### Week 8B: Midterm Assessment & Advanced Text Fields
- **Midterm Assessment:** In-class technical assessment (5% of grade)
- **Responsive Design:** Expanded widget for dynamic sizing, orientation handling
- **Focus Management:** FocusNode, FocusManager, programmatic focus control
- **Text Field Enhancement:** Suffix icons, onTapOutside, onEditingComplete
- **Keyboard Handling:** Dismissal patterns, handling keyboard overlap
- **Professional UX:** Focus flow, responsive layouts, keyboard behavior

---

## Week 9: Data Persistence & Navigation Fundamentals
**Oct 21 & 23**

### Week 9A: Data Storage & External Integration
- **Project 2 Introduction:** Web Service Application overview
- **Data Persistence:** shared_preferences package for local storage
- **External Apps:** url_launcher for opening web browsers
- **Image Caching:** CachedNetworkImage for efficient image loading
- **FloatingActionButton:** Action buttons, integration patterns

### Week 9B: Page Navigation Fundamentals
- **Navigation Stack:** Understanding push/pop behavior, Navigator methods
- **MaterialPageRoute:** Basic page navigation with full widget references
- **Named Routes:** String-based navigation, route definitions in MaterialApp
- **Data Passing:** Route arguments, ModalRoute.of(context) for data retrieval
- **Navigation Methods:** push, pushReplacement, pop patterns

**Project 2 Proposal Due**

---

## Week 10: Advanced Navigation & State Management
**Oct 28 & 30**

### Week 10A: GoRouter & Provider Pattern
- **GoRouter Package:** Navigation 2.0, URL-style routing with parameters
- **Provider Pattern:** ChangeNotifier, ChangeNotifierProvider, global state management
- **Context Methods:** context.watch() vs context.read(), automatic UI updates
- **State Architecture:** Eliminating setState, centralized data management
- **notifyListeners():** Triggering UI rebuilds across multiple pages

### Week 10B: Async State Management
- **FutureProvider:** Provider wrapper for async operations, API integration
- **Custom Providers:** Creating ChangeNotifier classes for business logic
- **Consumer Widget:** Alternative syntax for accessing provider data
- **JSON Models:** Structured data classes, API response handling
- **Network Error Handling:** Robust error patterns for API failures

**Project 2 Prototype Due**

---

## Week 11: Navigation UI & Game Development Introduction
**Nov 4 & 6**

### Week 11A: Navigation UI Components
- **TabBar System:** DefaultTabController, TabBar, TabBarView, Tab widgets
- **BottomNavigationBar:** BottomNavigationBarItem, multiple page management
- **State Preservation:** IndexedStack vs direct widget switching
- **AutomaticKeepAliveClientMixin:** State maintenance for TabBar pages
- **Navigation State:** Managing currentIndex, onTap handlers

### Week 11B: Flame Game Engine Basics
- **Project 3 Overview:** Roll Your Own Application requirements
- **Flame Setup:** GameWidget, FlameGame base class, game lifecycle
- **Sprite Components:** Loading and displaying game sprites
- **Input Handling:** PanDetector, TapCallbacks, JoystickComponent
- **Game Architecture:** Component-based design, mixins for behaviors

**Project 2 Due, Project 3 Proposals Due**

---

## Week 12: Game Development & Audio
**Nov 11 & 13**

### Week 12A: Game UI Integration
- **Flame Overlays:** UI layers on top of game canvas, overlay management
- **Flutter Integration:** Combining game widgets with Material design
- **WebView Integration:** webview_flutter package, HTML content in games
- **Game Controls:** Pause/resume functionality, game state management
- **Transparent UI:** Material backgrounds, overlay positioning

### Week 12B: Provider with Games & Audio
- **GameWidget.controlled:** Required pattern for Provider integration
- **Game State Management:** ChangeNotifier with Flame games
- **Audio System:** audioplayers package, background music vs sound effects
- **Audio Context:** Preventing channel conflicts, multiple audio streams
- **Memory Management:** Proper disposal of audio players and providers

**Project 3 Prototype Due**

---

## Week 13: Lifecycle & Production Prep
**Nov 18 & 20**

### Week 13A: Application Lifecycle & Complex Navigation
- **Application Lifecycle:** WidgetsBindingObserver, AppLifecycleState handling
- **Resource Management:** Pausing games/audio when app backgrounded
- **Game Navigation:** Flame games within BottomNavigationBar structure
- **External Game Control:** Provider-based game references, cross-widget communication
- **Professional Patterns:** Lifecycle state handling, memory leak prevention

### Week 13B: App Store Preparation
- **Splash Screens:** flutter_native_splash package, app startup experience
- **Custom Icons:** App icon generation, platform-specific requirements
- **Responsive Design:** MediaQuery, LayoutBuilder, AspectRatio widgets
- **Publishing Process:** Build configurations, release preparation

---

## Week 14: Project Completion
**Nov 25 & 27**

### Week 14A: Final Project Work
- **Project 3 Polish:** Code cleanup, testing, final feature implementation
- **Presentation Prep:** Video creation, demonstration planning
- **Code Review:** Best practices, documentation standards

### Week 14B: Thanksgiving - No Class

---

## Week 15: Course Wrap-up
**Dec 2 & 4**

### Week 15A: Project Presentations
- **Project 3 Showcases:** Student presentations, peer feedback
- **Portfolio Review:** Course progression, skill development assessment

### Week 15B: Final Review & Assessment
- **Final Assessment Prep:** Cumulative review, technical concepts
- **Course Reflection:** Learning outcomes, industry applications
- **Next Steps:** Advanced Flutter topics, career development

---

## Finals Week: Dec 10-17
**Final Assessment (5%) & Project 3 Final Submissions**

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
- **Project 3 (Week 11-15):** Roll Your Own - Game development or advanced application

*This roadmap reflects the actual course delivery and covers all major Flutter concepts needed for professional mobile app development.*
