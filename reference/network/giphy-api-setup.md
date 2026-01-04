# GIPHY API Setup Guide
> This documentation walks you through the process of completing the Giffinder Lab. Keep in mind though for project 2 you will need to navigate much of this process
> on your own for the API you choose. So do use the documentation; but try and understand each step of the process so you can do this on your own later.
> The good news is that most APIs have comprehensive documenation and examples that mirror what you will find below (although they may be written for another programming language and not flutter.
## Getting Your API Key

GIPHY provides free API access with generous rate limits for development and educational use. Here's how to get started.

### Step 1: Create a GIPHY Developer Account

1. Go to [GIPHY Developers Dashboard](https://developers.giphy.com/)
2. Click **"Create an Account"** (top right)
3. Sign up with email or use social login
4. Verify your email address

### Step 2: Create an API Key

1. Once logged in, go to the [Developer Dashboard](https://developers.giphy.com/dashboard/)
2. Click **"Create an App"**
3. Choose **"API"** (NOT "SDK")
   - **Why API, not SDK?** The SDK option is for native mobile integrations. Since Flutter is multiplatform and we're making HTTP requests directly, the regular API key works across iOS, Android, and web.

### Step 3: Fill Out App Information

You'll need to provide some basic information:

**App Name:** Something descriptive like "IGME 340 GIF Finder" or "Flutter Learning Project"

**App Description:** Brief description like "Educational project for RIT IGME-340 course" or "Learning Flutter with GIPHY API"

**Platform:** Select **"Other"**
- While GIPHY suggests creating separate keys for iOS/Android/Web, selecting "Other" works perfectly for multiplatform Flutter development
- You can always create platform-specific keys later if needed for production apps

### Step 4: Accept Terms & Create

1. Check the box to agree to GIPHY's API Terms of Service
2. Click **"Create App"**
3. Your API key will be generated immediately

### Understanding Your API Key

After creation, you'll see your dashboard with:

- **API Key:** A long string like `dc6zaTOxFJmzC` (this is the free public beta key - don't use it, get your own!)
- **Status:** Beta (rate limited to 100 searches/API calls per hour)
- **Usage Statistics:** Track your API calls

**Beta vs. Production Keys:**
- **Beta:** 100 API calls per hour - plenty for development and coursework
- **Production:** Need more than 100/hour? Upgrade through your dashboard (not necessary for class)

---

## 🔐 API Key Security

### Never Share Your API Key

⚠️ **IMPORTANT:** Your API key is like a password. Keep it secure!

**DO NOT:**
- Commit API keys to public GitHub repositories
- Share your key in Slack or other public channels
- Include your key in screenshots or screen recordings
- Use someone else's API key (each student needs their own)

**WHY IT MATTERS:**
- Others could use your API quota
- GIPHY can track misuse to your account
- Professional habit: API keys = credentials

### Best Practices for Flutter Projects

**Option 1: Environment Variables (Recommended for Production)**
```dart
// Store in environment variable
const String apiKey = String.fromEnvironment('GIPHY_API_KEY');
```

**Option 2: Separate Config File (Good for Learning)**
```dart
// Create lib/config.dart
class Config {
  static const String giphyApiKey = 'YOUR_KEY_HERE';
}

// Add config.dart to .gitignore
```

**Option 3: Direct in Code (Okay for Class Projects)**
```dart
// For IGME-340 coursework, this is acceptable
// Just don't push to public repos
final String apiKey = 'your_actual_key_here';
```

**For Class Submissions:**
- If submitting via MyCourses: Including API key is fine (not public)
- If submitting via GitHub: Remove key and include setup instructions
- When in doubt: Ask instructor

---

## Using Your API Key with GIPHY

### Basic API Call Structure

All GIPHY API endpoints follow this pattern:

```
https://api.giphy.com/v1/{endpoint}?api_key=YOUR_API_KEY&{other_parameters}
```

### Common GIPHY Endpoints

#### Search GIFs
```
GET https://api.giphy.com/v1/gifs/search
```

**Required Parameters:**
- `api_key` - Your API key
- `q` - Search query (e.g., "cats", "funny", "reaction")

**Optional Parameters:**
- `limit` - Number of results (default 25, max 50)
- `offset` - Results offset for pagination
- `rating` - Content rating (g, pg, pg-13, r)
- `lang` - Language (default en)

**Example:**
```
https://api.giphy.com/v1/gifs/search?api_key=YOUR_KEY&q=puppies&limit=25
```

#### Trending GIFs
```
GET https://api.giphy.com/v1/gifs/trending
```

**Required Parameters:**
- `api_key` - Your API key

**Optional Parameters:**
- `limit` - Number of results (default 25, max 50)
- `rating` - Content rating

**Example:**
```
https://api.giphy.com/v1/gifs/trending?api_key=YOUR_KEY&limit=10
```

#### Random GIF
```
GET https://api.giphy.com/v1/gifs/random
```

**Required Parameters:**
- `api_key` - Your API key

**Optional Parameters:**
- `tag` - Tag to limit randomness (e.g., "cats")
- `rating` - Content rating

**Example:**
```
https://api.giphy.com/v1/gifs/random?api_key=YOUR_KEY&tag=excited
```

#### GIF by ID
```
GET https://api.giphy.com/v1/gifs/{gif_id}
```

**Required Parameters:**
- `api_key` - Your API key
- `{gif_id}` - The GIF ID from search results

**Example:**
```
https://api.giphy.com/v1/gifs/3o7btPCcdNniyf0ArS?api_key=YOUR_KEY
```

### Understanding the Response

GIPHY returns JSON with this structure:

```json
{
  "data": [...],        // Array of GIF objects (or single object for random/ID endpoints)
  "pagination": {...},  // Pagination info (search/trending only)
  "meta": {            // Response metadata
    "status": 200,
    "msg": "OK",
    "response_id": "..."
  }
}
```

**Top-Level Structure:**
- `data` - Contains the GIF results (this is what you'll work with most)
- `pagination` - Information about result pages (total count, offset)
- `meta` - Response status and metadata

**Each GIF Object Contains:**
- `id` - Unique GIF identifier
- `title` - GIF title/description  
- `images` - Object containing multiple image sizes/formats
- `url` - Link to the GIPHY page for this GIF
- `rating` - Content rating
- Plus many other fields!

**Available Image Sizes:**
The `images` object contains many size variations:
- `original` - Full size (can be very large!)
- `downsized` - Smaller optimized version
- `fixed_width` - Fixed width (usually 200px)
- `fixed_height` - Fixed height (usually 200px) 
- `preview_gif` - Tiny preview version
- And several others...

> **🔍 Important:** You'll need to explore the actual JSON response yourself to understand the exact structure and choose which image size to use. Use the debugger or Hopscotch to examine a real response - this is a crucial skill for working with any API!

**General Pattern for Accessing Data:**
```dart
// First, get the data array from the response
var gifResults = jsonResponse['data'];

// Then access individual GIF objects
var firstGif = gifResults[0];

// Navigate into nested objects to find what you need
// Use the debugger to discover the exact path!
var imageUrl = firstGif['NAVIGATE']['TO']['THE']['IMAGE']['URL'];
```

**Pro Tip:** Don't guess the JSON structure - always use the debugger or print statements to explore it first. This will save you hours of frustration!

---

## 🧪 Testing Your API Key

### Option 1: Browser Testing (Quickest)

1. Replace `YOUR_KEY` in this URL with your actual key:
```
https://api.giphy.com/v1/gifs/search?api_key=YOUR_KEY&q=test&limit=5
```

2. Paste in browser address bar
3. You should see JSON response with GIF data
4. If you see `"status": 401`, your API key is incorrect

### Option 2: Hopscotch Testing (Recommended)

1. Go to [hoppscotch.io](https://hoppscotch.io/)
2. Method: **GET**
3. URL: `https://api.giphy.com/v1/gifs/search`
4. Add Query Parameters:
   - `api_key`: YOUR_KEY
   - `q`: cats
   - `limit`: 5
5. Click **Send**
6. Examine the JSON response structure

**Why Use Hopscotch?**
- Test API before writing Flutter code
- Understand JSON structure
- Verify endpoints work as expected
- No coding required to explore API

---

## 📱 Flutter Implementation Pattern

**Required Imports:**
```dart
import 'dart:convert';  // For jsonDecode()
import 'package:http/http.dart' as http;  // For making requests
```

**General Pattern for Making GIPHY API Calls:**

```dart
// 1. Build your URL with the endpoint and parameters
final url = Uri.parse('BASE_URL/ENDPOINT?api_key=YOUR_KEY&other_params=values');

// 2. Make the HTTP GET request
final response = await http.get(url);

// 3. Check if the request was successful
if (response.statusCode == 200) {
  // 4. Decode the JSON response
  final jsonResponse = jsonDecode(response.body);
  
  // 5. Extract and use the data
  // You'll need to explore the JSON structure to know what to access!
  var results = jsonResponse['???'];  // What key contains your data?
} else {
  // Handle errors
  print('Request failed with status: ${response.statusCode}');
}
```

**Key Concepts:**
- Use `Uri.parse()` to convert your URL string into a Uri object
- Always check `response.statusCode` (200 = success)
- Use `jsonDecode()` to convert the JSON string into Dart objects
- Navigate the decoded JSON to extract what you need

**Where to Learn More:**
- See **[Week 7A Notes](../../weekly/7A.md)** for detailed async/await patterns
- See **[HTTP & API Integration Reference](http-api-integration.md)** for error handling strategies
- We built a complete example together in class - refer to your class demo code!

---

## Common Issues & Solutions

| Problem | Solution |
|---------|----------|
| "Invalid authentication credentials" | Check your API key is correct, no extra spaces |
| Response shows 401 status | API key is wrong or not included in request |
| Rate limit exceeded | You've made >100 calls in an hour (wait or upgrade) |
| "No results found" | Search query too specific, try broader terms |
| Images not loading | Check image URL path, may need `https:` prefix |
| Slow response times | Use smaller image sizes (fixed_width/height vs original) |

---

## Rate Limits & Best Practices

### Beta Key Limits
- **100 API calls per hour**
- Resets every hour on the hour
- Shared across all endpoints

### Tips for Staying Under Limit
- Cache results locally when possible
- Use `limit` parameter to control result count
- Don't make API calls on every keystroke (debounce search input)
- Test thoroughly before demoing
- Consider using `trending` or `random` endpoints for initial screen

### Monitoring Your Usage
- Check your [GIPHY Dashboard](https://developers.giphy.com/dashboard/) to see API call statistics
- Dashboard shows daily and hourly usage

---

## When Covered in Course
- **[Week 7A](../../weekly/7A.md)** - HTTP requests and API authentication patterns
- **[Week 7B](../../weekly/7B.md)** - GIPHY API integration walkthrough
- **[Lab 04 - GIF Finder](../../labs/lab-04-gif-finder.md)** - Building complete GIPHY search app

## Related Resources
- **[HTTP & API Integration Reference](http-api-integration.md)** - General API patterns and error handling
- **[Async/Await Fundamentals Reference](async-await-fundamentals.md)** - Understanding asynchronous programming
- [GIPHY API Documentation](https://developers.giphy.com/docs/api) - Official documentation
- [GIPHY Content Guidelines](https://support.giphy.com/hc/en-us/articles/360020027752) - What content is allowed

---

*Last updated: Week 7B | IGME-340 Reference*
