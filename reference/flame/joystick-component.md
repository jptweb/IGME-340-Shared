# JoystickComponent Reference

**When Covered:** Week 11B  
**Package:** `flame` (pub.dev - included with Flame)  
**Prerequisites:** [GameWidget & FlameGame Basics](gamewidget-basics.md), [Sprite Components](sprite-components.md)

---

## What is JoystickComponent?

`JoystickComponent` is Flame's **built-in virtual joystick** for mobile games. It provides an on-screen thumbstick that players can drag to control movement.

**Features:**
- ✅ No input mixins required (works standalone)
- ✅ Customizable appearance (colors, sprites, or both)
- ✅ Returns direction and intensity
- ✅ Automatically positioned with margins
- ✅ Mobile-friendly touch controls

**Think of it as:** An on-screen D-pad or analog stick for mobile games

---

## Quick Example

```dart
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

class MyGame extends FlameGame {
  late JoystickComponent joystick;
  late Player player;
  
  @override
  Future<void> onLoad() async {
    // Create joystick with circle graphics
    joystick = JoystickComponent(
      knob: CircleComponent(
        radius: 15,
        paint: BasicPalette.red.withAlpha(200).paint(),
      ),
      background: CircleComponent(
        radius: 50,
        paint: BasicPalette.red.withAlpha(100).paint(),
      ),
      margin: const EdgeInsets.only(left: 20, bottom: 20),
    );
    
    // Create player and give it the joystick
    player = Player(joystick: joystick);
    
    add(joystick);
    add(player);
  }
}
```

---

## Core Concepts

### Creating a Joystick

```dart
joystick = JoystickComponent(
  knob: /* Widget for the draggable part */,
  background: /* Widget for the outer circle */,
  margin: /* Position on screen */,
);
```

**Required Parameters:**
- `knob` - The small circle you drag (usually 15-30px radius)
- `background` - The larger circle showing joystick bounds (usually 50-80px radius)

**Optional Parameters:**
- `margin` - Position on screen (default: bottom-left)
- `priority` - Z-order (higher = on top)

### CircleComponent for Visuals

Instead of using sprite images, you can draw circles programmatically:

```dart
// Import for colors
import 'package:flame/palette.dart';

// Create paint objects
final knobPaint = BasicPalette.red.withAlpha(200).paint();
final bgPaint = BasicPalette.red.withAlpha(100).paint();

// Use in joystick
joystick = JoystickComponent(
  knob: CircleComponent(
    radius: 15,
    paint: knobPaint,
  ),
  background: CircleComponent(
    radius: 50,
    paint: bgPaint,
  ),
);
```

**Color Properties:**
- `BasicPalette.red` - Predefined color
- `.withAlpha(200)` - Transparency (0-255, where 255 = opaque)
- `.paint()` - Converts to Paint object for rendering

### Positioning with Margin

```dart
// Bottom-left (default feel)
margin: const EdgeInsets.only(left: 20, bottom: 20)

// Bottom-right
margin: const EdgeInsets.only(right: 20, bottom: 20)

// Top-left
margin: const EdgeInsets.only(left: 20, top: 20)

// All sides
margin: const EdgeInsets.all(20)

// Symmetric
margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20)
```

---

## Reading Joystick Input

### Key Properties

```dart
// Direction the joystick is pushed
Vector2 direction = joystick.delta;

// Normalized direction (-1 to 1 range)
Vector2 normalizedDir = joystick.relativeDelta;

// Is joystick being touched?
bool isTouched = !joystick.delta.isZero();

// Intensity (0.0 to 1.0, where 1.0 = pushed to edge)
double intensity = joystick.intensity;
```

### Using in Player Component

```dart
class Player extends SpriteComponent with HasGameReference<MyGame> {
  final JoystickComponent joystick;
  double speed = 300.0;
  
  Player({required this.joystick});
  
  @override
  Future<void> onLoad() async {
    sprite = Sprite(game.images.fromCache('player.png'));
    position = Vector2(game.size.x / 2, game.size.y / 2);
    size = Vector2(64, 64);
    anchor = Anchor.center;
  }
  
  @override
  void update(double dt) {
    super.update(dt);
    
    // Only move if joystick is being used
    if (!joystick.delta.isZero()) {
      // Move based on joystick direction
      position.add(joystick.relativeDelta * speed * dt);
    }
  }
}
```

---

## Common Patterns

### Pattern 1: Basic Movement

```dart
@override
void update(double dt) {
  super.update(dt);
  
  if (!joystick.delta.isZero()) {
    position.add(joystick.relativeDelta * 300 * dt);
  }
}
```

### Pattern 2: Movement + Rotation

```dart
@override
void update(double dt) {
  super.update(dt);
  
  if (!joystick.delta.isZero()) {
    // Move
    position.add(joystick.relativeDelta * 300 * dt);
    
    // Rotate to face direction
    angle = joystick.delta.screenAngle();
  }
}
```

### Pattern 3: Variable Speed Based on Intensity

```dart
@override
void update(double dt) {
  super.update(dt);
  
  if (!joystick.delta.isZero()) {
    double speed = 300 * joystick.intensity;  // Slower when pushed less
    position.add(joystick.relativeDelta * speed * dt);
  }
}
```

### Pattern 4: Custom Joystick Colors

```dart
final knobPaint = BasicPalette.blue.withAlpha(255).paint();
final bgPaint = BasicPalette.blue.withAlpha(80).paint();

joystick = JoystickComponent(
  knob: CircleComponent(
    radius: 20,
    paint: knobPaint,
  ),
  background: CircleComponent(
    radius: 60,
    paint: bgPaint,
  ),
  margin: const EdgeInsets.only(left: 30, bottom: 30),
);
```

### Pattern 5: Using Sprite Images

```dart
@override
Future<void> onLoad() async {
  await images.loadAll(['joystick_base.png', 'joystick_knob.png']);
  
  joystick = JoystickComponent(
    knob: SpriteComponent.fromImage(
      game.images.fromCache('joystick_knob.png'),
      size: Vector2.all(30),
    ),
    background: SpriteComponent.fromImage(
      game.images.fromCache('joystick_base.png'),
      size: Vector2.all(100),
    ),
    margin: const EdgeInsets.only(left: 20, bottom: 20),
  );
  
  add(joystick);
}
```

---

## Complete Setup Example

```dart
// main.dart
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'player.dart';

void main() {
  runApp(
    GameWidget(
      game: MyGame(),
    ),
  );
}

class MyGame extends FlameGame {
  late Player player;
  late JoystickComponent joystick;
  
  final knobPaint = BasicPalette.red.withAlpha(200).paint();
  final knobBgPaint = BasicPalette.red.withAlpha(100).paint();
  
  @override
  Future<void> onLoad() async {
    await images.loadAll(['player.png']);
    
    // Create joystick
    joystick = JoystickComponent(
      knob: CircleComponent(
        radius: 15,
        paint: knobPaint,
      ),
      background: CircleComponent(
        radius: 50,
        paint: knobBgPaint,
      ),
      margin: const EdgeInsets.only(left: 20, bottom: 20),
    );
    
    // Create player with joystick reference
    player = Player(joystick: joystick);
    
    add(player);
    add(joystick);  // Don't forget to add joystick!
  }
}

// player.dart
import 'package:flame/components.dart';
import 'main.dart';

class Player extends SpriteComponent with HasGameReference<MyGame> {
  final JoystickComponent joystick;
  
  Player({required this.joystick});
  
  @override
  Future<void> onLoad() async {
    sprite = Sprite(game.images.fromCache('player.png'));
    position = Vector2(game.size.x / 2, game.size.y / 2);
    size = Vector2(64, 64);
    anchor = Anchor.center;
  }
  
  @override
  void update(double dt) {
    super.update(dt);
    
    if (!joystick.delta.isZero()) {
      position.add(joystick.relativeDelta * 300 * dt);
      angle = joystick.delta.screenAngle();
    }
  }
}
```

---

## Important Rules

### ✅ DO

```dart
// Create paint objects outside onLoad (final)
final knobPaint = BasicPalette.red.withAlpha(200).paint();

// Pass joystick to components that need it
player = Player(joystick: joystick);

// Add joystick to game
add(joystick);

// Check if joystick is being used
if (!joystick.delta.isZero()) {
  // Movement code
}

// Use relativeDelta for movement (normalized)
position.add(joystick.relativeDelta * speed * dt);
```

### ❌ DON'T

```dart
// Don't forget to add joystick to game
joystick = JoystickComponent(...);
// Missing add(joystick)! Won't appear!

// Don't use delta directly without checking
position.add(joystick.delta * dt);  // Will drift when not touched!

// Don't forget to pass joystick to player
player = Player();  // How will it know about joystick?

// Don't forget required constructor parameter
class Player extends SpriteComponent {
  Player({required this.joystick});  // Good!
  // final JoystickComponent joystick;  // But no variable! Error!
}
```

---

## Common Errors & Fixes

### Joystick Not Visible

**Problem:** Forgot to add joystick to game

```dart
// WRONG
joystick = JoystickComponent(...);
// Missing add!

// CORRECT
joystick = JoystickComponent(...);
add(joystick);
```

### Player Drifts When Not Touching

**Problem:** Not checking if joystick is zero

```dart
// WRONG - always moves
position.add(joystick.relativeDelta * 300 * dt);

// CORRECT - only moves when touched
if (!joystick.delta.isZero()) {
  position.add(joystick.relativeDelta * 300 * dt);
}
```

### Joystick Positioned Wrong

**Problem:** Incorrect EdgeInsets

```dart
// To change position, adjust margin:
margin: const EdgeInsets.only(right: 20, bottom: 20)  // Bottom-right
margin: const EdgeInsets.only(left: 20, top: 20)      // Top-left
```

### "The argument type 'Paint' can't be assigned to 'Paint Function()'"

**Problem:** Missing `.paint()` call

```dart
// WRONG
paint: BasicPalette.red.withAlpha(200)

// CORRECT
paint: BasicPalette.red.withAlpha(200).paint()
```

---

## Joystick Properties Reference

| Property | Type | Description |
|----------|------|-------------|
| `delta` | Vector2 | Raw joystick direction (non-normalized) |
| `relativeDelta` | Vector2 | Normalized direction (-1 to 1 range) |
| `intensity` | double | How far joystick is pushed (0.0 to 1.0) |
| `knob` | PositionComponent | The draggable inner circle |
| `background` | PositionComponent | The outer circle boundary |
| `margin` | EdgeInsets | Position on screen |

---

## Styling Options

### Color Palette

```dart
// Available colors in BasicPalette
BasicPalette.red
BasicPalette.blue
BasicPalette.green
BasicPalette.yellow
BasicPalette.white
BasicPalette.black

// Transparency (0-255)
.withAlpha(200)  // 200/255 opacity
.withAlpha(100)  // 100/255 opacity (more transparent)
.withAlpha(255)  // Fully opaque
```

### Size Guidelines

```dart
// Typical sizes:
knob: CircleComponent(radius: 15-25)       // Draggable part
background: CircleComponent(radius: 50-80) // Outer bounds

// Too small = hard to use
// Too large = blocks screen
```

---

## When Covered in Course

- **[Week 11B](../../weekly/11B.md)** - JoystickComponent creation, movement, rotation
- **Project 3** - Optional for game-based projects

---

## Related Topics

- [GameWidget & FlameGame Basics](gamewidget-basics.md) - Setting up Flame
- [Sprite Components](sprite-components.md) - Creating player objects
- [Input Handling](input-handling.md) - Alternative input methods

---

## Quick Reference

```dart
// Imports
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

// Create joystick
final knobPaint = BasicPalette.red.withAlpha(200).paint();
final bgPaint = BasicPalette.red.withAlpha(100).paint();

joystick = JoystickComponent(
  knob: CircleComponent(
    radius: 15,
    paint: knobPaint,
  ),
  background: CircleComponent(
    radius: 50,
    paint: bgPaint,
  ),
  margin: const EdgeInsets.only(left: 20, bottom: 20),
);

// Add to game
add(joystick);

// Pass to player
player = Player(joystick: joystick);

// Use in player update
if (!joystick.delta.isZero()) {
  position.add(joystick.relativeDelta * speed * dt);
  angle = joystick.delta.screenAngle();  // Face direction
}

// Common properties
joystick.delta              // Raw direction vector
joystick.relativeDelta      // Normalized (-1 to 1)
joystick.intensity          // Push strength (0.0 to 1.0)
joystick.delta.isZero()     // Is being touched?
joystick.delta.screenAngle() // Angle in radians
```

---

*Last updated: Week 11B | Fall 2025*
