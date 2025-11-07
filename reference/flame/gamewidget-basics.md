# GameWidget & FlameGame Basics

**When Covered:** Week 11B  
**Package:** `flame` (pub.dev)  
**Prerequisites:** Understanding of StatelessWidget, async/await

---

## What is Flame?

Flame is a **2D game engine** for Flutter that provides:
- ✅ Game loop with automatic frame updates (~60 FPS)
- ✅ Component system for organizing game objects
- ✅ Built-in sprite, animation, and input handling
- ✅ Cross-platform (Android, iOS, Web, Desktop)
- ✅ 1M+ downloads, actively maintained

**Think of it as:** A framework that handles the game loop so you can focus on game logic.

---

## Quick Example

```dart
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

void main() {
  runApp(
    GameWidget(
      game: MyGame(),
    ),
  );
}

class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    // Load assets and initialize game
  }
  
  @override
  void update(double dt) {
    super.update(dt);
    // Game logic runs here every frame
  }
}
```

---

## Core Concepts

### GameWidget

The bridge between Flutter and Flame - it's a Flutter widget that renders your game.

```dart
// Full-screen game
void main() {
  runApp(
    GameWidget(
      game: MyGame(),
    ),
  );
}

// Embedded in MaterialApp
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('My Game')),
        body: GameWidget(
          game: MyGame(),
        ),
      ),
    ),
  );
}
```

**Key Points:**
- `GameWidget` is a Flutter widget - can be used anywhere in your widget tree
- Takes a `game` parameter (your FlameGame instance)
- Automatically handles rendering at 60 FPS

### FlameGame

Your custom game class that extends `FlameGame`.

```dart
class MyGame extends FlameGame {
  // Three main lifecycle methods:
  
  // 1. onLoad - runs once when game starts
  @override
  Future<void> onLoad() async {
    // Load images, initialize components
  }
  
  // 2. update - runs every frame (~60 times/second)
  @override
  void update(double dt) {
    super.update(dt);
    // dt = delta time (seconds since last frame)
  }
  
  // 3. render - runs every frame after update
  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // Custom drawing code (usually not needed)
  }
}
```

---

## Asset Loading

### Setting Up Assets

**1. Create folder structure:**
```
your_project/
  ├── assets/
  │   └── images/
  │       ├── player.png
  │       └── enemy.png
```

**2. Configure pubspec.yaml:**
```yaml
flutter:
  assets:
    - assets/images/  # Trailing slash loads all files
```

**3. Load in onLoad:**
```dart
class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await images.loadAll([
      'player.png',   // Just filename - automatically looks in assets/images/
      'enemy.png',
      'background.png',
    ]);
  }
}
```

**Important Notes:**
- ⚠️ **Only the filename** - Flame automatically looks in `assets/images/`
- ⚠️ Use `await` - assets must finish loading before game continues
- ⚠️ Load ALL images upfront - prevents lag during gameplay

---

## The Game Loop

### Understanding Delta Time (dt)

```dart
@override
void update(double dt) {
  super.update(dt);
  
  // dt = time since last frame in seconds
  // On 60 FPS: dt ≈ 0.016 seconds (1/60)
  // On 30 FPS: dt ≈ 0.033 seconds (1/30)
  
  // Always multiply movement by dt for frame-rate independence
  position.x += speed * dt;  // Moves at consistent speed
}
```

**Why dt matters:**
```dart
// ❌ BAD - Movement speed depends on frame rate
position.x += 5;  // Faster on high FPS, slower on low FPS

// ✅ GOOD - Consistent speed regardless of frame rate
position.x += 300 * dt;  // Always moves 300 pixels/second
```

### Frame Lifecycle

```
┌─────────────────┐
│  onLoad() once  │
└────────┬────────┘
         ↓
    ┌────────┐
    │ update │ ←──┐
    └───┬────┘    │
        ↓         │
    ┌────────┐    │
    │ render │    │
    └───┬────┘    │
        ↓         │
    Wait for      │
    next frame ───┘
    (~16ms @60fps)
```

---

## Adding Components

Components are game objects (sprites, UI elements, etc.).

```dart
class MyGame extends FlameGame {
  late Player player;
  
  @override
  Future<void> onLoad() async {
    await images.loadAll(['player.png']);
    
    // Create component
    player = Player();
    
    // Add to game (makes it visible and active)
    add(player);
  }
}
```

**Key Points:**
- `add()` makes components visible and active
- Components have their own `onLoad()` and `update()` methods
- See [Sprite Components Reference](sprite-components.md) for more

---

## Common Patterns

### Pattern 1: Full-Screen Game

```dart
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

void main() {
  runApp(
    GameWidget(
      game: MyGame(),
    ),
  );
}

class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    // Game setup
  }
}
```

### Pattern 2: Game with Flutter UI

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Game'),
          backgroundColor: Colors.blue,
        ),
        body: GameWidget(
          game: MyGame(),
        ),
      ),
    );
  }
}
```

### Pattern 3: Fullscreen Mode

```dart
import 'package:flame/flame.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  
  runApp(
    GameWidget(
      game: MyGame(),
    ),
  );
}
```

**What this does:**
- Hides system UI (status bar, navigation bar)
- User sees prompt about swiping up to exit fullscreen
- Good for immersive game experiences

### Pattern 4: Multiple Asset Types

```dart
@override
Future<void> onLoad() async {
  // Load images
  await images.loadAll([
    'player.png',
    'enemy.png',
  ]);
  
  // Load audio (requires flame_audio package)
  // await FlameAudio.audioCache.loadAll([
  //   'background_music.mp3',
  //   'jump_sound.wav',
  // ]);
  
  // Initialize game objects
  player = Player();
  add(player);
}
```

---

## Important Rules

### ✅ DO

```dart
// Always call super in lifecycle methods
@override
void update(double dt) {
  super.update(dt);  // Important!
  // Your code here
}

// Use async/await for onLoad
@override
Future<void> onLoad() async {
  await images.loadAll(['sprite.png']);
}

// Multiply movement by dt
position += velocity * dt;

// Add components to make them active
player = Player();
add(player);
```

### ❌ DON'T

```dart
// Don't forget super.update()
@override
void update(double dt) {
  // Missing super.update(dt)!
  // Will cause issues
}

// Don't forget await
@override
Future<void> onLoad() async {
  images.loadAll(['sprite.png']);  // Missing await!
}

// Don't hardcode movement
position.x += 5;  // Frame-rate dependent!

// Don't forget to add components
player = Player();
// Missing add(player)! Won't appear in game
```

---

## Common Errors & Fixes

### "Cannot find sprite in cache"

**Problem:** Image not loaded or wrong filename

```dart
// WRONG - including full path
await images.loadAll(['assets/images/player.png']);

// CORRECT - just filename
await images.loadAll(['player.png']);
```

### Black Screen on Startup

**Normal!** Flame games show black screen by default.

```dart
// Add a background color or sprite to see something
@override
void onLoad() async {
  // Set background color
  backgroundColor = const Color(0xFF2A2A2A);
}
```

### Components Not Appearing

**Problem:** Forgot to `add()` them

```dart
// WRONG
player = Player();

// CORRECT
player = Player();
add(player);  // Must add to game!
```

### Game Runs Too Fast/Slow

**Problem:** Not using delta time

```dart
// WRONG - speed depends on frame rate
position.x += 5;

// CORRECT - consistent speed
position.x += 300 * dt;  // 300 pixels per second
```

---

## Performance Tips

### Loading Assets Efficiently

```dart
// ✅ GOOD - Load all at once during initialization
@override
Future<void> onLoad() async {
  await images.loadAll([
    'sprite1.png',
    'sprite2.png',
    'sprite3.png',
  ]);
}

// ❌ BAD - Loading during gameplay causes lag
void spawnEnemy() {
  await images.load('enemy.png');  // Laggy!
  enemy = Enemy();
}
```

### Component Management

```dart
// Remove off-screen components to save performance
@override
void update(double dt) {
  super.update(dt);
  
  if (enemy.position.x < -100) {
    enemy.removeFromParent();  // Removes from game
  }
}
```

---

## Debugging Tips

### Visual Debugging

```dart
class MyGame extends FlameGame {
  @override
  void onLoad() {
    // See component bounds
    debugMode = true;
  }
}
```

### Print Delta Time

```dart
@override
void update(double dt) {
  super.update(dt);
  print('dt: $dt');  // Check frame timing
}
```

---

## When Covered in Course

- **[Week 11B](../../weekly/11B.md)** - GameWidget, FlameGame, asset loading, game loop basics
- **Project 3** - Optional for game-based projects

---

## Related Topics

- [Sprite Components](sprite-components.md) - Creating visual game objects
- [Input Handling](input-handling.md) - Touch, tap, and gesture controls
- [JoystickComponent](joystick-component.md) - On-screen joystick

---

## Quick Reference

```dart
// Installation
flutter pub add flame

// Imports
import 'package:flame/game.dart';
import 'package:flame/components.dart';

// Basic structure
void main() {
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await images.loadAll(['sprite.png']);
  }
  
  @override
  void update(double dt) {
    super.update(dt);
  }
}

// Asset paths (pubspec.yaml)
flutter:
  assets:
    - assets/images/

// Load images (just filename!)
await images.loadAll(['player.png']);

// Access loaded image
Sprite(game.images.fromCache('player.png'))
```

---

*Last updated: Week 11B | Fall 2025*
