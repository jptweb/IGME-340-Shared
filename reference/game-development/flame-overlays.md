# Flame Game Overlays Reference

## Quick Example
```dart
// In main.dart
GameWidget(
  game: MyGame()..paused = true,
  overlayBuilderMap: {
    'title': (context, game) => TitleOverlay(game: game),
  },
  initialActiveOverlays: const ['title'],
)

// Show/hide overlays
game.overlays.add('pause');      // Show
game.overlays.remove('title');   // Hide
game.overlays.clear();           // Hide all
```

## What Are Overlays?

Overlays are Flutter widgets that sit **on top of your game canvas**. Instead of rendering UI inside the game engine, you use Flutter's Material/Cupertino widgets.

**Perfect for:**
- Title screens and menus
- HUD elements (score, health)
- Pause/settings screens
- Dialogs and info screens

## Core Concepts

### Registering Overlays

All overlays must be registered in `overlayBuilderMap`:

```dart
GameWidget(
  game: MyGame(),
  overlayBuilderMap: {
    'title': (context, game) => TitleScreen(),
    'main': (context, game) => HUD(),
    'pause': (context, game) => PauseMenu(),
  },
)
```

**What it is:**
- A `Map<String, Widget Function(BuildContext, Game)>`
- Keys are string identifiers you use to show/hide overlays
- Values are functions that build the widget

### Showing Overlays on Startup

```dart
GameWidget(
  game: MyGame()..paused = true,  // Start paused
  initialActiveOverlays: const ['title', 'main'],  // Show these
  overlayBuilderMap: { /* ... */ },
)
```

### Managing Overlays at Runtime

```dart
// Show an overlay
game.overlays.add('pause');

// Hide an overlay
game.overlays.remove('pause');

// Hide all overlays
game.overlays.clear();

// Multiple overlays can be active at once
game.overlays.add('main');   // HUD
game.overlays.add('pause');  // Pause menu on top of HUD
```

## Common Patterns

### Title Screen Overlay

```dart
class TitleScreen extends StatelessWidget {
  final game;

  TitleScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('My Game', style: TextStyle(fontSize: 48)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                game.paused = false;
                game.overlays.remove('title');
                game.overlays.add('main');
              },
              child: Text('Start Game'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### HUD Overlay (Top Bar)

```dart
Widget hudOverlay(BuildContext context, game) {
  return Align(
    alignment: Alignment.topCenter,
    child: Container(
      color: Color.fromARGB(48, 0, 0, 0),  // Semi-transparent
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Score: 0',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          IconButton(
            icon: Icon(Icons.pause),
            onPressed: () {
              game.paused = true;
              game.overlays.add('pause');
            },
          ),
        ],
      ),
    ),
  );
}
```

### Pause Menu Overlay

```dart
Widget pauseOverlay(BuildContext context, game) {
  return Center(
    child: Container(
      width: 300,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Paused', style: TextStyle(fontSize: 36)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              game.paused = false;
              game.overlays.remove('pause');
            },
            child: Text('Resume'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              game.overlays.remove('pause');
              game.overlays.add('settings');
            },
            child: Text('Settings'),
          ),
        ],
      ),
    ),
  );
}
```

## Transparency & Material

### Making Overlays See-Through

Control transparency with the **alpha channel** in colors:

```dart
Color.fromARGB(255, 255, 0, 0)   // Opaque red (alpha = 255)
Color.fromARGB(128, 255, 0, 0)   // Half transparent red (alpha = 128)
Color.fromARGB(48, 0, 0, 0)      // Very transparent black (alpha = 48)
```

**Lower alpha = more transparent** (0 = invisible, 255 = solid)

### Material Widget Pattern

When using Material Design widgets (like `ElevatedButton`), wrap in Material:

```dart
return Material(
  color: Colors.transparent,  // MUST be transparent!
  child: Center(
    child: Container(
      color: Color.fromARGB(200, 255, 255, 255),  // Your UI can be opaque
      child: ElevatedButton(/* ... */),
    ),
  ),
);
```

**Why?**
- Material Design widgets need a `Material` ancestor
- The Material itself should be transparent to show the game
- Your Container inside can be opaque or semi-transparent

## Widget Patterns

### StatelessWidget Class (Complex Overlays)

```dart
class MyOverlay extends StatelessWidget {
  final MyGame game;

  MyOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    // Can have complex logic, multiple widgets
  }
}

// In main.dart
overlayBuilderMap: {
  'myOverlay': (context, game) => MyOverlay(game: game as MyGame),
}
```

### Widget Function (Simple Overlays)

```dart
Widget myOverlay(BuildContext context, game) {
  return Container(/* simple UI */);
}

// In main.dart
overlayBuilderMap: {
  'myOverlay': (context, game) => myOverlay(context, game),
}
```

**When to use each:**
- **StatelessWidget** - Complex overlays with state, reusable components
- **Widget function** - Simple overlays, quick prototypes

## Common Mistakes

| Issue | Solution |
|-------|----------|
| Overlay doesn't appear | Check key in `overlays.add('key')` matches `overlayBuilderMap` |
| Entire screen turns solid color | Make Material background `Colors.transparent` |
| Type error with game reference | Cast game: `game as MyGame` in overlay builder |
| Overlay flickers/rebuilds | Don't use `setState` in overlays - use Provider instead |
| Can't interact with game | Overlays block input by default - this is intended |

## Integration with WebView

Display HTML content in overlays:

```dart
import 'package:webview_flutter/webview_flutter.dart';

class InfoOverlay extends StatelessWidget {
  final game;
  final String htmlContent = """
    <html>
      <body style="padding: 20px;">
        <h1>Game Info</h1>
        <p>Your content here</p>
      </body>
    </html>
  """;

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..loadHtmlString(htmlContent);

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: 350,
          height: 400,
          child: Column(
            children: [
              Expanded(child: WebViewWidget(controller: controller)),
              ElevatedButton(
                onPressed: () => game.overlays.remove('info'),
                child: Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

**Note:** WebView only works on mobile/desktop, not in Chrome web builds.

## When Covered in Course
- **[Week 12A](../../weekly/12A.md)** - Flame overlays, game UI integration, WebView

## External Resources
- [Flame Overlays Documentation](https://docs.flame-engine.org/latest/flame/overlays.html)
- [WebView Flutter Package](https://pub.dev/packages/webview_flutter)

---
*Last updated: Week 12A | IGME-340 Reference*
