# IGME-340 Flutter Reference Guide

## Quick Navigation

### 🎨 Styling & Theming
- [BoxDecoration](styling/box-decoration.md) - Borders, shadows, gradients, rounded corners
- [Themes & ThemeData](styling/themes.md) - Global app styling and color systems
- [ColorScheme & Color Generation](styling/colorscheme.md) - Material Design color system, fromSeed generation
- [Text Styling & Custom Fonts](styling/text-fonts.md) - TextStyle, custom fonts, Google Fonts
- Material vs Cupertino Design *(coming soon - see [Week 4B notes](../weekly/4B.md))*

### 📦 Core Widgets
- [Container Basics](widgets/container-basics.md) - Sizing, padding, margin, alignment
- [Row & Column Layout](widgets/layout-widgets.md) - Horizontal and vertical widget arrangement
- [Stack Widget](widgets/stack-widget.md) - Layering widgets, Positioned, z-order
- [Images & Assets](widgets/images-assets.md) - Local and network images, asset configuration
- **[SVG Images](assets/svg-images.md)** - Using flutter_svg, handling color issues ✨ NEW
- Positioned & Align Widgets *(covered in [Stack Widget](widgets/stack-widget.md))*
- **[Expanded & Flexible](widgets/expanded-flexible.md)** - Responsive layouts, filling available space ✨ NEW
- [Padding & SizedBox](widgets/padding-sizedbox.md) - Spacing and sizing widgets

### 🔘 Buttons & Interaction
- [Button Types & Styling](widgets/button-types.md) - All button variants with theming and customization
- IconButton & FloatingActionButton *(covered in [Button Types](widgets/button-types.md), FAB details Week 9A)*
- [InkWell & GestureDetector](widgets/inkwell-gesturedetector.md) - Making any widget clickable

### 📝 Input & Forms
- [TextField Basics](input-forms/textfield-basics.md) - User text input and controllers
- [DropdownButton](input-forms/dropdown-button.md) - Selection menus and lists
- [CheckBox Widgets](input-forms/checkbox-widgets.md) - CheckBox, CheckboxListTile, and tri-state
- [Form Validation](input-forms/form-validation.md) - Forms, validators, and input validation
- InputDecoration & Styling *(covered in [TextField Basics](input-forms/textfield-basics.md))*
- [TextEditingController](input-forms/textfield-basics.md#using-texteditingcontroller-recommended) - Managing text input
- Form Widget & GlobalKey - [Introduced in Form Validation Reference Section](input-forms/form-validation.md)
- **[Focus Management](input-forms/focus-management.md)** - Keyboard control, focus flow, dismissing keyboard ✨ NEW

### 📋 Lists & Scrolling
- [SingleChildScrollView](widgets/singlechildscrollview.md) - Handling overflow and scrolling
- [ListView & ListTile / Lisview.builder](widgets/listview-basics.md)
- **[GridView & GridTile](widgets/gridview-basics.md)** - Grid layouts, GridView.builder, SliverGridDelegate ✨ NEW

### 🧭 Navigation & Notifications
- [Dialogs & Alerts](navigation/dialogs-alerts.md) - AlertDialog, showDialog, popups
- **[ScaffoldMessenger](notifications/scaffold-messenger.md)** - SnackBar, MaterialBanner ✨ NEW
- Navigator & MaterialPageRoute *(coming soon - Week 9B)*
- Named Routes *(coming soon - Week 9B)*
- GoRouter Package *(coming soon - Week 10A)*
- BottomNavigationBar *(coming soon - Week 11A)*
- TabBar & TabBarView *(coming soon - Week 11A)*

### 🔄 State Management
- [setState Basics](state-management/setstate-basics.md) - Fundamental state updates
- StatefulWidget Lifecycle *(coming soon - see [Week 4A notes](../weekly/4A.md))*
- Provider Pattern *(coming soon - Week 10A)*
- ChangeNotifier *(coming soon - Week 10A)*
- FutureProvider *(coming soon - Week 10B)*
- Consumer Widget *(coming soon - Week 10B)*

### 🌐 External Data & APIs
- **[Async/Await Fundamentals](network/async-await-fundamentals.md)** - Future, async, await, error handling ✨ NEW
- **[HTTP & API Integration](network/http-api-integration.md)** - Complete API guide with sections on: ✨ NEW
  - [Making HTTP Requests](network/http-api-integration.md#making-http-requests)
  - [JSON Parsing](network/http-api-integration.md#json-parsing)
  - [API Authentication](network/http-api-integration.md#api-authentication)
  - [Error Handling](network/http-api-integration.md#error-handling)
- **[GIPHY API Setup Guide](network/giphy-api-setup.md)** - Complete guide to getting and using GIPHY API keys ✨ NEW
  - [Getting Your API Key](network/giphy-api-setup.md#getting-your-api-key)
  - [API Key Security Best Practices](network/giphy-api-setup.md#api-key-security)
  - [Common Endpoints](network/giphy-api-setup.md#using-your-api-key-with-giphy)
  - [Testing & Troubleshooting](network/giphy-api-setup.md#testing-your-api-key)
- CachedNetworkImage *(coming soon - Week 9A)*

### 💾 Data Persistence
- SharedPreferences *(coming soon - Week 9A)*
- Local Storage Patterns *(coming soon - Week 9A)*

### 🎮 Game Development (Flame)
- Flame Engine Setup *(coming soon - Week 11B)*
- GameWidget Basics *(coming soon - Week 11B)*
- Sprite Components *(coming soon - Week 11B)*
- Game Input Handling *(coming soon - Week 11B)*
- Game Overlays *(coming soon - Week 12A)*
- Audio with Games *(coming soon - Week 12B)*

### 📱 Platform Integration
- URL Launcher *(coming soon - Week 9A)*
- WebView Flutter *(coming soon - Week 12A)*
- AudioPlayers Package *(coming soon - Week 12B)*
- App Lifecycle *(coming soon - Week 13A)*

### 🚀 Production & Deployment
- Splash Screens *(coming soon - Week 13B)*
- App Icons *(coming soon - Week 13B)*
- Responsive Design *(coming soon - Week 13B)*
- Build & Release *(coming soon - Week 13B)*

### 🎯 Common Patterns
- [Code Organization & DRY Principles](patterns/code-organization.md) - Extract methods, widget extraction, file structure, naming conventions
- Widget Extraction Techniques *(covered in [Code Organization](patterns/code-organization.md))*
- Professional Commenting *(coming soon - Week 7B)*

### 🐛 Troubleshooting
- Common Flutter Errors *(coming soon)*
- Debugging Techniques *(coming soon - see [Week 2B notes](../weekly/2B.md))*
- Widget Inspector *(coming soon - Week 7B)*
- Performance Tips *(coming soon)*
- flutter clean & Submission *(coming soon - see [Week 2A notes](../weekly/2A.md))*

### 📱 Platform-Specific
- iOS Cupertino Widgets *(coming soon - see [Week 4B notes](../weekly/4B.md))*

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

### Currently Available (Weeks 1-8B)
- **Expanded & Flexible (Week 8B)** ✨ NEW
- **Focus Management (Week 8B)** ✨ NEW
- GridView & GridTile (Week 7B)
- Async/Await & API Integration (Week 7A)
- Stack Widget (Week 5A)
- SVG Images (Week 5A)
- ScaffoldMessenger (Week 5A)
- BoxDecoration (Week 4A)
- *More topics being added weekly*

### Coming Soon
- **Week 7B:** Widget Inspector
- **Week 9A:** Navigation, Data Persistence, CachedNetworkImage
- **Week 9B-10A:** Named Routes, GoRouter, Provider
- **Week 10-11:** Advanced State Management
- **Week 11-12:** Flame Game Development
- **Week 13:** Production & Deployment

## Still Can't Find Something?

1. **Use GitHub Search** - The search box works across all files
2. **Check Weekly Notes** - The [weekly folder](../weekly/) has detailed class-by-class coverage
3. **Check the Schedule** - The [course schedule](../schedule.md) shows when topics are covered
4. **Ask on Slack** - Your classmates might have the same question
5. **Office Hours** - Sometimes a quick demo is worth 1000 words

## Contributing

Found an error or have a helpful example? Let me know! This reference grows based on your needs.

---

*This reference supplements but doesn't replace the [weekly class notes](../weekly/). The weekly notes show you what we did in class and in what order. This reference helps you find specific "how to" information quickly.*

*Topics marked "coming soon" will be added as we cover them in class. The week number indicates when we first introduce the concept.*
