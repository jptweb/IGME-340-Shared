```markdown
# ListView Reference

## Quick Example
```dart
// Basic ListView
Container(
  height: 200, // Must have bounded height!
  child: ListView(
    children: [
      Text('Item 1'),
      Text('Item 2'),
      Text('Item 3'),
    ],
  ),
)

// ListView.builder (for dynamic data)
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(items[index]),
    );
  },
)
```

## Core Concepts

### Basic ListView
Simple scrolling list of widgets:

```dart
Container(
  height: 200,
  child: ListView(
    padding: EdgeInsets.all(10),
    children: [
      Text('List Item 1'),
      Text('List Item 2'),
      Text('List Item 3'),
      Text('List Item 4'),
    ],
  ),
)
```

**Critical:** ListView must be in a bounded container (with height) or wrapped in Expanded/Flexible.

### Horizontal ListView
Change scroll direction:

```dart
Container(
  height: 200,
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: [
      Container(width: 150, color: Colors.red),
      Container(width: 150, color: Colors.blue),
      Container(width: 150, color: Colors.green),
    ],
  ),
)
```

### ListView.builder - Dynamic Lists
Efficient for large or dynamic lists (only builds visible items):

```dart
List<String> items = ['Apple', 'Banana', 'Coconut', 'Durian'];

ListView.builder(
  itemCount: items.length, // Optional, infinite if omitted!
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(items[index]),
    );
  },
)
```

**Why Use builder?**
- Only creates widgets that are visible
- Efficient for large lists (100+ items)
- Perfect for API data
- Can be infinite scrolling if no itemCount

## Common Patterns

### ListTile for Consistent Formatting
```dart
List<Map<String, dynamic>> inventory = [
  {'name': 'Apple', 'price': 10},
  {'name': 'Banana', 'price': 20},
];

ListView.builder(
  itemCount: inventory.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(inventory[index]['name']),
      subtitle: Text('In stock'),
      trailing: Text('\$${inventory[index]['price']}'),
      leading: Icon(Icons.shopping_cart),
      onTap: () {
        print('Tapped: ${inventory[index]['name']}');
      },
    );
  },
)
```

### Styled ListView with Dividers
```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return Column(
      children: [
        ListTile(
          title: Text(items[index]),
          tileColor: index % 2 == 0 ? Colors.grey[100] : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        if (index < items.length - 1) Divider(), // Divider between items
      ],
    );
  },
)
```

### ListView with Search Results (API Pattern)
```dart
List<Map<String, dynamic>> searchResults = [];

// In your API call:
setState(() {
  searchResults = apiData;
});

// Display results:
searchResults.isEmpty
  ? Center(child: Text('No results'))
  : ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index]['title']),
          subtitle: Text(searchResults[index]['description']),
        );
      },
    )
```

### Reverse ListView (Chat Pattern)
```dart
ListView.builder(
  reverse: true, // Newest at bottom, scroll starts at bottom
  itemCount: messages.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(messages[index]),
    );
  },
)
```

### ListView with Loading Indicator
```dart
bool isLoading = true;

isLoading
  ? Center(child: CircularProgressIndicator())
  : ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    )
```

## Properties Reference

### ListView Properties
| Property | Type | Purpose |
|----------|------|---------|
| children | List<Widget> | Static list of widgets |
| scrollDirection | Axis | Vertical (default) or horizontal |
| reverse | bool | Reverse the order of items |
| padding | EdgeInsets | Padding around entire list |
| physics | ScrollPhysics? | Scroll behavior (bounce, clamp, etc.) |

### ListView.builder Properties
| Property | Type | Purpose |
|----------|------|---------|
| itemCount | int? | Number of items (infinite if null) |
| itemBuilder | Function | Builds each item on demand |
| scrollDirection | Axis | Vertical or horizontal |
| reverse | bool | Reverse order |

### ListTile Properties
| Property | Type | Purpose |
|----------|------|---------|
| title | Widget | Main text |
| subtitle | Widget? | Secondary text below title |
| leading | Widget? | Widget before title (usually Icon) |
| trailing | Widget? | Widget after title (often price/icon) |
| onTap | Function? | Callback when tapped |
| tileColor | Color? | Background color |
| shape | ShapeBorder? | Border and corner styling |

## Important Rules

⚠️ **ListView Needs Bounded Height**
```dart
// ❌ WRONG - RenderBox error
Column(
  children: [
    ListView(...), // ERROR! Unbounded height
  ],
)

// ✅ CORRECT - Wrap in bounded container
Column(
  children: [
    Container(
      height: 200,
      child: ListView(...),
    ),
  ],
)

// ✅ ALSO CORRECT - Use Expanded
Column(
  children: [
    Expanded(
      child: ListView(...),
    ),
  ],
)
```

⚠️ **itemCount Matters**
```dart
// ❌ DANGEROUS - Infinite scrolling list
ListView.builder(
  itemBuilder: (context, index) {
    return Text('Item $index'); // Infinite!
  },
)

// ✅ CORRECT - Bounded by data
ListView.builder(
  itemCount: myData.length,
  itemBuilder: (context, index) {
    return Text('Item $index');
  },
)
```

⚠️ **Use builder for Dynamic Data**
```dart
// ❌ INEFFICIENT - All items created at once
ListView(
  children: apiData.map((item) {
    return ListTile(title: Text(item['name']));
  }).toList(),
)

// ✅ CORRECT - Only visible items created
ListView.builder(
  itemCount: apiData.length,
  itemBuilder: (context, index) {
    return ListTile(title: Text(apiData[index]['name']));
  },
)
```

## Common Issues & Solutions

| Problem | Solution |
|---------|----------|
| "RenderBox was not laid out" | Wrap ListView in Container with height or Expanded |
| List doesn't scroll | Check if itemCount matches data length |
| Performance issues with large lists | Use ListView.builder instead of ListView with children |
| Items don't update after setState | Verify itemCount changes with data |
| Want horizontal scrolling | Set `scrollDirection: Axis.horizontal` |
| List appears empty | Check itemCount > 0 and builder returns widget |

## Performance Tips

```dart
// ✅ GOOD - Efficient for any size list
ListView.builder(
  itemCount: 1000,
  itemBuilder: (context, index) {
    return ListTile(title: Text('Item $index'));
  },
)

// ❌ BAD - Creates 1000 widgets at once
ListView(
  children: List.generate(1000, (index) {
    return ListTile(title: Text('Item $index'));
  }),
)
```

## When Covered in Course
- **[Week 6B](../../weekly/6B.md)** - ListView and ListView.builder implementation
- **Project 2** - Essential for displaying API search results

## External Resources
- [ListView Documentation](https://api.flutter.dev/flutter/widgets/ListView-class.html)
- [ListView.builder Documentation](https://api.flutter.dev/flutter/widgets/ListView/ListView.builder.html)
- [ListTile Documentation](https://api.flutter.dev/flutter/material/ListTile-class.html)

---
*Last updated: Week 6B | IGME-340 Reference*
```

---

You can now copy each of these three sections and paste them into their respective files in your repository. Let me know if you need any adjustments to the content!