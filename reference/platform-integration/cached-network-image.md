# CachedNetworkImage Reference

## Quick Example
```dart
import 'package:cached_network_image/cached_network_image.dart';

// Basic cached image
CachedNetworkImage(
  imageUrl: 'https://example.com/image.jpg',
  width: 200,
  height: 200,
)

// With loading and error states
CachedNetworkImage(
  imageUrl: 'https://example.com/image.jpg',
  placeholder: (context, url) => CircularProgressIndicator(),
  errorWidget: (context, url, error) => Icon(Icons.error),
)
```

---

## What Is CachedNetworkImage?

CachedNetworkImage is a better alternative to Flutter's built-in `Image.network()` widget.

### The Problem with Image.network()
```dart
// ❌ PROBLEM: Downloads EVERY time widget rebuilds
Image.network('https://example.com/large-image.jpg')
```

Every time your widget rebuilds (which happens A LOT in Flutter):
- Image downloads again (wastes mobile data)
- User sees loading delay (poor UX)
- No control over loading/error states

### The Solution: CachedNetworkImage
```dart
// ✅ SOLUTION: Downloads once, caches forever
CachedNetworkImage(
  imageUrl: 'https://example.com/large-image.jpg',
)
```

Benefits:
- Downloads image **once**
- Stores on device permanently
- Instant loading on subsequent views
- Built-in loading and error widgets
- Saves mobile data
- Better user experience

**When to Use:**
- Any image from the internet
- API response images
- Profile pictures
- Product images
- GIFs from APIs
- Any repeated image display

---

## Setup

### Installation
```bash
flutter pub add cached_network_image
```

### Import
```dart
import 'package:cached_network_image/cached_network_image.dart';
```

**Important:** Do a **hot restart** (not just hot reload) after adding the package.

---

## Basic Usage

### Simple Cached Image

```dart
CachedNetworkImage(
  imageUrl: 'https://example.com/photo.jpg',
)
```

This alone is better than `Image.network()` - it caches automatically!

### With Sizing

```dart
CachedNetworkImage(
  imageUrl: 'https://example.com/photo.jpg',
  width: 200,
  height: 200,
  fit: BoxFit.cover,  // How to fit image in box
)
```

### BoxFit Options

| BoxFit | What It Does |
|--------|-------------|
| `BoxFit.cover` | Fill space, crop if needed (most common) |
| `BoxFit.contain` | Fit entirely, may have empty space |
| `BoxFit.fill` | Stretch to fill (may distort) |
| `BoxFit.fitWidth` | Match width, crop height if needed |
| `BoxFit.fitHeight` | Match height, crop width if needed |

---

## Loading & Error States

### With Placeholder (Loading Indicator)

```dart
CachedNetworkImage(
  imageUrl: imageUrl,
  placeholder: (context, url) => CircularProgressIndicator(),
)
```

The placeholder shows while image is downloading.

### With Error Widget

```dart
CachedNetworkImage(
  imageUrl: imageUrl,
  errorWidget: (context, url, error) => Icon(Icons.error),
)
```

Error widget shows if image fails to load (bad URL, network error, etc.)

### Complete Professional Pattern

```dart
CachedNetworkImage(
  imageUrl: imageUrl,
  width: 200,
  height: 200,
  fit: BoxFit.cover,
  
  // Shows while loading
  placeholder: (context, url) => Container(
    width: 200,
    height: 200,
    color: Colors.grey[200],
    child: Center(
      child: CircularProgressIndicator(),
    ),
  ),
  
  // Shows if error
  errorWidget: (context, url, error) => Container(
    width: 200,
    height: 200,
    color: Colors.grey[300],
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error, color: Colors.red),
        Text('Failed to load'),
      ],
    ),
  ),
)
```

---

## Container Decorations

For images in Container decorations, use `CachedNetworkImageProvider`:

### Basic Pattern

```dart
Container(
  width: 200,
  height: 200,
  decoration: BoxDecoration(
    image: DecorationImage(
      image: CachedNetworkImageProvider(imageUrl),
      fit: BoxFit.cover,
    ),
  ),
)
```

### With Borders and Shadows

```dart
Container(
  width: 200,
  height: 200,
  decoration: BoxDecoration(
    image: DecorationImage(
      image: CachedNetworkImageProvider(imageUrl),
      fit: BoxFit.cover,
    ),
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.grey, width: 2),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ],
  ),
)
```

---

## Common Use Cases

### List of Images (ListView/GridView)

```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: items[index]['imageUrl'],
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
      title: Text(items[index]['title']),
    );
  },
)
```

**Why Caching Matters Here:** Without caching, scrolling would re-download images every time they come into view = terrible UX!

### Profile Pictures

```dart
class ProfilePicture extends StatelessWidget {
  final String imageUrl;
  final double size;
  
  const ProfilePicture({
    required this.imageUrl,
    this.size = 100,
  });
  
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          width: size,
          height: size,
          color: Colors.grey[300],
          child: Icon(Icons.person, size: size * 0.6),
        ),
        errorWidget: (context, url, error) => Container(
          width: size,
          height: size,
          color: Colors.grey[400],
          child: Icon(Icons.person, size: size * 0.6),
        ),
      ),
    );
  }
}
```

### GIF Display (GIF Finder Lab)

```dart
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,
  ),
  itemCount: gifs.length,
  itemBuilder: (context, index) {
    return GestureDetector(
      onTap: () {
        // Open GIF detail page
      },
      child: CachedNetworkImage(
        imageUrl: gifs[index]['images']['fixed_height']['url'],
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: Colors.grey[200],
          child: Center(child: CircularProgressIndicator()),
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey[300],
          child: Icon(Icons.error),
        ),
      ),
    );
  },
)
```

### API Response Images

```dart
class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: product['imageUrl'],
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              height: 200,
              color: Colors.grey[200],
              child: Center(child: CircularProgressIndicator()),
            ),
            errorWidget: (context, url, error) => Container(
              height: 200,
              color: Colors.grey[300],
              child: Icon(Icons.image_not_supported),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(product['name']),
                Text('\$${product['price']}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

---

## Advanced Patterns

### Fade-In Animation

Images can fade in smoothly when loaded:

```dart
CachedNetworkImage(
  imageUrl: imageUrl,
  fadeInDuration: Duration(milliseconds: 500),
  fadeOutDuration: Duration(milliseconds: 500),
)
```

### Custom Progress Indicator

```dart
CachedNetworkImage(
  imageUrl: imageUrl,
  progressIndicatorBuilder: (context, url, downloadProgress) => 
    CircularProgressIndicator(
      value: downloadProgress.progress,  // Shows percentage
    ),
)
```

### Handling Multiple Image Sizes

APIs often provide multiple image sizes. Choose based on use case:

```dart
String getImageUrl(Map<String, dynamic> gifData, String size) {
  // Options: 'original', 'fixed_height', 'fixed_width', 'downsized'
  return gifData['images'][size]['url'];
}

// In GridView, use smaller size
CachedNetworkImage(
  imageUrl: getImageUrl(gif, 'fixed_height'),  // Smaller = faster
)

// In detail view, use original
CachedNetworkImage(
  imageUrl: getImageUrl(gif, 'original'),  // Full quality
)
```

---

## Comparison: CachedNetworkImage vs Image.network

| Feature | Image.network | CachedNetworkImage |
|---------|--------------|-------------------|
| Downloads | Every rebuild | Once, then cached |
| Data usage | High | Low (after first load) |
| Speed | Slow | Fast (after cache) |
| Loading state | Manual | Built-in |
| Error handling | Manual | Built-in |
| Memory efficient | No | Yes |
| Best for | Quick tests | Production apps |

**Verdict:** Always use CachedNetworkImage in production apps!

---

## Important Rules

### ⚠️ Use CachedNetworkImageProvider for Decorations

```dart
// ❌ WRONG - Won't cache!
Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: NetworkImage(url),  // Uses regular NetworkImage
    ),
  ),
)

// ✅ CORRECT - Caches properly
Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: CachedNetworkImageProvider(url),
    ),
  ),
)
```

### ⚠️ Always Add Error Widget

```dart
// ❌ RISKY - User sees nothing if image fails
CachedNetworkImage(imageUrl: url)

// ✅ SAFE - Shows fallback on error
CachedNetworkImage(
  imageUrl: url,
  errorWidget: (context, url, error) => Icon(Icons.error),
)
```

### ⚠️ Use Placeholder for Better UX

```dart
// ❌ OK - But user sees blank space while loading
CachedNetworkImage(imageUrl: url)

// ✅ BETTER - User sees loading indicator
CachedNetworkImage(
  imageUrl: url,
  placeholder: (context, url) => CircularProgressIndicator(),
)
```

---

## Cache Management

### How Caching Works

1. First load: Downloads from internet, saves to device storage
2. Subsequent loads: Reads from device storage (instant!)
3. Cache persists until:
   - App is uninstalled
   - Cache is manually cleared
   - Device runs out of storage (OS may clear)

### Clearing Cache (Rare)

Usually you don't need to clear cache, but if you do:

```dart
import 'package:cached_network_image/cached_network_image.dart';

// Clear ALL cached images
await CachedNetworkImage.evictFromCache(imageUrl);

// Clear cache for specific URL
await CachedNetworkImage.evictFromCache(imageUrl);
```

---

## Common Issues & Solutions

| Problem | Solution |
|---------|----------|
| Images not caching | Make sure you did hot restart after adding package |
| "404 Not Found" errors | Check imageUrl is valid and accessible |
| Images too big/slow | Use smaller image size from API if available |
| Placeholder never disappears | Check network connection, verify URL is correct |
| Memory issues with many images | Use `maxHeightDiskCache` and `maxWidthDiskCache` parameters |
| Can't see error widget | May need to wrap in sized container (width/height) |

---

## Performance Tips

### Limit Image Size in Cache

```dart
CachedNetworkImage(
  imageUrl: url,
  maxHeightDiskCache: 1000,  // Resize before caching
  maxWidthDiskCache: 1000,
)
```

This resizes images before caching, saving disk space.

### Use Appropriate Image Sizes

```dart
// ❌ BAD - Loading huge image for tiny thumbnail
CachedNetworkImage(
  imageUrl: originalImageUrl,  // 4000x3000px
  width: 50,
  height: 50,
)

// ✅ GOOD - Use thumbnail size from API
CachedNetworkImage(
  imageUrl: thumbnailImageUrl,  // 100x100px
  width: 50,
  height: 50,
)
```

---

## When Covered in Course
- **[Week 9A](../../weekly/9A.md)** - CachedNetworkImage basics, placeholder/error handling
- **Lab 02 - GIF Finder** - Caching GIF thumbnails in GridView
- **Project 2** - Caching images from your API

## External Resources
- [CachedNetworkImage Package](https://pub.dev/packages/cached_network_image)
- [Flutter Image Documentation](https://docs.flutter.dev/development/ui/assets-and-images)
- [BoxFit Documentation](https://api.flutter.dev/flutter/painting/BoxFit.html)

---

*Last updated: Week 9A | IGME-340 Reference*
