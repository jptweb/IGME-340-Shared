# Async/Await Fundamentals Reference

## Quick Example
```dart
// Basic async function that waits for data
Future<String> fetchUserName() async {
  await Future.delayed(Duration(seconds: 2));
  return 'John Doe';
}

// Using the async function
void displayUser() async {
  String name = await fetchUserName();
  print('User: $name');
}
```

## Core Concepts

### What is a Future?
A `Future` represents a value that will be available at some point in the future - like a promise or receipt for data that hasn't arrived yet.

```dart
// This function returns immediately with a Future
Future<int> slowCalculation() {
  return Future.delayed(Duration(seconds: 2), () => 42);
}

// Without await - you get a Future object
var result = slowCalculation();
print(result);  // Prints: Instance of 'Future<int>'

// With await - you get the actual value
var result = await slowCalculation();
print(result);  // Prints: 42 (after 2 seconds)
```

### The async Keyword
Functions marked `async` automatically return a `Future` and can use `await` inside them.

```dart
// Regular function
String getName() {
  return 'Alice';
}

// Async function (returns Future<String>)
Future<String> getName() async {
  return 'Alice';
}

// Async function with await
Future<String> fetchName() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Alice';
}
```

### The await Keyword
`await` pauses execution until a Future completes, then returns the actual value.

```dart
Future<void> example() async {
  print('Start');
  
  // Without await - continues immediately
  fetchData();  // Future starts but doesn't wait
  print('Middle');  // Prints right away
  
  // With await - waits for completion
  var data = await fetchData();  // Waits here
  print('Got: $data');  // Prints after data arrives
}
```

**Critical Rule:** You can ONLY use `await` inside `async` functions!

## Common Patterns

### Pattern 1: Simple API Call
```dart
Future<void> loadUserData() async {
  // Mark function as async
  var data = await http.get(Uri.parse('https://api.example.com/user'));
  print('Data loaded: ${data.body}');
}
```

### Pattern 2: Multiple Sequential Awaits
```dart
Future<void> loadMultipleThings() async {
  var user = await fetchUser();      // Wait for user
  var posts = await fetchPosts();    // Then wait for posts
  var comments = await fetchComments(); // Then wait for comments
  
  // All three have completed by here
  print('Everything loaded!');
}
```

### Pattern 3: Parallel Awaits with Future.wait
```dart
Future<void> loadInParallel() async {
  // Start all three at once
  var results = await Future.wait([
    fetchUser(),
    fetchPosts(),
    fetchComments(),
  ]);
  
  // All complete at roughly the same time
  var user = results[0];
  var posts = results[1];
  var comments = results[2];
}
```

### Pattern 4: Async Function Called from Sync Context
```dart
// ❌ WRONG - Can't await in non-async function
void initState() {
  var data = await fetchData();  // ERROR!
}

// ✅ CORRECT - Call async function without await
void initState() {
  loadData();  // Starts but doesn't wait
}

Future<void> loadData() async {
  var data = await fetchData();
  setState(() {
    // Update UI
  });
}
```

## Error Handling

### Try-Catch Pattern
Always wrap async operations in try-catch blocks:

```dart
Future<void> fetchData() async {
  try {
    var response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('Success: $data');
    } else {
      print('HTTP Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Network error: $e');
  }
}
```

### Multiple Catch Blocks
Handle different error types separately:

```dart
Future<void> fetchData() async {
  try {
    var data = await riskyOperation();
  } on FormatException {
    print('Bad data format');
  } on TimeoutException {
    print('Request timed out');
  } catch (e) {
    print('Unknown error: $e');
  }
}
```

### Finally Block
Code that runs whether success or failure:

```dart
Future<void> fetchData() async {
  try {
    showLoadingSpinner();
    var data = await http.get(url);
  } catch (e) {
    showError(e);
  } finally {
    hideLoadingSpinner();  // Always runs
  }
}
```

## Common Mistakes & Fixes

### Mistake 1: Forgetting await
```dart
// ❌ WRONG - Missing await
Future<void> loadUser() async {
  var user = fetchUser();  // Returns Future, not user data!
  print(user.name);  // ERROR: Future has no 'name' property
}

// ✅ CORRECT
Future<void> loadUser() async {
  var user = await fetchUser();  // Actually waits for data
  print(user.name);  // Works!
}
```

### Mistake 2: Using await outside async
```dart
// ❌ WRONG - await requires async function
void loadData() {
  var data = await fetchData();  // ERROR!
}

// ✅ CORRECT
Future<void> loadData() async {
  var data = await fetchData();
}
```

### Mistake 3: Not Handling Errors
```dart
// ❌ RISKY - No error handling
Future<void> loadData() async {
  var data = await fetchData();
  useData(data);
}

// ✅ SAFE
Future<void> loadData() async {
  try {
    var data = await fetchData();
    useData(data);
  } catch (e) {
    print('Failed to load: $e');
  }
}
```

### Mistake 4: Blocking the UI
```dart
// ❌ WRONG - This freezes the app!
void loadData() {
  var data = fetchData().then((data) => /* ... */);  // Old style
}

// ✅ CORRECT - Properly async
Future<void> loadData() async {
  var data = await fetchData();  // Doesn't block UI
}
```

## When to Use Async/Await

**Always use for:**
- HTTP/API calls
- Database queries
- File I/O operations
- Any operation that takes time

**Don't need for:**
- Simple calculations
- Widget building
- Accessing variables
- Basic Dart operations

## Real-World Example

```dart
class _UserProfilePageState extends State<UserProfilePage> {
  User? currentUser;
  bool isLoading = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadUserProfile();  // Start loading
  }

  Future<void> loadUserProfile() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      // Simulate API call
      await Future.delayed(Duration(seconds: 2));
      
      var response = await http.get(
        Uri.parse('https://api.example.com/user/123')
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        setState(() {
          currentUser = User.fromJson(data);
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load user');
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return CircularProgressIndicator();
    }
    
    if (errorMessage != null) {
      return Text(errorMessage!);
    }
    
    return Text('Hello ${currentUser?.name}');
  }
}
```

## When Covered in Course
- **[Week 7A](../../weekly/7A.md)** - Introduction to async/await with DartPad examples
- **Week 7A** - First HTTP requests in Flutter
- **Week 9A+** - Used extensively throughout remaining course

## External Resources
- [Dart Async Programming Documentation](https://dart.dev/codelabs/async-await)
- [Flutter Async/Await Tutorial](https://flutter.dev/docs/cookbook/networking/fetch-data)

---
*Last updated: Week 7A | IGME-340 Reference*
