# BottomNavigationBar

A Material Design widget that displays navigation at the bottom of your app, commonly used for main sections (like Instagram, Twitter, etc.).

**When Covered:** [Week 11A](../../weekly/11A.md)

---

## Quick Example

```dart
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  
  final List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
```

---

## Key Concepts

### Required: StatefulWidget & Manual State Management
Unlike TabBar (which uses DefaultTabController), BottomNavigationBar requires YOU to manage state:

- Track which tab is selected with an integer variable
- Update state in `onTap` callback using `setState()`
- Display the correct screen based on current index

### Preserving State Across Navigation
Use `IndexedStack` to keep all screens alive in memory:

```dart
body: IndexedStack(
  index: currentIndex,
  children: screens,
),
```

Without IndexedStack, screens rebuild each time you switch tabs (losing state like form inputs, scroll position, etc.).

---

## Common Patterns

### Basic 3-Tab Navigation
```dart
class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  
  final List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
```

### 4+ Items Navigation (Fixed Type)
When you have 4 or more items, you MUST specify `type: BottomNavigationBarType.fixed`:

```dart
bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.fixed,  // Required for 4+ items
  currentIndex: currentIndex,
  items: [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ],
  onTap: (index) {
    setState(() {
      currentIndex = index;
    });
  },
),
```

### Animated Navigation (Shifting Type)
Create an animated effect with shifting type:

```dart
bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.shifting,
  currentIndex: currentIndex,
  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
      backgroundColor: Colors.blue,  // Required for shifting
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
      backgroundColor: Colors.green,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
      backgroundColor: Colors.purple,
    ),
  ],
  onTap: (index) {
    setState(() {
      currentIndex = index;
    });
  },
),
```

### With State Preservation (IndexedStack)
```dart
class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  
  final List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(  // Keeps all screens in memory
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
```

---

## Important Properties

| Property | Type | Description |
|----------|------|-------------|
| `currentIndex` | `int` | Which item is currently selected (0-based) |
| `items` | `List<BottomNavigationBarItem>` | The navigation items to display (min 2) |
| `onTap` | `Function(int)` | Callback when item is tapped, receives index |
| `type` | `BottomNavigationBarType` | `fixed` (consistent size) or `shifting` (animated) |
| `selectedItemColor` | `Color?` | Color of selected item |
| `unselectedItemColor` | `Color?` | Color of unselected items |
| `backgroundColor` | `Color?` | Background color of entire bar |
| `elevation` | `double` | Shadow depth (default 8.0) |
| `iconSize` | `double` | Size of icons (default 24.0) |
| `selectedFontSize` | `double` | Font size of selected label (default 14.0) |
| `unselectedFontSize` | `double` | Font size of unselected labels (default 12.0) |

---

## Common Rules

1. **Minimum 2 items required** - Flutter throws error with only 1 item
2. **Must be StatefulWidget** - Need to track and update `currentIndex`
3. **4+ items need type** - Add `type: BottomNavigationBarType.fixed` for 4+ items
4. **Shifting requires backgroundColor** - Each item needs `backgroundColor` for shifting type
5. **Number of items must match screens** - `items.length` should equal `screens.length`
6. **Use IndexedStack for state** - Without it, screens rebuild on every switch

---

## Common Errors

### "RenderBox was not laid out"
**Problem:** Trying to use BottomNavigationBar with only 1 item  
**Solution:** Add at least 2 items or don't use BottomNavigationBar

### Items Disappear with 4+ Tabs
**Problem:** Forgot to specify type for 4+ items  
**Solution:** Add `type: BottomNavigationBarType.fixed`

### State Resets When Switching Tabs
**Problem:** Not using IndexedStack, screens rebuild each time  
**Solution:** Wrap body in `IndexedStack` widget

### Shifting Type Has No Animation
**Problem:** Didn't add `backgroundColor` to each item  
**Solution:** Add `backgroundColor` property to each `BottomNavigationBarItem`

---

## vs TabBar

| Feature | BottomNavigationBar | TabBar |
|---------|---------------------|--------|
| **Location** | Bottom of screen | Top (in AppBar) |
| **State Management** | Manual (you track index) | Automatic (DefaultTabController) |
| **Best For** | Main app sections | Related content views |
| **State Preservation** | IndexedStack | AutomaticKeepAliveClientMixin |
| **Typical Use** | Instagram, Twitter style | Settings categories, product details |

---

## See Also

- [TabBar & TabBarView](tabbar-tabbarview.md) - Alternative navigation pattern
- [Basic Navigation](basic-navigation.md) - Push/pop navigation
- [Week 11A Notes](../../weekly/11A.md) - Full class walkthrough

---

*Added Week 11A - Fall 2025*
