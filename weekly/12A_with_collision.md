# Flame Engine Guide - Overlays

> **📖 Quick Reference:** See the [Flame Overlays Reference](../reference/game-development/flame-overlays.md) for quick code examples and common patterns.

## Overview
- **Topic:** Flame Game Engine Overlays (UI on top of game)
- **Estimated Time:** 55-60 minutes
- **Prerequisites:**
  - Completed previous Flame lesson (sprite movement & joystick)
  - Understanding of Flutter widgets
  - Basic Dart knowledge
- **What You'll Build:** A game with collision detection between asteroids and multiple overlay screens including title screen, HUD, pause menu, info page with web view, and settings with sliders

**Note for Instructors:** Time estimates and teaching moments are included throughout to help with pacing and emphasis.

## What Are Overlays?

**Key Concept:** Overlays are areas you define on the screen that sit on top of the game. Think of them as another set of widgets that can be displayed over the game widget itself.

Instead of putting the game inside a MaterialApp with navigation, the game takes the full screen and overlays sit on top. This is perfect for:
- Title screens
- Settings/pause menus
- HUD elements (score, health, etc.)
- Tutorial dialogs

---

## Getting the Starter Project

**Action:** Clone the starter project from GitHub

**Option 1: Clone the repository (Recommended)**

```bash
git clone <repository-url>
cd week12a_flame_overlay_starter
flutter pub get
flutter run
```

This gives you all dependencies pre-installed (flame and webview_flutter packages already configured).

**Option 2: Create fresh project and copy files**

If you encounter build/dependency issues, you can create a new Flutter project and copy over the 3 starter files:

1. Create new Flutter project: `Cmd/Ctrl + Shift + P` → "Flutter: New Project" → "Empty Application"
2. Run `flutter pub add flame` and `flutter pub add webview_flutter`
3. Copy `main.dart`, `game.dart`, `asteroid.dart` from the starter repo into your `lib/` folder
4. Copy the `assets/` folder from the starter repo
5. Add to pubspec.yaml:
```yaml
flutter:
  assets:
    - assets/images/
```

---

## Understanding the Starter Project

**Action:** Run the starter project to see what we're working with

**What You Should See:**
- Purple background (`Color.fromARGB(249, 120, 86, 233)`)
- 10 same-sized asteroids bouncing around the screen at random speeds
- Asteroids bounce off walls but pass right through each other
- Fullscreen mode prompt on first launch (swipe down to exit)

**Starter Code Structure:**

You have **3 files** in the `lib` folder:

### `main.dart` - App entry point
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();  // Makes game fullscreen
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GameWidget(
          game: OverlayTutorial(context),  // Game class is in game.dart
        ),
      ),
    );
  }
}
```

**Note:** The game receives `context` as a parameter - this will be useful later!

### `game.dart` - The game class

```dart
class OverlayTutorial extends FlameGame with TapCallbacks {
  final BuildContext context;

  OverlayTutorial(this.context);

  @override
  Color backgroundColor() => const Color.fromARGB(249, 120, 86, 233);

  @override
  Future<void> onLoad() async {
    await images.loadAll(["asteroid.png"]);

    for (int i = 0; i < 10; i++) {
      add(Asteroid());
    }
  }

  @override
  void onTapUp(TapUpEvent event) {
    super.onTapUp(event);
    // Empty for now - we could add tap handling here
  }
}
```

**What's here:**
- Purple background color override
- Preloads asteroid image
- Spawns 10 asteroids in a loop
- Has `TapCallbacks` mixin (empty `onTapUp` handler)

### `asteroid.dart` - Asteroid sprite component

```dart
class Asteroid extends SpriteComponent with HasGameRef {
  late Vector2 velocity;

  static const double asteroidSize = 50.0;

  @override
  Future<void> onLoad() async {
    sprite = Sprite(game.images.fromCache('asteroid.png'));
    anchor = Anchor.center;
    position = Vector2(
      Random().nextDouble() * gameRef.size.x,
      Random().nextDouble() * gameRef.size.y,
    );
    size = Vector2(asteroidSize, asteroidSize);
    velocity =
        Vector2(Random().nextDouble() * 200, Random().nextDouble() * 200);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
    if (position.y < 0 || position.y > gameRef.size.y) {
      velocity = Vector2(velocity.x, -velocity.y);
    }
    if (position.x < 0 || position.x > gameRef.size.x) {
      velocity = Vector2(-velocity.x, velocity.y);
    }
  }
}
```

**What it does:**
- All asteroids are the same size (50px) - uniform so collisions make sense
- Random position and velocity on creation
- Updates position every frame
- Bounces off screen edges

**Note:** Each asteroid manages itself - the game just creates them and they handle their own movement and collision with boundaries.

---

## Adding Collision Detection

Before we dive into overlays, let's make these asteroids interact with each other. Right now they pass through each other like ghosts - let's fix that.

Flame has a built-in collision detection system. It works in three parts:
1. **The game** needs to know collision detection is happening (`HasCollisionDetection` mixin)
2. **Each component** needs a hitbox shape (like a `CircleHitbox`)
3. **Each component** needs to respond to collisions (`CollisionCallbacks` mixin)

### STEP 1: Enable Collision Detection on the Game

**Action:** Add the `HasCollisionDetection` mixin to the game class

**Code Change in game.dart:**

**Add import:**
```dart
import 'package:flame/collisions.dart';
```

**Update class declaration:**

**OLD:**
```dart
class OverlayTutorial extends FlameGame with TapCallbacks {
```

**NEW:**
```dart
class OverlayTutorial extends FlameGame with TapCallbacks, HasCollisionDetection {
```

**What This Does:**
- `HasCollisionDetection` tells Flame to check for collisions between components every frame
- Without this, hitboxes exist but Flame never checks if they overlap
- This is like flipping the "on" switch for the collision system

---

### STEP 2: Add Hitboxes and Collision Response to Asteroids

**Action:** Give each asteroid a circular hitbox and tell it what to do when hit

**Code Changes in asteroid.dart:**

**Add import:**
```dart
import 'package:flame/collisions.dart';
```

**Update class declaration - add two mixins:**

**OLD:**
```dart
class Asteroid extends SpriteComponent with HasGameRef {
```

**NEW:**
```dart
class Asteroid extends SpriteComponent with HasGameRef, CollisionCallbacks {
```

**Add hitbox at the end of `onLoad`:**
```dart
@override
Future<void> onLoad() async {
  sprite = Sprite(game.images.fromCache('asteroid.png'));
  anchor = Anchor.center;
  position = Vector2(
    Random().nextDouble() * gameRef.size.x,
    Random().nextDouble() * gameRef.size.y,
  );
  size = Vector2(asteroidSize, asteroidSize);
  velocity =
      Vector2(Random().nextDouble() * 200, Random().nextDouble() * 200);

  // Add a circular hitbox for collision detection
  add(CircleHitbox());
}
```

**Add the collision response method after `update`:**
```dart
@override
void onCollisionStart(Set<Vector2> points, PositionComponent other) {
  super.onCollisionStart(points, other);

  if (other is Asteroid) {
    // Get the direction from this asteroid to the other
    final normal = (other.position - position).normalized();

    // Calculate relative velocity
    final relativeVelocity = velocity - other.velocity;

    // How much velocity is along the collision axis
    final impulse = relativeVelocity.dot(normal);

    // Only bounce if asteroids are moving toward each other
    if (impulse > 0) {
      velocity -= normal * impulse;
      other.velocity += normal * impulse;
    }
  }
}
```

**Understanding the Collision Math:**

This is **elastic collision** - the asteroids exchange energy realistically, like billiard balls. Here's what each line does:

```dart
final normal = (other.position - position).normalized();
```
- Gets the **direction** from this asteroid to the one it hit
- `.normalized()` makes it a unit vector (length of 1) - just direction, no magnitude
- Think of it as pointing from the center of one asteroid toward the center of the other

```dart
final relativeVelocity = velocity - other.velocity;
```
- How fast are these two asteroids moving **relative to each other**?
- If both are moving right at the same speed, relative velocity is zero (no collision force)

```dart
final impulse = relativeVelocity.dot(normal);
```
- `.dot()` is the **dot product** - it measures how much the relative velocity is along the collision direction
- Head-on collision = high impulse. Glancing blow = low impulse
- This is the key number that determines how much velocity to transfer

```dart
if (impulse > 0) {
  velocity -= normal * impulse;
  other.velocity += normal * impulse;
}
```
- **`impulse > 0`** means they're moving toward each other (prevents double-bouncing)
- Subtract impulse from this asteroid's velocity along the collision axis
- Add the same impulse to the other asteroid
- Energy is conserved - what one loses, the other gains

**The `if (impulse > 0)` guard is important!** Without it, asteroids can get stuck in a loop where they keep re-triggering the collision callback and jittering in place.

**Why Same-Size Asteroids?**
Since all asteroids have the same mass, the math simplifies - we don't need mass ratios. In a real physics engine with different-sized objects, you'd weight the impulse by each object's mass.

**Test It:**
Run the app. You should see asteroids bouncing off each other realistically - head-on collisions swap speeds, glancing blows deflect at angles. Much more interesting to watch!

---

## PART 1: Title Overlay (Basic Overlay Pattern)

### STEP 3: Create Overlay Files

**Action:** Create 5 new files for our overlays

**Files to create:**
- `overlay_title.dart`
- `overlay_settings.dart`
- `overlay_pause.dart`
- `overlay_info.dart`
- `overlay_main.dart`

**Quick way:** Create them all at once in your IDE's file explorer.

---

### STEP 4: Build the Title Overlay Widget

**Action:** Create a centered container with title and buttons

**Code: overlay_title.dart**
```dart
import 'package:flutter/material.dart';

class OverlayTitle extends StatelessWidget {
  final game;  // Accept any game type (generic)

  OverlayTitle({super.key, required this.game});  // Remove const

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 400,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 236, 203),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Overlay Tutorial",
              style: TextStyle(
                color: Colors.black,
                fontSize: 48,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                game.paused = false;
                game.overlays.remove('title');
                game.overlays.add('main');
              },
              child: const Text("Start Game"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                game.overlays.add('settings');
              },
              child: const Text("Settings"),
            ),
          ],
        ),
      ),
    );
  }
}
```

**Key Points:**
- Simple StatelessWidget - just a UI container
- 350x400 box with rounded corners
- Centered on screen
- Start Game button unpauses game, removes title, shows HUD
- Settings button opens settings overlay

---

### STEP 5: Register Overlay in Main and Show on Startup

**Action:** Add overlay to the game's overlay builder map and start with it visible

**Code Changes in main.dart:**

**Add import:**
```dart
import 'overlay_title.dart';
```

**Modify GameWidget in main.dart:**
```dart
GameWidget(
  game: OverlayTutorial(context)..paused = true,
  overlayBuilderMap: {
    'title': (context, game) {
      return OverlayTitle(game: game);
    },
  },
  initialActiveOverlays: const ['title'],
)
```

**Understanding overlayBuilderMap:**

This is the **core concept** of Flame's overlay system. Let's break it down:

```dart
overlayBuilderMap: {
  'title': (context, game) {
    return OverlayTitle();
  },
}
```

**What is overlayBuilderMap?**
- It's a **Map** (dictionary) that registers all your overlay widgets
- Type: `Map<String, Widget Function(BuildContext, Game)>`
- Think of it like **named routes in GoRouter** - you're giving each overlay a string identifier

**The Key ('title'):**
- This is the **unique identifier** for this overlay
- You'll use this string later to show/hide the overlay: `game.overlays.add('title')` or `game.overlays.remove('title')`
- You can name it anything, but keep it descriptive and lowercase

**The Value (builder function):**
```dart
(context, game) {
  return OverlayTitle();
}
```
- This is a **function** that builds the overlay widget
- **`context`** - BuildContext (you already know this from Flutter)
- **`game`** - Reference to your FlameGame instance (OverlayTutorial in our case)
- **Returns** - The widget to display as the overlay

**Why do we need this?**
- Flame needs to know what widgets are available as overlays BEFORE it can display them
- This is the "registration" step - similar to how you register routes in GoRouter
- Once registered, you can dynamically show/hide overlays using `game.overlays.add()` and `game.overlays.remove()`

**Comparison to GoRouter:**
```dart
// GoRouter - register routes with paths
GoRoute(path: '/title', builder: (context, state) => TitleScreen())

// Flame overlays - register overlays with keys
overlayBuilderMap: {
  'title': (context, game) => OverlayTitle()
}
```

Both systems need to know what's available before they can navigate/display!

**Understanding game.overlays (Overlay Management):**

```dart
game.paused = false;              // Unpause the game
game.overlays.remove('title');    // Hide the title overlay
```

**What is game.overlays?**
- It's an **overlay manager** built into every FlameGame
- Think of it like a **Set of active overlay names** (strings)
- Only overlays in this set are currently visible on screen
- You control what's visible by adding/removing strings from this set

**Key Methods:**

1. **`game.overlays.add('key')`** - Shows an overlay
   - Adds the string to the active set
   - Flame looks up 'key' in overlayBuilderMap and displays that widget
   - If already visible, does nothing (no duplicates)

2. **`game.overlays.remove('key')`** - Hides an overlay
   - Removes the string from the active set
   - Overlay widget is destroyed/hidden
   - If not currently visible, does nothing

3. **`game.overlays.clear()`** - Hides ALL overlays
   - Empties the active set
   - Useful for resetting to a "game only" state

**Example Flow:**
```dart
// Initially: initialActiveOverlays: ['title']
// Active set = {'title'} -> Title is visible

// User clicks "Start Game":
game.overlays.remove('title');
// Active set = {} -> Nothing visible

game.overlays.add('main');
// Active set = {'main'} -> Main HUD is visible

// Multiple overlays can be active:
game.overlays.add('pause');
// Active set = {'main', 'pause'} -> Both visible!
```

**Important Notes:**
- The string key **must match** what you registered in overlayBuilderMap
- Typo in the key? Overlay won't show/hide (Flame will silently ignore it)
- Multiple overlays can be active simultaneously (they stack on top of each other)
- Order matters: overlays added later appear on top

**The cascade operator (`..`)** in `OverlayTutorial(context)..paused = true` lets you call methods/set properties on an object immediately after construction.

**What You Should See:**
- Title overlay visible, asteroids frozen behind it
- Click "Start Game" - title disappears, asteroids start moving and bouncing off each other

---

## PART 2: Main Overlay (Persistent HUD)

**Concept:** This overlay stays visible during gameplay to show score and control buttons. Unlike the title, it doesn't block the whole screen.

### STEP 6: Create Main Overlay

**Action:** Build a top-aligned transparent bar with score and buttons

**Code: overlay_main.dart**
```dart
import 'package:flutter/material.dart';

Widget mainOverlay(BuildContext context, game) {
  return Align(
    alignment: Alignment.topCenter,
    child: Container(
      color: Color.fromARGB(48, 245, 154, 50),  // Semi-transparent orange
      width: double.infinity,  // Full width
      height: 50,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Score: 0",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              game.paused = true;
              game.overlays.add('pause');
            },
            icon: Icon(Icons.pause),
          ),
          IconButton(
            onPressed: () {
              game.paused = true;
              game.overlays.add('settings');
            },
            icon: Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              game.paused = true;
              game.overlays.add('info');
            },
            icon: Icon(Icons.info),
          ),
        ],
      ),
    ),
  );
}
```

**Key Design Choices:**
- **Function returning Widget** (not a StatelessWidget class) - simpler for basic overlays
- **Align widget** positions at top center
- **Semi-transparent color** (alpha = 48) - you can see asteroids through it
- **double.infinity width** - spans entire screen
- **Expanded** on Text - pushes buttons to the right
- **Row** layout - score text and icon buttons in a line

**Why use overlays for UI?** Instead of using Flame to render things like scores or buttons, overlays let you use Flutter's UI widgets. This takes the responsibility away from the game engine and makes UI much easier to build and maintain.

---

### STEP 7: Register Main Overlay

**Code Changes in main.dart:**

**Add import:**
```dart
import 'overlay_main.dart';
```

**Add to overlayBuilderMap:**
```dart
overlayBuilderMap: {
  'title': (context, game) {
    return OverlayTitle(game: game);
  },
  'main': (context, game) {
    return mainOverlay(context, game);
  },
},
```

**What You Should See:**
- Click Start Game
- Title disappears
- Semi-transparent orange bar appears at top
- "Score: 0" on left, three icon buttons on right
- Asteroids visible through the transparent bar and bouncing off each other

---

## PART 3: Pause Overlay

### STEP 8: Create Pause Overlay

**Action:** Build another centered container for pausing

**Code: overlay_pause.dart**

> **COPY-PASTE FRIENDLY:** This is very similar to title overlay with different text/buttons

```dart
import 'package:flutter/material.dart';

Widget pauseOverlay(BuildContext context, game) {
  return Center(
    child: Container(
      width: 350,
      height: 400,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 150, 200, 220),  // Different color
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Game Paused",
            style: TextStyle(
              color: Colors.black,
              fontSize: 48,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              game.paused = false;
              game.overlays.remove('pause');
            },
            child: const Text("Resume"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              game.overlays.add('settings');
            },
            child: const Text("Settings"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // TODO: Quit functionality
            },
            child: const Text("Quit"),
          ),
        ],
      ),
    ),
  );
}
```

**Register in main.dart:**

**Add import:**
```dart
import 'overlay_pause.dart';
```

**Add to overlayBuilderMap:**
```dart
'pause': (context, game) {
  return pauseOverlay(context, game);
},
```

**What You Should See:**
- Click pause button in HUD
- "Game Paused" overlay appears
- Asteroids freeze
- Click Resume - overlay disappears, game continues

---

## PART 4: Info Overlay with Web View

**Time Note:** This section involves adding a package and may take 5-7 minutes

### STEP 9: Add WebView Package

**Action:** Install the webview_flutter package

**Terminal Command:**
```bash
flutter pub add webview_flutter
```

**Important:** Stop your running app - hot reload won't work after adding packages. You'll need to restart.

**Understanding WebView:**

**What is WebView?**
- A WebView is a **mini web browser embedded in your app**
- It can display HTML content, CSS styling, and JavaScript
- Think of it as an `<iframe>` in web development - a window showing web content

**Why use WebView in games?**
- **Rich text formatting** - HTML gives you more styling control than plain Text widgets
- **External content** - Display web pages, documentation, or online help
- **Dynamic content** - Load content from URLs or update HTML on the fly
- **Tutorial/Info screens** - Complex formatted text with images and links

**Two ways to load content:**
1. **`loadHtmlString(htmlString)`** - Load HTML from a string (we're doing this)
2. **`loadRequest(Uri.parse(url))`** - Load a web page from a URL

**WebViewController Pattern:**
```dart
final WebViewController controller = WebViewController()
  ..loadHtmlString("<html><body><h1>Hello!</h1></body></html>");

// Later, display it:
WebViewWidget(controller: controller)
```

The `..` cascade operator lets us call methods immediately after creating the controller.

---

### STEP 10: Create Info Overlay with Embedded HTML

**Action:** Build a stateless widget with a WebView showing HTML content

**Code: overlay_info.dart**

> **COPY-PASTE FRIENDLY:** This code is long - students can copy the HTML string

> **IMPORTANT - Two Typing Approaches:**
> Notice we're using **`final OverlayTutorial game`** here (strict typing) instead of **`final game`** like we did in the title overlay (generic typing). This demonstrates both approaches!
>
> **Approach 1 (Title overlay):** `final game` - Generic, flexible, but needs non-const constructor
> **Approach 2 (Info overlay):** `final OverlayTutorial game` - Type-safe, better autocomplete, requires casting in main.dart
>
> In production code, **Approach 2 is preferred** for better type safety.

```dart
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'game.dart';

class InfoOverlay extends StatelessWidget {
  final OverlayTutorial game;  // Explicitly typed (Approach 2)

  InfoOverlay({super.key, required this.game});

  // Embedded HTML content
  final String infoText = """
<!DOCTYPE html>
<html>
<head>
  <style>
    body {
      font-family: Arial, sans-serif;
      padding: 20px;
      background-color: #f0f0f0;
    }
    h1 {
      color: #333;
    }
    p {
      line-height: 1.6;
    }
  </style>
</head>
<body>
  <h1>Game Information</h1>
  <p>This is a demo of Flame overlays showing how you can integrate web content into your game.</p>
  <p>You can use this for tutorials, credits, help documentation, or any HTML-based content.</p>
</body>
</html>
  """;

  @override
  Widget build(BuildContext context) {
    // Initialize WebView controller
    final WebViewController webViewController = WebViewController()
      ..loadHtmlString(infoText);

    return Material(
      color: Colors.transparent,  // Important! Makes background transparent
      child: Center(
        child: Container(
          width: 350,
          height: 400,
          decoration: BoxDecoration(
            color: Color.fromARGB(220, 244, 243, 164),  // Semi-transparent (alpha = 220)
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Expanded(
                child: WebViewWidget(
                  controller: webViewController,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  game.overlays.remove('info');
                  game.paused = false;
                },
                child: const Text("Close"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

**Understanding the Material Widget Pattern:**

This is a **critical pattern** for Flame overlays that use Material Design widgets (like ElevatedButton). Let's understand why we need Material and the transparency concept:

```dart
return Material(
  color: Colors.transparent,  // Critical!
  child: Center(
    child: Container(
      color: Color.fromARGB(220, 244, 243, 164),  // Semi-transparent (alpha = 220)
      // ... your UI
    )
  ),
);
```

**Why do we need the Material widget?**
- Many Flutter widgets (like **ElevatedButton**, text fields, dialogs) rely on Material Design components
- These widgets look for a `Material` ancestor in the widget tree
- Without it, you'll get errors or incorrect rendering
- Material provides the "surface" for Material Design components to work properly

**Understanding the Two Layers of Transparency:**

**Layer 1: Material Background (must be transparent)**
- The Material widget **fills the entire screen** by default
- `Colors.transparent` makes this full-screen layer invisible
- This lets the game show through **around** your UI elements

**Layer 2: Container (your visible UI)**
- The Container color determines if your actual UI is transparent or opaque
- `Color.fromARGB(220, 244, 243, 164)` - SEMI-TRANSPARENT yellow (alpha = 220) - **can slightly see game through it**
- `Color.fromARGB(48, 245, 154, 50)` - VERY TRANSPARENT orange (alpha = 48) - **can clearly see game through it**
- Lower alpha = more transparent (0 = invisible, 255 = opaque)

**Bottom Line:** When using Material Design widgets (like ElevatedButton), wrap your overlay in `Material(color: Colors.transparent, ...)`. This makes the Material background invisible while your Container can be opaque or semi-transparent depending on your needs.

---

### STEP 11: Register and Connect Info Overlay

**Register in main.dart:**

**Add import:**
```dart
import 'overlay_info.dart';
```

**Add to overlayBuilderMap:**
```dart
'info': (context, game) {
  return InfoOverlay(game: game as OverlayTutorial);  // Cast required!
},
```

**Why the `as OverlayTutorial` cast?**
- The `game` parameter in the builder is typed as `Object?` by default
- `InfoOverlay` expects specifically `OverlayTutorial` (we typed it strictly)
- The cast tells Dart "trust me, this is an OverlayTutorial"
- This is the trade-off for using strict typing (Approach 2)

**Remember:** In the title overlay, we didn't need the cast because we used generic `final game` (Approach 1).

**What You Should See:**
- Click info button
- Yellow container appears with HTML content rendered
- Scrollable if content is long
- Click Close - overlay disappears, game resumes

**WebView Limitation:**
**WebView does NOT work on Chrome/Web builds!** You'll get an error about platform implementation. This is expected - WebView only works on mobile (Android/iOS) and desktop (Windows/macOS/Linux).

**For testing:**
- Use Android/iOS emulator or physical device
- OR temporarily disable the info button when testing in Chrome

---

### TROUBLESHOOTING: Gradle/Build Version Errors

These are common with older starter projects when Flutter updates. **Quick fix: Use Chrome instead!**

#### Error 1: Gradle Version Too Old
```
Flutter support for your project's Gradle version (8.3.0) will soon be dropped
```

**Fix:** Edit `android/gradle/wrapper/gradle-wrapper.properties`, change:
```
distributionUrl=https\://services.gradle.org/distributions/gradle-8.3-all.zip
```
To:
```
distributionUrl=https\://services.gradle.org/distributions/gradle-8.7-all.zip
```

#### Error 2: Android Gradle Plugin Too Old
```
Your project's Android Gradle Plugin version (8.1.0) is lower than Flutter's minimum (8.1.1)
```

**Fix:** Edit `android/settings.gradle`, change:
```gradle
id "com.android.application" version "8.1.0" apply false
```
To:
```gradle
id "com.android.application" version "8.1.1" apply false
```
(Or use version 8.2.1 for newer Flutter)

#### Best Solution: Start Fresh
If you encounter multiple build errors, **create a new Flutter project** and copy your 3 starter files.

**In-Class Backup:** Have students use **Chrome** if they hit build issues - web builds skip all Gradle problems!

---

## PART 5: Settings Overlay with Sliders

### STEP 12: Create Settings Overlay with Slider Controls

**Action:** Build a settings screen with sliders for volume controls

**Code: overlay_settings.dart**

> **COPY-PASTE FRIENDLY:** Students can copy this to save time

```dart
import 'package:flutter/material.dart';

Widget settingsOverlay(BuildContext context, game) {
  return Center(
    child: Container(
      width: 350,
      height: 400,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 180, 150, 200),  // Purple color
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Settings",
            style: TextStyle(
              color: Colors.black,
              fontSize: 48,
            ),
          ),
          const SizedBox(height: 20),

          // Music volume slider
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.music_note),
              ),
              Expanded(
                child: Slider(
                  value: 100,
                  min: 0,
                  max: 100,
                  divisions: 5,
                  label: "100",
                  onChanged: (value) {
                    // TODO: Connect to actual volume control
                  },
                ),
              ),
            ],
          ),

          // Sound effects volume slider
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.volume_up),
              ),
              Expanded(
                child: Slider(
                  value: 100,
                  min: 0,
                  max: 100,
                  divisions: 5,
                  label: "100",
                  onChanged: (value) {
                    // TODO: Connect to actual volume control
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              game.overlays.remove('settings');
              game.paused = false;
            },
            child: const Text("Close"),
          ),
        ],
      ),
    ),
  );
}
```

**Key Points:**
- **Slider widget** - Built-in Material widget for range selection
- **value** - Current value (hardcoded for now)
- **min/max** - Range of slider
- **divisions** - Number of discrete steps (creates notches)
- **label** - Shows value when dragging
- **onChanged** - Callback when value changes (empty for now)
- **Row layout** - Icon on left, slider expands to fill space

**Why sliders in overlays?** Games often need controls like volume sliders for background music and sound effects. You don't want to code sliders in the Flame game engine - Material UI already has these controls ready to use!

---

### STEP 13: Register Settings Overlay

**Register in main.dart:**
```dart
import 'overlay_settings.dart';
```

**Add to overlayBuilderMap:**
```dart
'settings': (context, game) {
  return settingsOverlay(context, game);
},
```

**What You Should See:**
- Click settings from HUD, pause screen, or title
- Purple settings overlay appears
- Two sliders (currently non-functional - values are hardcoded)
- Close button returns to game

**Note:** The sliders don't actually do anything yet. Next class will connect them to a Provider for state management.

---

## Summary

### What You've Built:
- ✅ Collision detection between asteroids (elastic bouncing)
- ✅ Title screen overlay (stateless widget)
- ✅ Persistent HUD overlay (score + controls)
- ✅ Pause menu overlay
- ✅ Info overlay with WebView (HTML content)
- ✅ Settings overlay with sliders

### Key Concepts Covered:

**Collision Detection:**
- `HasCollisionDetection` on the game class - enables the system
- `CollisionCallbacks` on components - lets them respond to collisions
- `CircleHitbox()` - defines the collision shape
- `onCollisionStart` - runs once when two hitboxes first overlap
- Elastic collision math transfers velocity between equal-mass objects

**Overlay System:**
- `overlayBuilderMap` - Register overlays with string keys
- `initialActiveOverlays` - Show overlays on startup
- `game.overlays.add('key')` - Show an overlay
- `game.overlays.remove('key')` - Hide an overlay

**Game Control:**
- `game.paused = true/false` - Pause/unpause game loop
- Cascade operator (`..`) for immediate property setting

**Widget Patterns:**
- StatelessWidget classes for complex overlays
- Widget functions for simple overlays
- Material with `Colors.transparent` to avoid blocking screen

**Two Typing Approaches for Game Reference:**

| Approach | Example | Pros | Cons | When to Use |
|----------|---------|------|------|-------------|
| **Generic typing** | `final game;` (Title overlay) | Simple, flexible, less code in main.dart | No type safety, no autocomplete, can't use `const` constructor | Quick prototypes, simple overlays |
| **Strict typing** | `final OverlayTutorial game;` (Info overlay) | Type safety, autocomplete works, catches errors | Requires casting in main.dart (`as OverlayTutorial`) | Production code, complex overlays |

**Common Widgets Used:**
- `Align` - Position overlays on screen
- `Container` - Styling and sizing
- `Row`/`Column` - Layout
- `Expanded` - Fill available space
- `Slider` - Range input control
- `WebViewWidget` - Display HTML content

### Important Notes:

**Pausing Logic:**
The settings overlay currently has a small issue - it always unpauses when closed, even if opened from the title screen. You'd need conditional logic:
```dart
// Pseudocode
if (came_from_title) {
  // Don't unpause
} else {
  game.paused = false;
}
```

**Sliders Don't Work Yet:**
Values are hardcoded. Next class will add Provider to make them functional.

### Troubleshooting:

| Problem | Solution |
|---------|----------|
| Asteroids pass through each other | Check `HasCollisionDetection` on game class, `CollisionCallbacks` on Asteroid |
| Asteroids get stuck/jitter | Make sure the `if (impulse > 0)` guard is in `onCollisionStart` |
| Overlay doesn't appear | Check overlayBuilderMap has correct key, verify add() is called |
| Can't click through overlay | Overlays block input by default - this is intended behavior |
| Gradle version error | Update `settings.gradle` to use version 8.2.1 |
| WebView shows blank | Check HTML string has proper structure, ensure `loadHtmlString()` called |
| Entire screen turns solid color | Change Material color to `Colors.transparent` |
| Sliders don't update | Normal - values are hardcoded for now, will fix with Provider next week |

### Next Steps:
- Add Provider for state management to make sliders functional
- Make sliders actually control volume values
- Update score dynamically
- Add audio (background music and sound effects)

---
