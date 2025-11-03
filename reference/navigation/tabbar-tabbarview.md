# TabBar & TabBarView

Material Design widgets that create tabs at the top of your app (usually in the AppBar) for switching between different views or content sections.

**When Covered:** [Week 11A](../../weekly/11A.md)

---

## Quick Example

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,  // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.search), text: 'Search'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeScreen(),
            SearchScreen(),
            SettingsScreen(),
          ],
        ),
      ),
    );
  }
}
```

---

## Key Concepts

### DefaultTabController - Automatic State Management
Unlike BottomNavigationBar, TabBar uses `DefaultTabController` which automatically manages which tab is selected. You don't need to track state manually!

### Three Required Components
1. **DefaultTabController** - Wraps everything, manages state
2. **TabBar** - The actual tabs (goes in AppBar's `bottom` property)
3. **TabBarView** - The content for each tab (goes in Scaffold's `body`)

### Preserving State Across Tabs
Use `AutomaticKeepAliveClientMixin` to prevent tab content from rebuilding:

```dart
class _MyTabState extends State<MyTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  
  @override
  Widget build(BuildContext context) {
    super.build(context);  // MUST call this!
    return /* your widget */;
  }
}
```

---

## Common Patterns

### Basic 3-Tab Layout
```dart
DefaultTabController(
  length: 3,
  child: Scaffold(
    appBar: AppBar(
      title: Text('My App'),
      bottom: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.home), text: 'Home'),
          Tab(icon: Icon(Icons.search), text: 'Search'),
          Tab(icon: Icon(Icons.settings), text: 'Settings'),
        ],
      ),
    ),
    body: TabBarView(
      children: [
        Center(child: Text('Home Content')),
        Center(child: Text('Search Content')),
        Center(child: Text('Settings Content')),
      ],
    ),
  ),
)
```

### Tabs with Icon Only
```dart
TabBar(
  tabs: [
    Tab(icon: Icon(Icons.home)),
    Tab(icon: Icon(Icons.search)),
    Tab(icon: Icon(Icons.settings)),
  ],
)
```

### Tabs with Text Only
```dart
TabBar(
  tabs: [
    Tab(text: 'Home'),
    Tab(text: 'Search'),
    Tab(text: 'Settings'),
  ],
)
```

### Styled TabBar
```dart
AppBar(
  title: Text('My App'),
  backgroundColor: Colors.blue,
  bottom: TabBar(
    indicatorColor: Colors.white,
    labelColor: Colors.white,
    unselectedLabelColor: Colors.white70,
    tabs: [
      Tab(icon: Icon(Icons.home), text: 'Home'),
      Tab(icon: Icon(Icons.search), text: 'Search'),
      Tab(icon: Icon(Icons.settings), text: 'Settings'),
    ],
  ),
)
```

### With State Preservation
```dart
class SearchTab extends StatefulWidget {
  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> 
    with AutomaticKeepAliveClientMixin {
  int counter = 0;
  
  @override
  bool get wantKeepAlive => true;
  
  @override
  Widget build(BuildContext context) {
    super.build(context);  // CRITICAL: Must call this!
    
    return Column(
      children: [
        Text('Counter: $counter'),
        ElevatedButton(
          onPressed: () => setState(() => counter++),
          child: Text('Increment'),
        ),
      ],
    );
  }
}
```

### Using Separate Page Files
```dart
// main.dart
import 'page_home.dart';
import 'page_search.dart';
import 'page_settings.dart';

DefaultTabController(
  length: 3,
  child: Scaffold(
    appBar: AppBar(
      title: Text('My App'),
      bottom: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.home), text: 'Home'),
          Tab(icon: Icon(Icons.search), text: 'Search'),
          Tab(icon: Icon(Icons.settings), text: 'Settings'),
        ],
      ),
    ),
    body: TabBarView(
      children: [
        PageHome(),
        PageSearch(),
        PageSettings(),
      ],
    ),
  ),
)
```

---

## Important Properties

### DefaultTabController
| Property | Type | Description |
|----------|------|-------------|
| `length` | `int` | Number of tabs (must match TabBar and TabBarView) |
| `child` | `Widget` | Usually a Scaffold |
| `initialIndex` | `int` | Which tab to start on (default 0) |

### TabBar
| Property | Type | Description |
|----------|------|-------------|
| `tabs` | `List<Widget>` | List of Tab widgets to display |
| `indicatorColor` | `Color?` | Color of selection indicator |
| `labelColor` | `Color?` | Color of selected tab text/icon |
| `unselectedLabelColor` | `Color?` | Color of unselected tab text/icon |
| `indicatorWeight` | `double` | Thickness of indicator line (default 2.0) |
| `labelStyle` | `TextStyle?` | Style for selected tab label |
| `unselectedLabelStyle` | `TextStyle?` | Style for unselected tab labels |

### Tab
| Property | Type | Description |
|----------|------|-------------|
| `icon` | `Widget?` | Icon to display |
| `text` | `String?` | Label text to display |
| `child` | `Widget?` | Custom widget (if not using icon/text) |

### TabBarView
| Property | Type | Description |
|----------|------|-------------|
| `children` | `List<Widget>` | Content for each tab (must match length) |

---

## Common Rules

1. **DefaultTabController length must match** - Same number for length, tabs, and children
2. **TabBar goes in AppBar bottom** - Not as a regular child
3. **Must call super.build()** - When using AutomaticKeepAliveClientMixin
4. **Override wantKeepAlive** - Must return `true` for state preservation
5. **Can work in StatelessWidget** - DefaultTabController handles all state

---

## Common Errors

### "length must be >= 0 and <= number of tabs"
**Problem:** DefaultTabController length doesn't match number of tabs  
**Solution:** Make sure `length`, number of `tabs`, and number of `children` all match

### State Not Preserved When Switching Tabs
**Problem:** Didn't add `AutomaticKeepAliveClientMixin` or forgot `super.build()`  
**Solution:** Add mixin and call `super.build(context)` first in build method

### Mixin Silently Fails
**Problem:** Forgot to call `super.build(context)`  
**Solution:** Add `super.build(context);` as first line in build method

### TabBar Not Showing
**Problem:** Put TabBar as regular widget instead of in AppBar's `bottom`  
**Solution:** Move TabBar to `bottom: TabBar(...)` property of AppBar

---

## AutomaticKeepAliveClientMixin

Required for preserving state when switching tabs:

```dart
class _MyTabState extends State<MyTab> with AutomaticKeepAliveClientMixin {
  // Your state variables
  int counter = 0;
  
  @override
  bool get wantKeepAlive => true;  // Must override
  
  @override
  Widget build(BuildContext context) {
    super.build(context);  // MUST call this first!
    
    return /* your widget */;
  }
}
```

**Critical:** If you forget `super.build(context)`, the mixin silently fails and state won't be preserved!

---

## vs BottomNavigationBar

| Feature | TabBar | BottomNavigationBar |
|---------|--------|---------------------|
| **Location** | Top (in AppBar) | Bottom of screen |
| **State Management** | Automatic (DefaultTabController) | Manual (you track index) |
| **Best For** | Related content views | Main app sections |
| **State Preservation** | AutomaticKeepAliveClientMixin | IndexedStack |
| **Typical Use** | Settings categories, product details | Instagram, Twitter style |

---

## See Also

- [BottomNavigationBar](bottomnavigationbar.md) - Alternative navigation pattern
- [Basic Navigation](basic-navigation.md) - Push/pop navigation
- [Week 11A Notes](../../weekly/11A.md) - Full class walkthrough

---

*Added Week 11A - Fall 2025*
