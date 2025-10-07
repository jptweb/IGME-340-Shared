# HTTP & API Integration Reference
> Some of this code goes well beyond what we covered in class, and maybe not all needed for your projects; but adding it to the reference guide so we have a nice resource to get us through all sorts of potential challenges we may encounter.
## Quick Example
```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> fetchData() async {
  var response = await http.get(
    Uri.parse('https://api.example.com/data')
  );
  
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print(data);
  }
}
```

---

## Table of Contents
- [Setup](#setup)
- [Making HTTP Requests](#making-http-requests)
- [JSON Parsing](#json-parsing)
- [API Authentication](#api-authentication)
- [Error Handling](#error-handling)

---

## Setup

### Installing the HTTP Package
```bash
flutter pub add http
```

### Required Imports
```dart
import 'package:http/http.dart' as http;
import 'dart:convert';  // For JSON encoding/decoding
```

**Important:** After adding the package, do a **hot restart** (not just hot reload) to load it properly.

---

## Making HTTP Requests

### GET Requests
Used for retrieving/reading data from an API.

```dart
Future<void> fetchUsers() async {
  final url = Uri.parse('https://api.example.com/users');
  
  try {
    var response = await http.get(url);
    
    if (response.statusCode == 200) {
      print('Success: ${response.body}');
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Network error: $e');
  }
}
```

**Critical:** `http.get()` requires a `Uri` object, not a string. Always use `Uri.parse()`.

### POST Requests
Used for sending data to the server (login, form submission, etc.).

```dart
Future<void> createUser() async {
  final url = Uri.parse('https://api.example.com/users');
  
  var response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'name': 'John Doe',
      'email': 'john@example.com'
    }),
  );
  
  if (response.statusCode == 201) {
    print('User created!');
  }
}
```

### Common HTTP Status Codes

| Code | Meaning | What It Means |
|------|---------|---------------|
| 200 | OK | Success - request worked |
| 201 | Created | Resource successfully created |
| 400 | Bad Request | Invalid data sent |
| 401 | Unauthorized | Authentication required |
| 403 | Forbidden | No permission |
| 404 | Not Found | Resource doesn't exist |
| 500 | Server Error | Server-side problem |

### Request Properties

```dart
var response = await http.get(url);

// Useful response properties:
response.statusCode    // 200, 404, etc.
response.body          // Response content as string
response.headers       // Response headers as Map
response.contentLength // Size of response
```

---

## JSON Parsing

### Basic JSON Decoding
```dart
var response = await http.get(url);

if (response.statusCode == 200) {
  // Convert JSON string to Dart Map/List
  var jsonData = jsonDecode(response.body);
  
  // Now you can access the data
  print(jsonData['name']);
}
```

### Navigating JSON Structures

**Simple Object:**
```dart
// JSON: {"name": "Alice", "age": 25}
var data = jsonDecode(response.body);
print(data['name']);  // "Alice"
print(data['age']);   // 25
```

**Nested Object:**
```dart
// JSON: {"user": {"name": "Bob", "address": {"city": "NYC"}}}
var data = jsonDecode(response.body);
print(data['user']['name']);              // "Bob"
print(data['user']['address']['city']);   // "NYC"
```

**Array/List:**
```dart
// JSON: [{"name": "Alice"}, {"name": "Bob"}]
List<dynamic> users = jsonDecode(response.body);
print(users[0]['name']);  // "Alice"
print(users[1]['name']);  // "Bob"
```

**Complex Nested Structure:**
```dart
// JSON: {"results": [{"user": {"name": "Alice"}}]}
var data = jsonDecode(response.body);
var results = data['results'];
print(results[0]['user']['name']);  // "Alice"
```

### Processing API Data Pattern
Extract only what you need into a clean structure:

```dart
Future<List<Map<String, dynamic>>> fetchUsers() async {
  var response = await http.get(Uri.parse(url));
  
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    List<Map<String, dynamic>> userList = [];
    
    // Extract specific fields
    for (var user in jsonData['users']) {
      userList.add({
        'id': user['id'],
        'name': user['name'],
        'email': user['email'],
      });
    }
    
    return userList;
  }
  
  throw Exception('Failed to load users');
}
```

### Debugging JSON Structures
Use breakpoints to explore unknown JSON:

```dart
var data = jsonDecode(response.body);
// Set breakpoint here ⬇️
print('Debug point');

// In debug console, type:
// data.keys          // See all top-level keys
// data['users']      // Explore nested data
// data['users'][0]   // Look at first item
```

---

## API Authentication

### Bearer Token Authentication
Many APIs require a token in the request header after login.

**Step 1: Login to Get Token**
```dart
Future<String> login(String username, String password) async {
  var response = await http.post(
    Uri.parse('https://api.example.com/auth/login'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'username': username,
      'password': password,
    }),
  );
  
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data['accessToken'];  // Save this!
  }
  
  throw Exception('Login failed');
}
```

**Step 2: Use Token in Requests**
```dart
Future<void> fetchProtectedData(String token) async {
  var response = await http.get(
    Uri.parse('https://api.example.com/user/me'),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );
  
  if (response.statusCode == 200) {
    print('Got protected data!');
  }
}
```

**Complete Auth Flow:**
```dart
class ApiService {
  String? _accessToken;
  
  Future<void> authenticate() async {
    _accessToken = await login('user', 'password');
  }
  
  Future<Map<String, dynamic>> getUser() async {
    if (_accessToken == null) {
      await authenticate();
    }
    
    var response = await http.get(
      Uri.parse('https://api.example.com/user'),
      headers: {
        'Authorization': 'Bearer $_accessToken',
      },
    );
    
    return jsonDecode(response.body);
  }
}
```

### API Key Authentication
Some APIs use simpler API keys in headers or query parameters.

**Header-based:**
```dart
var response = await http.get(
  Uri.parse('https://api.example.com/data'),
  headers: {
    'X-API-Key': 'your_api_key_here',
  },
);
```

**Query parameter-based:**
```dart
var url = Uri.parse('https://api.example.com/data?api_key=your_key_here');
var response = await http.get(url);
```

### When to Use GET vs POST

**Use GET when:**
- Retrieving/reading data
- Request parameters are not sensitive
- Request can be bookmarked/cached
- Examples: Search results, loading profiles, getting lists

**Use POST when:**
- Sending sensitive data (passwords, personal info)
- Creating or modifying resources
- Request body is large or complex
- Examples: Login, form submission, file uploads

**Important:** Even when "getting" data, use POST if you need to send credentials or sensitive parameters!

---

## Error Handling

### Complete Error Handling Pattern
```dart
Future<List<User>> fetchUsers() async {
  try {
    var response = await http.get(
      Uri.parse('https://api.example.com/users'),
    );
    
    // Check HTTP status
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return parseUsers(jsonData);
    } else if (response.statusCode == 401) {
      throw Exception('Authentication required');
    } else if (response.statusCode == 404) {
      throw Exception('Endpoint not found');
    } else {
      throw Exception('HTTP ${response.statusCode}');
    }
  } on FormatException {
    throw Exception('Invalid JSON format');
  } on http.ClientException {
    throw Exception('Network connection failed');
  } catch (e) {
    throw Exception('Unexpected error: $e');
  }
}
```

### Using Error States in UI
```dart
class _DataPageState extends State<DataPage> {
  List<dynamic> data = [];
  bool isLoading = false;
  String? errorMessage;
  
  Future<void> loadData() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    
    try {
      var response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        setState(() {
          data = jsonDecode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception('Failed: ${response.statusCode}');
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
    
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(data[index]['name']));
      },
    );
  }
}
```

### Timeout Handling
```dart
Future<void> fetchWithTimeout() async {
  try {
    var response = await http.get(url).timeout(
      Duration(seconds: 10),
      onTimeout: () {
        throw TimeoutException('Request took too long');
      },
    );
  } on TimeoutException {
    print('Request timed out');
  }
}
```

---


## Common Issues & Solutions

| Problem | Solution |
|---------|----------|
| "type 'String' is not a subtype of 'Uri'" | Use `Uri.parse(url)` not just the string |
| JSON decode errors | Verify response with breakpoint, check structure |
| Status 401/403 | Check authentication token is included correctly |
| CORS errors (web only) | API must allow web requests, or use proxy |
| Response body empty | Check status code first, log full response |
| Can't access nested data | Use debug console to inspect full JSON structure |

---

## When Covered in Course
- **[Week 7A](../../weekly/7A.md)** - HTTP requests, JSON parsing, authentication patterns
- **[Week 7B](../../weekly/7B.md)** - Giphy API integration in GIF Finder lab
- **Project 2** - Extensive API integration practice

## External Resources
- [HTTP Package Documentation](https://pub.dev/packages/http)
- [Working with JSON in Flutter](https://flutter.dev/docs/development/data-and-backend/json)
- [DummyJSON API for Testing](https://dummyjson.com/)
- [Hopscotch API Testing Tool](https://hoppscotch.io/)

---
*Last updated: Week 7A | IGME-340 Reference*
