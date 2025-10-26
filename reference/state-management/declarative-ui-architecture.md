# Declarative UI Architecture: Data Controls the UI

## The Core Principle

The Flutter docs state: **"Your data controls the UI, not the other way around."**

This is the foundation of Flutter's declarative architecture. Your UI is always a pure reflection of your current data state - you never modify the UI directly.

## The Flutter Way

```
User Action → Modify Data → setState() → UI Rebuilds from Data
```

**Not this:**
```
User Action → Update UI → Try to sync data → Hope they match
```

## Quick Example: The Difference

### ❌ Bad: UI Controls Data

```dart
// Anti-pattern: Business logic scattered in UI callbacks
TextField(
  onChanged: (value) {
    // Business logic mixed with UI
    if (value.length > 0) {
      _showValidation = true;
      _isValid = _validateEmail(value);
      _userEmail = value;
      _checkIfUserExists(value);
    }
  },
)
```

**Problems:**
- Business logic is trapped inside widget callbacks
- Hard to test without building widgets
- Logic is scattered across multiple UI elements
- Difficult to reuse the same logic elsewhere

### ✅ Good: Data Controls UI

```dart
class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  // Data is separate from UI
  String _userEmail = '';
  bool _showValidation = false;
  bool _isValid = false;
  
  // Business logic is separate
  void _handleEmailChange(String value) {
    setState(() {
      _userEmail = value;
      _showValidation = value.isNotEmpty;
      _isValid = _validateEmail(value);
    });
    
    if (_isValid) {
      _checkIfUserExists(value);
    }
  }
  
  bool _validateEmail(String email) {
    return email.contains('@') && email.contains('.');
  }
  
  @override
  Widget build(BuildContext context) {
    // UI is a pure function of data
    return Column(
      children: [
        TextField(
          onChanged: _handleEmailChange,
          decoration: InputDecoration(
            labelText: 'Email',
            errorText: _showValidation && !_isValid 
              ? 'Invalid email' 
              : null,
          ),
        ),
        if (_isValid)
          Text('✓ Valid email', style: TextStyle(color: Colors.green)),
      ],
    );
  }
}
```

**Benefits:**
- Business logic is testable without building widgets
- Logic is centralized and reusable
- UI automatically reflects data state
- Clear separation of concerns

## Real-World Example: Shopping Cart

### The Data Model

```dart
class CartItem {
  final String name;
  final double price;
  
  CartItem(this.name, this.price);
}

class ShoppingCart {
  List<CartItem> items = [];
  
  // Data provides computed properties
  double get total => items.fold(0, (sum, item) => sum + item.price);
  int get itemCount => items.length;
  bool get isEmpty => items.isEmpty;
  bool get canCheckout => !isEmpty;
  
  // Methods modify data
  void addItem(CartItem item) {
    items.add(item);
  }
  
  void removeItem(CartItem item) {
    items.remove(item);
  }
  
  void clear() {
    items.clear();
  }
}
```

### The UI (Pure Reflection of Data)

```dart
class CartScreen extends StatefulWidget {
  final ShoppingCart cart;
  
  CartScreen({required this.cart});
  
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // UI rebuilds whenever we call setState after modifying cart
  
  void _addItem() {
    setState(() {
      widget.cart.addItem(CartItem('New Item', 9.99));
    });
  }
  
  void _removeItem(CartItem item) {
    setState(() {
      widget.cart.removeItem(item);
    });
  }
  
  void _checkout() {
    // Business logic here
    print('Checking out with ${widget.cart.itemCount} items');
  }
  
  @override
  Widget build(BuildContext context) {
    // UI is completely determined by cart data
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart (${widget.cart.itemCount})'),
      ),
      body: Column(
        children: [
          // Cart header - driven by data
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total:', style: TextStyle(fontSize: 20)),
                Text(
                  '\$${widget.cart.total.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          
          Divider(),
          
          // Cart items or empty message - driven by data
          Expanded(
            child: widget.cart.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart, size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      Text('Your cart is empty', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: widget.cart.itemCount,
                  itemBuilder: (context, index) {
                    final item = widget.cart.items[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _removeItem(item),
                      ),
                    );
                  },
                ),
          ),
          
          // Checkout button - state driven by data
          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: widget.cart.canCheckout ? _checkout : null,
              child: Text('Checkout'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: Icon(Icons.add),
      ),
    );
  }
}
```

## What This Prevents

### Problem 1: UI and Data Out of Sync
```dart
// ❌ Bad: Manually updating UI elements
void updateTotal() {
  totalText.text = '$total';  // What if you forget to call this?
  itemCountBadge.text = '$count';  // Now UI and data disagree!
}
```

```dart
// ✅ Good: UI automatically reflects data
setState(() {
  cart.addItem(item);  // Change data
  // UI rebuilds automatically with correct total and count
});
```
**In 10A we will also examine the provider package, and you can actually then remove all setState calls if you are using this!**

### Problem 2: Scattered Business Logic
```dart
// ❌ Bad: Logic all over the place
ElevatedButton(
  onPressed: () {
    if (items.length > 0 && total < 1000 && !isProcessing) {
      // Complex business logic buried in UI
      processOrder();
    }
  },
)

TextButton(
  onPressed: () {
    if (items.length > 0 && total < 1000 && !isProcessing) {
      // Same logic duplicated!
      processOrder();
    }
  },
)
```

```dart
// ✅ Good: Logic centralized in data model
bool get canProcessOrder => 
  items.isNotEmpty && total < 1000 && !isProcessing;

// Now both buttons can use it
ElevatedButton(
  onPressed: canProcessOrder ? _processOrder : null,
)

TextButton(
  onPressed: canProcessOrder ? _processOrder : null,
)
```

### Problem 3: Hard to Test
```dart
// ❌ Bad: Can't test without building widgets
testWidgets('test checkout', (tester) async {
  await tester.pumpWidget(MyApp());
  await tester.tap(find.byIcon(Icons.add));
  await tester.pump();
  // Testing requires full widget tree!
});
```

```dart
// ✅ Good: Test data separately from UI
test('cart calculates total correctly', () {
  final cart = ShoppingCart();
  cart.addItem(CartItem('Item 1', 10.00));
  cart.addItem(CartItem('Item 2', 5.50));
  
  expect(cart.total, 15.50);
  expect(cart.itemCount, 2);
  // No widgets needed!
});
```

## Key Principles

### 1. Data is the Single Source of Truth
Your data model contains all the state. The UI is just a view of that state.

### 2. UI is a Pure Function of Data
Given the same data, `build()` always produces the same widget tree.

### 3. setState() is About Data, Not UI
You don't pass UI elements to `setState()`. You change your data, then call `setState()` so the UI rebuilds.

```dart
// ❌ Wrong thinking: "Update the UI"
setState(() {
  // Update text widget somehow?
});

// ✅ Correct thinking: "Change the data"
setState(() {
  _counter++;  // Change data, UI rebuilds automatically
});
```

### 4. Business Logic Lives in Data, Not Widgets
Calculations, validations, and business rules belong in your data model or separate functions, not scattered in `onPressed` callbacks.

## Why This Matters for Projects

### Week 9B: Clicker Game
We broke this principle by putting all the logic in button callbacks:

```dart
// ❌ What we did (for learning)
ElevatedButton(
  onPressed: () {
    setState(() {
      if (cookies >= 10) {
        cookies -= 10;
        cookiesPerClick += 1;
      }
    });
  },
)
```

**Week 10A** we'll fix this with Provider to separate data from UI.

### Project 2: API App
Your API calls and data processing should live in a data model, not in your UI widgets. This makes it easier to:
- Handle loading states
- Show error messages
- Retry failed requests
- Cache results

### Project 3: Your App
Complex apps become unmaintainable if business logic is scattered in UI callbacks. Separating data from UI makes your code:
- Testable
- Reusable
- Maintainable
- Easier to debug

## Connecting to Other Concepts

### Related Topics
- **[setState Basics](setstate-basics.md)** - How to trigger UI updates
- **Provider Pattern** *(Week 10A)* - Better state management at scale
- **ChangeNotifier** *(Week 10A)* - Observable data models

### When We Cover This
- **Week 9B**: Navigator basics (we broke this principle in clicker game)
- **Week 10A**: Provider pattern (proper way to implement this)
- **Week 10B**: Advanced state patterns
- Throughout all projects as a guiding principle

---

*This is a foundational concept in Flutter. Understanding "data controls UI" will make everything else make sense - especially state management patterns like Provider.*
