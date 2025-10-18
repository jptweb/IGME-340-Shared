# URL Launcher Reference

## Quick Example
```dart
import 'package:url_launcher/url_launcher.dart';

Future<void> openWebsite() async {
  final url = Uri.parse('https://www.google.com');
  
  if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
    throw 'Could not launch $url';
  }
}
```

---

## What Is URL Launcher?

URL Launcher opens external resources and apps from your Flutter app:
- **Web pages** in browser
- **Phone calls** via dialer
- **Emails** in mail client
- **Text messages** via SMS app
- **Maps** and other apps

It's the bridge between your app and the device's other apps.

---

## Setup

### Installation
```bash
flutter pub add url_launcher
```

### Import
```dart
import 'package:url_launcher/url_launcher.dart';
```

**Important:** Do a **hot restart** (not just hot reload) after adding the package.

---

## Basic Pattern

All URL launches follow the same pattern:

```dart
Future<void> openLink() async {
  // 1. Parse string to URI
  final url = Uri.parse('https://example.com');
  
  // 2. Try to launch with error handling
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}
```

**Critical Rules:**
1. ✅ Use `Uri.parse()` - NOT just a string
2. ✅ Make method `async` - launching takes time
3. ✅ Use `await` - don't forget it!
4. ✅ Handle errors - check if launch succeeded

---

## Launch Modes

Launch modes control **how** and **where** the URL opens.

```dart
enum LaunchMode {
  platformDefault,      // Let the OS decide
  inAppWebView,         // Open inside your app (RECOMMENDED)
  inAppBrowserView,     // Open Chrome/Safari tab in your app
  externalApplication,  // Open in default external app
}
```

### Launch Mode Comparison

| Mode | Where Opens | User Experience | Best For |
|------|-------------|-----------------|----------|
| `inAppWebView` | Inside your app | User stays in app, simple browser | Quick links, keeping users in app |
| `inAppBrowserView` | Chrome/Safari tab in app | Full browser features | Complex sites needing full browser |
| `externalApplication` | Default browser app | Takes user out of app | When you want them to use external app |
| `platformDefault` | OS decides | Platform-specific behavior | When you don't care which |

### Using Launch Modes

```dart
// Recommended: Keep user in your app
await launchUrl(url, mode: LaunchMode.inAppWebView);

// Full browser features in your app
await launchUrl(url, mode: LaunchMode.inAppBrowserView);

// Send to external browser
await launchUrl(url, mode: LaunchMode.externalApplication);
```

**Recommendation:** Use `LaunchMode.inAppWebView` for most use cases - keeps users in your app while still showing web content.

---

## URL Schemes

Different URL schemes open different apps:

| Scheme | Opens | Example |
|--------|-------|---------|
| `https://` | Web browser | `https://google.com` |
| `http://` | Web browser | `http://example.com` |
| `tel:` | Phone dialer | `tel:+15855551234` |
| `mailto:` | Email client | `mailto:support@example.com` |
| `sms:` | Text messaging | `sms:+15855551234` |
| `geo:` | Maps app | `geo:37.7749,-122.4194` |

---

## Common Use Cases

### Opening Websites

```dart
Future<void> openWebsite(String urlString) async {
  final url = Uri.parse(urlString);
  
  if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
    throw 'Could not launch $url';
  }
}

// Usage
await openWebsite('https://www.google.com');
await openWebsite('https://flutter.dev');
```

### Phone Calls

```dart
Future<void> makePhoneCall(String phoneNumber) async {
  final url = Uri.parse('tel:$phoneNumber');
  
  if (!await launchUrl(url)) {
    throw 'Could not launch phone dialer';
  }
}

// Usage
await makePhoneCall('+15855551234');
await makePhoneCall('911');  // Emergency
```

**Note:** On iOS simulator, phone calls won't work (no dialer). Test on real device.

### Email

```dart
// Simple email
Future<void> sendEmail(String email) async {
  final url = Uri.parse('mailto:$email');
  await launchUrl(url);
}

// Email with subject and body
Future<void> sendEmailWithDetails({
  required String email,
  String? subject,
  String? body,
}) async {
  String emailUrl = 'mailto:$email';
  
  List<String> params = [];
  if (subject != null) params.add('subject=$subject');
  if (body != null) params.add('body=$body');
  
  if (params.isNotEmpty) {
    emailUrl += '?' + params.join('&');
  }
  
  final url = Uri.parse(emailUrl);
  await launchUrl(url);
}

// Usage
await sendEmail('support@example.com');

await sendEmailWithDetails(
  email: 'help@example.com',
  subject: 'Help Needed',
  body: 'I have a question about...',
);
```

### SMS / Text Messages

```dart
// Simple SMS
Future<void> sendSMS(String phoneNumber) async {
  final url = Uri.parse('sms:$phoneNumber');
  await launchUrl(url);
}

// SMS with pre-filled message
Future<void> sendSMSWithMessage(String phoneNumber, String message) async {
  final url = Uri.parse('sms:$phoneNumber?body=$message');
  await launchUrl(url);
}

// Usage
await sendSMS('+15855551234');
await sendSMSWithMessage('+15855551234', 'Hello from my app!');
```

### Opening Maps / Locations

```dart
// Open coordinates in maps
Future<void> openLocation(double latitude, double longitude) async {
  final url = Uri.parse('geo:$latitude,$longitude');
  await launchUrl(url);
}

// Open address in maps
Future<void> openAddress(String address) async {
  // Encode address for URL
  String encodedAddress = Uri.encodeComponent(address);
  final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$encodedAddress');
  await launchUrl(url);
}

// Usage
await openLocation(37.7749, -122.4194);  // San Francisco
await openAddress('1600 Amphitheatre Parkway, Mountain View, CA');
```

### Social Media Links

```dart
Future<void> openTwitterProfile(String username) async {
  final url = Uri.parse('https://twitter.com/$username');
  await launchUrl(url, mode: LaunchMode.externalApplication);
}

Future<void> openInstagram(String username) async {
  final url = Uri.parse('https://instagram.com/$username');
  await launchUrl(url, mode: LaunchMode.externalApplication);
}

Future<void> openYouTube(String channelId) async {
  final url = Uri.parse('https://youtube.com/channel/$channelId');
  await launchUrl(url, mode: LaunchMode.externalApplication);
}
```

---

## Project-Specific Examples

### GIF Finder Lab: Open GIF Detail Page

```dart
Future<void> openGifPage(String gifUrl) async {
  final url = Uri.parse(gifUrl);
  
  if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
    // Show error to user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Could not open GIF page')),
    );
  }
}

// In your GridTile or GestureDetector
onTap: () {
  openGifPage(gifData['url']);
}
```

### Project 2: API Detail Pages

```dart
class ApiService {
  Future<void> openDetailPage(String itemId) async {
    String detailUrl = 'https://api.example.com/items/$itemId';
    final url = Uri.parse(detailUrl);
    
    await launchUrl(url, mode: LaunchMode.inAppWebView);
  }
}
```

### Support / Help Links

```dart
class SupportHelper {
  static Future<void> contactSupport() async {
    await launchUrl(
      Uri.parse('mailto:support@myapp.com?subject=Help Request'),
    );
  }
  
  static Future<void> openFAQ() async {
    await launchUrl(
      Uri.parse('https://myapp.com/faq'),
      mode: LaunchMode.inAppWebView,
    );
  }
  
  static Future<void> reportBug() async {
    await launchUrl(
      Uri.parse('https://github.com/myapp/issues/new'),
      mode: LaunchMode.externalApplication,
    );
  }
}
```

---

## Error Handling

### Basic Error Handling

```dart
Future<void> openUrlSafely(String urlString) async {
  try {
    final url = Uri.parse(urlString);
    
    if (!await launchUrl(url)) {
      throw Exception('Could not launch URL');
    }
  } catch (e) {
    print('Error launching URL: $e');
    // Show error to user
  }
}
```

### Checking if URL Can Be Launched

```dart
Future<bool> canOpenUrl(String urlString) async {
  try {
    final url = Uri.parse(urlString);
    return await canLaunchUrl(url);
  } catch (e) {
    return false;
  }
}

// Usage
if (await canOpenUrl('tel:+15855551234')) {
  await openPhoneCall('+15855551234');
} else {
  print('Cannot make phone calls on this device');
}
```

### User-Friendly Error Messages

```dart
Future<void> openUrlWithFeedback(
  BuildContext context,
  String urlString,
) async {
  try {
    final url = Uri.parse(urlString);
    
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      // Show error snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Unable to open link'),
          backgroundColor: Colors.red,
        ),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: Invalid URL format'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
```

---

## Important Rules

### ⚠️ Always Use Uri.parse()

```dart
// ❌ WRONG - Type error!
await launchUrl('https://google.com');

// ✅ CORRECT
await launchUrl(Uri.parse('https://google.com'));
```

### ⚠️ Don't Forget Async/Await

```dart
// ❌ WRONG - Launch won't work!
void openLink() {
  launchUrl(Uri.parse('https://google.com'));
}

// ✅ CORRECT
Future<void> openLink() async {
  await launchUrl(Uri.parse('https://google.com'));
}
```

### ⚠️ Handle Errors

```dart
// ❌ RISKY - Fails silently
await launchUrl(url);

// ✅ SAFE - Handles failure
if (!await launchUrl(url)) {
  // Show error to user
  print('Failed to open URL');
}
```

### ⚠️ URL Encode Special Characters

```dart
// ❌ BAD - Spaces will break URL
String query = 'New York City';
Uri.parse('https://maps.com/search?q=$query');

// ✅ GOOD - Encode spaces and special chars
String query = Uri.encodeComponent('New York City');
Uri.parse('https://maps.com/search?q=$query');
```

---

## Common Issues & Solutions

| Problem | Solution |
|---------|----------|
| "type 'String' is not a subtype of 'Uri'" | Use `Uri.parse(urlString)`, not just the string |
| Link opens but app crashes | Add `async`/`await` keywords |
| Phone/SMS doesn't work | Test on real device (not simulator) |
| URL not opening | Check if URL string is valid and properly formatted |
| Forgot to import package | Add `import 'package:url_launcher/url_launcher.dart';` |
| Network issues in simulator | Cold boot the simulator |

---

## Platform-Specific Notes

### iOS
- Phone calls don't work in simulator (no dialer app)
- SMS doesn't work in simulator
- May need to add permissions to `Info.plist` for some URL schemes

### Android
- Most features work in emulator
- Some devices may have different default apps installed

### Web
- `externalApplication` mode opens in new browser tab
- Some URL schemes (tel:, sms:) may not work depending on device

---

## When Covered in Course
- **[Week 9A](../../weekly/9A.md)** - URL Launcher basics, launch modes, common URL schemes
- **Lab 02 - GIF Finder** - Opening GIF detail pages on GIPHY
- **Project 2** - Linking to external API documentation, detail pages

## External Resources
- [URL Launcher Package](https://pub.dev/packages/url_launcher)
- [URL Schemes List](https://developer.apple.com/library/archive/featuredarticles/iPhoneURLScheme_Reference/Introduction/Introduction.html)
- [URI Specification](https://www.ietf.org/rfc/rfc3986.txt)

---

*Last updated: Week 9A | IGME-340 Reference*
