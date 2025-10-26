# IGME-340 Flutter Reference Guide

## Quick Navigation

### 🎨 Styling & Theming
- [BoxDecoration](styling/box-decoration.md) - Borders, shadows, gradients, rounded corners
- [Themes & ThemeData](styling/themes.md) - Global app styling and color systems
- [ColorScheme & Color Generation](styling/colorscheme.md) - Material Design color system, fromSeed generation
- [Text Styling & Custom Fonts](styling/text-fonts.md) - TextStyle, custom fonts, Google Fonts
- Material vs Cupertino Design *(see [Week 4B notes](../weekly/4B.md))*

### 📦 Core Widgets
- [Container Basics](widgets/container-basics.md) - Sizing, padding, margin, alignment
- [Row & Column Layout](widgets/layout-widgets.md) - Horizontal and vertical widget arrangement
- **[Expanded & Flexible](widgets/expanded-flexible.md)** - Responsive layouts, filling available space
- [Padding & SizedBox](widgets/padding-sizedbox.md) - Spacing and sizing widgets
- [Stack Widget](widgets/stack-widget.md) - Layering widgets, Positioned, z-order
- [Images & Assets](widgets/images-assets.md) - Local and network images, asset configuration
- **[SVG Images](assets/svg-images.md)** - Using flutter_svg, handling color issues

### 🔘 Buttons & Interaction
- [Button Types & Styling](widgets/button-types.md) - All button variants with theming and customization
- [InkWell & GestureDetector](widgets/inkwell-gesturedetector.md) - Making any widget clickable

### 📝 Input & Forms
- [TextField Basics](input-forms/textfield-basics.md) - User text input and controllers
- **[Focus Management](input-forms/focus-management.md)** - Keyboard control, focus flow, dismissing keyboard
- [DropdownButton](input-forms/dropdown-button.md) - Selection menus and lists
- [CheckBox Widgets](input-forms/checkbox-widgets.md) - CheckBox, CheckboxListTile, and tri-state
- [Form Validation](input-forms/form-validation.md) - Forms, validators, and input validation

### 📋 Lists & Scrolling
- [SingleChildScrollView](widgets/singlechildscrollview.md) - Handling overflow and scrolling
- [ListView & ListTile / ListView.builder](widgets/listview-basics.md) - Dynamic lists
- **[GridView & GridTile](widgets/gridview-basics.md)** - Grid layouts, GridView.builder, SliverGridDelegate

### 🧭 Navigation & Dialogs
- [Dialogs & Alerts](navigation/dialogs-alerts.md) - AlertDialog, showDialog, popups
- **[ScaffoldMessenger](notifications/scaffold-messenger.md)** - SnackBar, MaterialBanner
- **[Basic Navigation](navigation/basic-navigation.md)** - Navigator.push/pop, MaterialPageRoute, navigation stack
- **[Named Routes](navigation/named-routes.md)** - Clean routing with string identifiers, route configuration
- **[Data Passing Between Pages](navigation/data-passing.md)** - Arguments, return values, async navigation
- **[GoRouter Package](navigation/gorouter.md)** - Modern Navigation 2.0, URL-style routing, path parameters
- BottomNavigationBar *(coming soon - Week 11A)*
- TabBar & TabBarView *(coming soon - Week 11A)*

### 🔄 State Management
- **[Declarative UI Architecture](state-management/declarative-ui-architecture.md)** - "Your data controls the UI" - Flutter's foundational principle
- [setState Basics](state-management/setstate-basics.md) - Fundamental state updates
- StatefulWidget Lifecycle *(see [Week 4A notes](../weekly/4A.md))*
- **[Provider Pattern](state-management/provider-pattern.md)** - Centralized state management, ChangeNotifier, context.watch/read
- FutureProvider *(coming soon - Week 10B)*
- Consumer Widget *(coming soon - Week 10B)*

### 🌐 External Data & APIs
- **[Async/Await Fundamentals](network/async-await-fundamentals.md)** - Future, async, await, error handling
- **[HTTP & API Integration](network/http-api-integration.md)** - Complete API guide with HTTP requests, JSON parsing, authentication, error handling
- **[GIPHY API Setup Guide](network/giphy-api-setup.md)** - Complete guide to getting and using GIPHY API keys

### 💾 Data Persistence
- **[SharedPreferences](data-persistence/shared-preferences.md)** - Persistent key-value storage for settings, preferences, favorites

### 🎮 Game Development (Flame)
- Flame Engine Setup *(coming soon - Week 11B)*
- GameWidget Basics *(coming soon - Week 11B)*
- Sprite Components *(coming soon - Week 11B)*
- Game Input Handling *(coming soon - Week 11B)*
- Game Overlays *(coming soon - Week 12A)*
- Audio with Games *(coming soon - Week 12B)*

### 📱 Platform Integration
- **[URL Launcher](platform-integration/url-launcher.md)** - Open websites, phone calls, emails, SMS from your app
- **[CachedNetworkImage](platform-integration/cached-network-image.md)** - Efficient image loading with caching
- FloatingActionButton *(coming soon - Week 9A)*
- WebView Flutter *(coming soon - Week 12A)*
- AudioPlayers Package *(coming soon - Week 12B)*
- App Lifecycle Management *(coming soon - Week 13A)*

### 🚀 Production & Deployment
- Splash Screens *(coming soon - Week 13B)*
- App Icons *(coming soon - Week 13B)*

### 📐 Responsive Design
- MediaQuery *(coming soon - Week 14A)*
- LayoutBuilder *(coming soon - Week 14A)*
- AspectRatio Widget *(coming soon - Week 14A)*

### 🎯 Common Patterns
- [Code Organization & DRY Principles](patterns/code-organization.md) - Extract methods, widget extraction, file structure, naming conventions
- Professional Commenting *(see [Week 7B notes](../weekly/7B.md))*

### 🐛 Debugging & Tools
- Widget Inspector *(see [Week 7B notes](../weekly/7B.md))*
- Debugging Techniques *(see [Week 2B notes](../weekly/2B.md))*
- flutter clean & Submission *(see [Week 2A notes](../weekly/2A.md))*

---

## How to Use This Reference

This reference guide is designed for **quick lookups** when you're coding. Each topic includes:

- **Quick Example** - Copy-paste code to get started
- **Common Use Cases** - Variations you'll actually use  
- **Important Rules** - Things that will break if you don't know them
- **Common Patterns** - Production-ready examples
- **Properties Reference** - Quick property lookup table
- **When Covered in Course** - Links back to weekly notes for context
- **Common Errors** - Troubleshooting help

## By Week Coverage

### Currently Available (Weeks 1-10A)
- **GoRouter Package (Week 10A)** ✨ NEW!
- **Provider Pattern (Week 10A)** ✨ NEW!
- Declarative UI Architecture (Week 9B)
- Basic Navigation (Week 9B)
- Named Routes (Week 9B)
- Data Passing Between Pages (Week 9B)
- SharedPreferences (Week 9A)
- URL Launcher (Week 9A)
- CachedNetworkImage (Week 9A)
- Focus Management (Week 8B)
- Expanded & Flexible (Week 8B)
- GridView & GridTile (Week 7B)
- Async/Await & API Integration (Week 7A)
- GIPHY API Setup (Week 7A-7B)
- Stack Widget (Week 5A)
- SVG Images (Week 5A)
- ScaffoldMessenger (Week 5A)
- BoxDecoration (Week 4A)
- Themes & ColorScheme (Week 3B)
- Button Types (Week 3B)
- Layout Widgets (Row/Column) (Week 3A)
- Container Basics (Week 3A)
- TextField Basics (Week 6A)
- DropdownButton (Week 6A)
- Form Validation (Week 6B)
- CheckBox Widgets (Week 6B)
- ListView Basics (Week 6B)
- SingleChildScrollView (Week 3A)
- InkWell & GestureDetector (Week 4B)
- Dialogs & Alerts (Week 4B)
- Code Organization (Week 5B)

### Coming Soon (In Course Order)
- **Week 10B:** FutureProvider, Consumer Widget, Advanced State Patterns
- **Week 11A:** BottomNavigationBar, TabBar/TabBarView, IndexedStack
- **Week 11B:** Flame Engine, GameWidget, Sprites, Input Handling
- **Week 12A:** Game Overlays, WebView
- **Week 12B:** AudioPlayers, Game Audio Integration
- **Week 13A:** App Lifecycle (WidgetsBindingObserver)
- **Week 13B:** Splash Screens, App Icons
- **Week 14A:** MediaQuery, LayoutBuilder, AspectRatio (Responsive Design)

---

## Still Can't Find Something?

1. **Use GitHub Search** - The search box works across all files
2. **Check Weekly Notes** - The [weekly folder](../weekly/) has detailed class-by-class coverage
3. **Check the Schedule** - The [course schedule](../schedule.md) shows when topics are covered
4. **Ask on Discord/Slack** - Your classmates might have the same question
5. **Office Hours** - Sometimes a quick demo is worth 1000 words

## Contributing

Found an error or have a helpful example? Let me know! This reference grows based on your needs.

---

## About This Reference

*This reference supplements but doesn't replace the [weekly class notes](../weekly/). The weekly notes show you what we did in class and in what order. This reference helps you find specific "how to" information quickly.*

*Topics marked "coming soon" will be added as we cover them in class. Topics marked with "see [Week X notes]" are well-covered in the weekly notes and may not need separate reference pages.*

---

*Last updated: Week 10A | Fall 2025*
