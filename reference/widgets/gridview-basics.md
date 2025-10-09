# GridView, GridTile & SliverGridDelegate Reference

## Quick Example
```dart
// Simple 2-column grid
GridView.count(
  crossAxisCount: 2,
  crossAxisSpacing: 8.0,
  mainAxisSpacing: 8.0,
  children: [
    Container(color: Colors.blue, child: Text('Item 1')),
    Container(color: Colors.red, child: Text('Item 2')),
  ],
)
```

## Visual GridView Designer Tool

🎨 **Want to experiment with GridView layouts visually?** Check out the [GridView Builder Tool](https://jptweb.github.io/GridView-Builder-For-Flutter/gridview-builder-all-in-one.html) - an interactive designer that lets you play with crossAxisCount, spacing, aspect ratios, and more. Great for prototyping your layouts before coding!

> **Note:** This is a work-in-progress tool created by Prof. Takats. It's useful for getting a visual sense of how different properties affect your grid layout. Try it out and provide feedback!

---

## Core Concepts

### GridView.count - Fixed Static Grid
Use when you know all your items upfront and have a fixed number of columns.

```dart
GridView.count(
  crossAxisCount: 3,  // 3 columns
  crossAxisSpacing: 10.0,  // Horizontal spacing
  mainAxisSpacing: 10.0,   // Vertical spacing
  padding: EdgeInsets.all(10),
  children: [
    Container(color: Colors.red, height: 100),
    Container(color: Colors.blue, height: 100),
    Container(color: Colors.green, height: 100),
    // ... manually list all items
  ],
)
```

**When to Use:**
- Small, fixed number of items
- Items are manually created
- Simple demos or prototypes

**Limitation:** Must list all children explicitly - not practical for API data or large lists.

---

### GridView.builder - Dynamic Content
The workhorse for displaying API results, database queries, or any dynamic data.

```dart
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 8.0,
    mainAxisSpacing: 8.0,
  ),
  itemCount: items.length,  // Number of items
  itemBuilder: (context, index) {
    return Container(
      color: Colors.blue,
      child: Center(child: Text('Item $index')),
    );
  },
)
```

**When to Use:**
- Displaying data from APIs
- Working with lists of unknown length
- Performance matters (only builds visible items)
- Infinite scrolling grids

**Key Properties:**
- `gridDelegate` - Controls layout (required)
- `itemCount` - Number of items (optional, infinite if omitted)
- `itemBuilder` - Function returning widget for each item

---

### SliverGridDelegate - Layout Controller

The name is intimidating, but it's just the layout engine for GridView.builder.

**What "Sliver" Means:**
Flutter uses "sliver" for anything scrollable. Don't overthink it - just remember it controls the grid's scroll behavior.

**Most Common Type: SliverGridDelegateWithFixedCrossAxisCount**

```dart
SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 3,           // Number of columns
  crossAxisSpacing: 5.0,       // Horizontal gap between items
  mainAxisSpacing: 10.0,       // Vertical gap between items
  childAspectRatio: 1.0,       // Width/height ratio (1.0 = square)
  mainAxisExtent: 150,         // Fixed height for items (optional)
)
```

**Property Breakdown:**

| Property | Purpose | Example |
|----------|---------|---------|
| `crossAxisCount` | Number of columns | `3` = 3-column grid |
| `crossAxisSpacing` | Horizontal space between items | `8.0` pixels |
| `mainAxisSpacing` | Vertical space between items | `10.0` pixels |
| `childAspectRatio` | Width:height ratio | `1.5` = wider than tall |
| `mainAxisExtent` | Fixed item height | `200` = all items 200px tall |

**Common Patterns:**

```dart
// Square items
childAspectRatio: 1.0

// Wide items (like video thumbnails)
childAspectRatio: 16 / 9

// Fixed height (ignores aspect ratio)
mainAxisExtent: 150
```

⚠️ **Don't use both** `childAspectRatio` and `mainAxisExtent` - they conflict!

---

### Alternative: SliverGridDelegateWithMaxCrossAxisExtent
Creates columns based on maximum item width instead of fixed column count.

```dart
SliverGridDelegateWithMaxCrossAxisExtent(
  maxCrossAxisExtent: 200,  // Max item width
  crossAxisSpacing: 10.0,
  mainAxisSpacing: 10.0,
)
```

**Result:** Grid adds columns as screen width allows. On tablet = more columns, on phone = fewer.

**When to Use:** Responsive layouts where column count should adapt to screen size.

---

## GridTile - Structured Grid Items

GridTile provides header, body, and footer sections for each grid item.

```dart
GridTile(
  header: GridTileBar(
    backgroundColor: Colors.black54,
    title: Text('Header Text'),
    trailing: Icon(Icons.favorite),
  ),
  footer: GridTileBar(
    backgroundColor: Colors.black54,
    title: Text('Footer Text'),
  ),
  child: Image.network('https://example.com/image.jpg'),
)
```

**Structure:**
- **header** - Floats at top (often with GridTileBar)
- **child** - Main content (usually image or container)
- **footer** - Floats at bottom (often with GridTileBar)

### GridTileBar for Professional Headers/Footers

```dart
GridTileBar(
  backgroundColor: Colors.black45,
  leading: Icon(Icons.star, color: Colors.yellow),
  title: Text('Item Title', style: TextStyle(fontSize: 12)),
  subtitle: Text('Subtitle'),
  trailing: IconButton(
    icon: Icon(Icons.more_vert),
    onPressed: () {},
  ),
)
```

**Common Pattern: Image with Info Overlay**
```dart
itemBuilder: (context, index) {
  return GridTile(
    footer: GridTileBar(
      backgroundColor: Colors.black54,
      title: Text(items[index].name),
      trailing: Icon(Icons.favorite_border),
    ),
    child: Image.network(
      items[index].imageUrl,
      fit: BoxFit.cover,
    ),
  );
}
```

---

## Common Patterns

### API Data Display
```dart
// Assume we have: List<GiphyResult> gifs
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 8.0,
    mainAxisSpacing: 8.0,
  ),
  itemCount: gifs.length,
  itemBuilder: (context, index) {
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(gifs[index].title),
      ),
      child: Image.network(
        gifs[index].imageUrl,
        fit: BoxFit.cover,
      ),
    );
  },
)
```

### Clickable Grid Items
```dart
itemBuilder: (context, index) {
  return GestureDetector(
    onTap: () {
      // Handle tap
      print('Tapped item $index');
    },
    child: GridTile(
      child: Container(
        color: Colors.blue,
        child: Center(child: Text('Tap me')),
      ),
    ),
  );
}
```

### Responsive Column Count
```dart
// Use LayoutBuilder to get screen width
LayoutBuilder(
  builder: (context, constraints) {
    int columns = constraints.maxWidth > 600 ? 4 : 2;
    
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemBuilder: (context, index) {
        return Container(color: Colors.blue);
      },
    );
  },
)
```

---

## Important Rules

⚠️ **GridView Must Be Bounded**

GridView needs a height constraint or it will error.

```dart
// ❌ WRONG - Unbounded height
Column(
  children: [
    GridView.builder(...),  // Error!
  ],
)

// ✅ CORRECT - Wrapped in Expanded
Column(
  children: [
    Expanded(
      child: GridView.builder(...),
    ),
  ],
)

// ✅ ALSO CORRECT - Fixed height
Container(
  height: 400,
  child: GridView.builder(...),
)
```

⚠️ **Physics and Scrolling**

```dart
// Disable scrolling
physics: NeverScrollableScrollPhysics()

// Enable even when content fits
physics: AlwaysScrollableScrollPhysics()

// Default bouncy scroll (iOS style)
physics: BouncingScrollPhysics()
```

---

## Common Issues & Solutions

| Problem | Solution |
|---------|----------|
| RenderBox unbounded height error | Wrap GridView in `Expanded` or `Container` with height |
| Items not appearing | Check that `itemCount` matches data length |
| Spacing not working | Verify values are doubles: `8.0` not `8` |
| Grid won't scroll | Remove `physics: NeverScrollableScrollPhysics()` |
| Items different sizes | Use `mainAxisExtent` for consistent height |
| Too many/few columns | Adjust `crossAxisCount` or use MaxCrossAxisExtent |

---

## When Covered in Course
- **[Week 7B](../../weekly/7B.md)** - GridView.builder with Giphy API
- **Lab 02** - Gif Finder using dynamic GridView

## External Resources
- [Flutter GridView Documentation](https://api.flutter.dev/flutter/widgets/GridView-class.html)
- [Material Design Grid Lists](https://m3.material.io/components/lists/guidelines)

---
*Last updated: Week 7 | IGME-340 Reference*