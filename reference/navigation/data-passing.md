# Data Passing Between Pages

**Quick Reference:** Send data TO pages when navigating, and receive data BACK when pages close.

> **📌 When Covered:** [Week 9B](../../weekly/9B.md) - Navigation with data flow

---

## Quick Example

### Sending Data TO a Page

```dart
// Send data when navigating
Navigator.pushNamed(
  context,
  '/detail',
  arguments: {
    'id': 123,
    'name': 'Product Name',
  },
);
```

### Receiving Data IN a Page

```dart
// Receive data in the destination page
@override
Widget build(BuildContext context) {
  final Map args = ModalRoute.of(context)?.settings.arguments as Map;
  final int id = args['id'];
  final String name = args['name'];
  
  return Scaffold(
    appBar: AppBar(title: Text(name)),
    body: Text('Product ID: $id'),
  );
}
```

### Receiving Data BACK from a Page

```dart
// Send data back when closing
Navigator.pop(context, 'Some return value');

// Receive returned data
String result = await Navigator.pushNamed(
  context,
  '/detail',
  arguments: {'id': 123},
) as String;

print(result);  // "Some return value"
```

---

## Sending Data TO Pages

### Method 1: Using Named Routes (Recommended)

```dart
// Send data with arguments parameter
Navigator.pushNamed(
  context,
  '/product-detail',
  arguments: {
    'id': 42,
    'name': 'Flutter Book',
    'price': 29.99,
  },
);
```

**What you can send:**
- Single values: `arguments: 123` or `arguments: 'Hello'`
- Maps: `arguments: {'key': 'value'}`
- Lists: `arguments: [1, 2, 3]`
- Custom objects: `arguments: Product(id: 1, name: 'Item')`

### Method 2: Using Constructor Parameters

```dart
// Define page with constructor parameters
class DetailPage extends StatelessWidget {
  final int id;
  final String name;
  
  DetailPage({required this.id, required this.name});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Text('ID: $id'),
    );
  }
}

// Navigate with direct parameters
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailPage(id: 42, name: 'Product'),
  ),
);
```

**When to use:**
- Basic navigation (not named routes)
- Type-safe parameter passing
- Required parameters with compile-time checking

---

## Receiving Data IN Pages

### Using ModalRoute (Named Routes)

```dart
@override
Widget build(BuildContext context) {
  // Get arguments from route settings
  final args = ModalRoute.of(context)?.settings.arguments;
  
  // Method 1: Cast to expected type
  final Map data = args as Map;
  final int id = data['id'];
  final String name = data['name'];
  
  // Method 2: Direct casting and access
  final int productId = (args as Map)['id'];
  
  return Scaffold(
    appBar: AppBar(title: Text(name)),
    body: Text('Product ID: $id'),
  );
}
```

### Null Safety Handling

```dart
// Handle cases where arguments might be null
final args = ModalRoute.of(context)?.settings.arguments;

if (args == null) {
  // No arguments provided - handle error
  return Scaffold(
    body: Text('No data provided'),
  );
}

final Map data = args as Map;
// Now safe to use data
```

### Type Safety with Arguments

```dart
// Extract arguments safely
final args = ModalRoute.of(context)?.settings.arguments;

if (args is Map) {
  final int? id = args['id'] as int?;
  final String? name = args['name'] as String?;
  
  if (id != null && name != null) {
    // Both values exist, safe to use
  } else {
    // Handle missing values
  }
}
```

---

## Sending Data BACK from Pages

### Basic Return Value

```dart
// In the detail page, return data when popping
ElevatedButton(
  onPressed: () {
    Navigator.pop(context, 'User clicked Save');
  },
  child: Text('Save'),
)
```

### Receiving Returned Data

```dart
// Use await to receive the returned value
ElevatedButton(
  onPressed: () async {  // Made async
    final result = await Navigator.pushNamed(
      context,
      '/detail',
      arguments: {'id': 123},
    );
    
    // result contains the value from pop()
    print(result);  // "User clicked Save"
    
    // Show in SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(result as String)),
    );
  },
  child: Text('Open Detail'),
)
```

### Return Complex Data

```dart
// Return a Map with multiple values
Navigator.pop(context, {
  'action': 'saved',
  'id': 123,
  'message': 'Product updated successfully',
});

// Receive and use
final Map result = await Navigator.pushNamed(
  context,
  '/edit',
) as Map;

String action = result['action'];
int id = result['id'];
String message = result['message'];
```

---

## Common Patterns

### Pattern 1: Simple ID Passing

```dart
// Send just an ID
Navigator.pushNamed(
  context,
  '/details',
  arguments: 42,  // Just the ID
);

// Receive the ID
final int id = ModalRoute.of(context)?.settings.arguments as int;
```

### Pattern 2: Map with Multiple Values

```dart
// Send multiple values
Navigator.pushNamed(
  context,
  '/details',
  arguments: {
    'id': 42,
    'title': 'Product Name',
    'price': 29.99,
    'inStock': true,
  },
);

// Receive and use
final Map args = ModalRoute.of(context)?.settings.arguments as Map;
final int id = args['id'];
final String title = args['title'];
final double price = args['price'];
final bool inStock = args['inStock'];
```

### Pattern 3: Custom Object Passing

```dart
// Define a data class
class Product {
  final int id;
  final String name;
  final double price;
  
  Product({required this.id, required this.name, required this.price});
}

// Send custom object
Navigator.pushNamed(
  context,
  '/details',
  arguments: Product(id: 42, name: 'Book', price: 29.99),
);

// Receive custom object
final Product product = ModalRoute.of(context)?.settings.arguments as Product;
Text('${product.name} costs \$${product.price}');
```

### Pattern 4: List Data Passing

```dart
// Send a list
Navigator.pushNamed(
  context,
  '/cart',
  arguments: [
    {'id': 1, 'name': 'Item 1'},
    {'id': 2, 'name': 'Item 2'},
    {'id': 3, 'name': 'Item 3'},
  ],
);

// Receive list
final List<Map> items = ModalRoute.of(context)?.settings.arguments as List<Map>;

// Display in ListView
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(items[index]['name']),
    );
  },
)
```

### Pattern 5: Edit/Save Flow with Return Data

```dart
// Open edit page and wait for result
ElevatedButton(
  onPressed: () async {
    final result = await Navigator.pushNamed(
      context,
      '/edit',
      arguments: {'id': 123, 'name': 'Original Name'},
    ) as Map?;
    
    if (result != null && result['saved'] == true) {
      setState(() {
        // Update UI with new data
        itemName = result['name'];
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Changes saved!')),
      );
    }
  },
  child: Text('Edit'),
)

// In edit page, save and return data
ElevatedButton(
  onPressed: () {
    // Save logic here...
    
    Navigator.pop(context, {
      'saved': true,
      'name': updatedName,
    });
  },
  child: Text('Save'),
)
```

### Pattern 6: Yes/No Confirmation Dialog

```dart
// Ask for confirmation
bool? confirmed = await showDialog<bool>(
  context: context,
  builder: (context) => AlertDialog(
    title: Text('Confirm Delete'),
    content: Text('Are you sure you want to delete this item?'),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context, false),
        child: Text('Cancel'),
      ),
      TextButton(
        onPressed: () => Navigator.pop(context, true),
        child: Text('Delete'),
      ),
    ],
  ),
);

if (confirmed == true) {
  // User confirmed, do the deletion
  deleteItem();
}
```

---

## Data Flow Direction

### TO Page (Arguments)
```
Page A  ─────arguments────>  Page B
        Navigator.pushNamed(
          context,
          '/pageB',
          arguments: data,
        )
```

### FROM Page (Return Value)
```
Page A  <────result─────  Page B
        await Navigator.pushNamed(...)
                                  Navigator.pop(context, data)
```

### Both Directions
```
Page A  ─────arguments────>  Page B
        await Navigator.pushNamed(
          context,
          '/pageB',
          arguments: sendData,
        )
        <────result─────
                                  Navigator.pop(context, returnData)
```

---

## Important Rules

### ✅ DO:

1. **Always cast arguments to expected type**
   ```dart
   final Map args = ModalRoute.of(context)?.settings.arguments as Map;
   ```

2. **Handle null arguments gracefully**
   ```dart
   final args = ModalRoute.of(context)?.settings.arguments;
   if (args != null) {
     // Use args
   }
   ```

3. **Use await when expecting return values**
   ```dart
   final result = await Navigator.pushNamed(context, '/page');
   ```

4. **Make functions async when using await**
   ```dart
   onPressed: () async {
     await Navigator.pushNamed(...);
   }
   ```

### ❌ DON'T:

1. **Don't forget to cast arguments**
   ```dart
   final args = ModalRoute.of(context)?.settings.arguments;
   // ❌ args is dynamic, not type-safe
   
   final Map args = ModalRoute.of(context)?.settings.arguments as Map;
   // ✅ Properly casted
   ```

2. **Don't use await without async**
   ```dart
   onPressed: () {
     await Navigator.pushNamed(...);  // ❌ Error!
   }
   
   onPressed: () async {
     await Navigator.pushNamed(...);  // ✅ Correct
   }
   ```

3. **Don't assume arguments exist**
   ```dart
   // ❌ Will crash if no arguments
   final Map args = ModalRoute.of(context)!.settings.arguments as Map;
   
   // ✅ Safe with null check
   final args = ModalRoute.of(context)?.settings.arguments;
   if (args != null) { ... }
   ```

---

## Common Errors & Solutions

### Error: "Null check operator used on null value"

**Cause:** Arguments are null but you're trying to access them.

**Solution:**
```dart
// Add null check
final args = ModalRoute.of(context)?.settings.arguments;
if (args == null) {
  return Text('No data provided');
}
// Now safe to use args
```

### Error: "type 'Null' is not a subtype of type 'Map<dynamic, dynamic>'"

**Cause:** No arguments were passed but you're trying to cast to Map.

**Solution:**
```dart
// Check before casting
final args = ModalRoute.of(context)?.settings.arguments;
if (args is Map) {
  // Safe to use as Map
  final data = args as Map;
} else {
  // Handle case where args is not a Map
}
```

### Error: "await is only valid in async functions"

**Cause:** Using await in a non-async function.

**Solution:**
```dart
// ❌ Wrong
onPressed: () {
  await Navigator.pushNamed(...);
}

// ✅ Correct
onPressed: () async {
  await Navigator.pushNamed(...);
}
```

---

## Advanced: Type-Safe Arguments

### Create an Arguments Class

```dart
class ProductDetailArguments {
  final int id;
  final String name;
  final double price;
  
  ProductDetailArguments({
    required this.id,
    required this.name,
    required this.price,
  });
}

// Send with type safety
Navigator.pushNamed(
  context,
  '/product-detail',
  arguments: ProductDetailArguments(
    id: 42,
    name: 'Flutter Book',
    price: 29.99,
  ),
);

// Receive with type safety
final ProductDetailArguments args = 
    ModalRoute.of(context)?.settings.arguments as ProductDetailArguments;

Text('${args.name} - \$${args.price}');
```

**Benefits:**
- Type safety at compile time
- IDE autocomplete for properties
- Self-documenting code
- Easier refactoring

---

## Complete Example: Data Passing App

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ListPage(),
        '/detail': (context) => DetailPage(),
        '/edit': (context) => EditPage(),
      },
    );
  }
}

// List of items
class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Map<String, dynamic>> items = [
    {'id': 1, 'name': 'Item 1', 'description': 'First item'},
    {'id': 2, 'name': 'Item 2', 'description': 'Second item'},
    {'id': 3, 'name': 'Item 3', 'description': 'Third item'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Items List')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]['name']),
            subtitle: Text(items[index]['description']),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () async {
              // Send data TO detail page
              final result = await Navigator.pushNamed(
                context,
                '/detail',
                arguments: items[index],
              );
              
              // Receive data BACK from detail page
              if (result != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(result as String)),
                );
              }
            },
          );
        },
      ),
    );
  }
}

// Detail page - receives data
class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Receive arguments
    final Map<String, dynamic> item = 
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    
    return Scaffold(
      appBar: AppBar(title: Text(item['name'])),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID: ${item['id']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Name: ${item['name']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Description: ${item['description']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // Go to edit page
                    final editResult = await Navigator.pushNamed(
                      context,
                      '/edit',
                      arguments: item,
                    );
                    
                    if (editResult != null) {
                      // Return edited data back to list
                      Navigator.pop(context, 'Item updated!');
                    }
                  },
                  child: Text('Edit'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Return data when going back
                    Navigator.pop(context, 'Viewed ${item['name']}');
                  },
                  child: Text('Back'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Edit page - receives and returns data
class EditPage extends StatefulWidget {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController nameController;
  late TextEditingController descController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    // Get item data
    final Map<String, dynamic> item = 
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    
    nameController = TextEditingController(text: item['name']);
    descController = TextEditingController(text: item['description']);
  }

  @override
  void dispose() {
    nameController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Item')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: descController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Return updated data
                    Navigator.pop(context, {
                      'name': nameController.text,
                      'description': descController.text,
                    });
                  },
                  child: Text('Save'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## Related Topics

- [Basic Navigation](basic-navigation.md) - Navigator fundamentals
- [Named Routes](named-routes.md) - Route configuration and management
- [Dialogs & Alerts](dialogs-alerts.md) - Returning data from dialogs

---

*Last updated: Week 9B | Fall 2025*
