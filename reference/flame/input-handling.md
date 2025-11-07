# Input Handling in Flame

**When Covered:** Week 11B  
**Package:** `flame` (pub.dev)  
**Prerequisites:** [GameWidget & FlameGame Basics](gamewidget-basics.md), [Sprite Components](sprite-components.md)

---

## What Are Mixins for Input?

Flame uses **mixins** to add input handling to your game. Think of mixins as "superpowers" you add to your game class with the `with` keyword.

**Available Input Mixins:**
- ✅ `PanDetector` - Drag/swipe gestures
- ✅ `TapCallbacks` - Tap/click detection
- ✅ `DragCallbacks` - Advanced drag handling
- ✅ `KeyboardEvents` - Keyboard input (desktop/web)

**Important:** When you change mixins, you must **fully restart** the app (not just hot reload).

---

## Quick Examples

### Pan Gestures (Drag)

```dart
import 'package:flame/events.dart';

class MyGame extends FlameGame with PanDetector {
  late Player player;
  
  @override
  Future<void> onLoad() async {
    player = Player();
    add(player);
  }
  
  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.position.add(info.delta.global);
  }
}
```

### Tap Detection

```dart
import 'package:flame/events.dart';

class MyGame extends FlameGame with TapCallbacks {
  late Player player;
  
  @override
  void onTapUp(TapUpEvent event) {
    player.moveTo(event.localPosition);
  }
}
```

---

## PanDetector (Drag Gestures)

Detects continuous dragging motion - finger/mouse stays pressed.

### Available Methods

```dart
class MyGame extends FlameGame with PanDetector {
  @override
  void onPanDown(DragDownInfo info) {
    // Triggered when finger/mouse first presses down
    print('Pan started at: ${info.eventPosition.global}');
  }
  
  @override
  void onPanUpdate(DragUpdateInfo info) {
    // Called continuously while dragging
    // info.delta.global = how much moved since last frame
    player.position.add(info.delta.global);
  }
  
  @override
  void onPanStart(DragStartInfo info) {
    // Called after onPanDown, before onPanUpdate
  }
  
  @override
  void onPanEnd(DragEndInfo info) {
    // Called when finger/mouse releases
  }
  
  @override
  void onPanCancel() {
    // Called if drag is interrupted
  }
}
```

### Common Pattern: Direct Drag Control

```dart
class MyGame extends FlameGame with PanDetector {
  late Player player;
  
  @override
  Future<void> onLoad() async {
    await images.loadAll(['player.png']);
    player = Player();
    add(player);
  }
  
  @override
  void onPanUpdate(DragUpdateInfo info) {
    // Move player by drag amount
    player.move(info.delta.global);
  }
}

// In player.dart
class Player extends SpriteComponent with HasGameReference<MyGame> {
  // ...
  
  void move(Vector2 delta) {
    position.add(delta);
  }
}
```

---

## TapCallbacks (Tap/Click Detection)

Detects quick taps - finger/mouse presses and releases quickly.

### Available Methods

```dart
class MyGame extends FlameGame with TapCallbacks {
  @override
  void onTapDown(TapDownEvent event) {
    // Triggered when tap first touches screen
    print('Tap at: ${event.localPosition}');
  }
  
  @override
  void onTapUp(TapUpEvent event) {
    // Triggered when tap releases (most common)
    player.position = event.localPosition;
  }
  
  @override
  void onTapCancel(TapCancelEvent event) {
    // If tap is interrupted
  }
}
```

### Common Pattern: Tap-to-Move

```dart
class MyGame extends FlameGame with TapCallbacks {
  late Player player;
  
  @override
  void onTapUp(TapUpEvent event) {
    // Tell player to move to tapped location
    player.moveTo(event.localPosition);
  }
}

// In player.dart
class Player extends SpriteComponent with HasGameReference<MyGame> {
  late Vector2 moveTarget;
  double speed = 100.0;
  
  @override
  Future<void> onLoad() async {
    // ... sprite setup
    moveTarget = position.clone();
  }
  
  void moveTo(Vector2 target) {
    moveTarget = target;
  }
  
  @override
  void update(double dt) {
    super.update(dt);
    
    // Move smoothly towards target
    if (position.distanceTo(moveTarget) > 1) {
      Vector2 direction = (moveTarget - position).normalized();
      position.add(direction * speed * dt);
    }
  }
}
```

---

## Event Position Properties

All input events provide position information:

```dart
@override
void onTapUp(TapUpEvent event) {
  // Local position - coordinates in game space
  Vector2 gamePos = event.localPosition;
  
  // Device position - raw screen coordinates
  Vector2 screenPos = event.devicePosition;
  
  // Canvas position - accounting for game transformations
  Vector2 canvasPos = event.canvasPosition;
}

// For drag events:
@override
void onPanUpdate(DragUpdateInfo info) {
  // How much moved since last frame
  Vector2 movement = info.delta.global;
  
  // Current position
  Vector2 currentPos = info.eventPosition.global;
}
```

**Usually you want:** `localPosition` or `delta.global`

---

## Combining Multiple Input Types

You can use multiple mixins together:

```dart
class MyGame extends FlameGame with TapCallbacks, PanDetector {
  bool isDragging = false;
  
  @override
  void onTapUp(TapUpEvent event) {
    if (!isDragging) {
      // Handle tap
      spawnObject(event.localPosition);
    }
  }
  
  @override
  void onPanStart(DragStartInfo info) {
    isDragging = true;
  }
  
  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.position.add(info.delta.global);
  }
  
  @override
  void onPanEnd(DragEndInfo info) {
    isDragging = false;
  }
}
```

---

## Common Patterns

### Pattern 1: Simple Drag Movement

```dart
import 'package:flame/events.dart';

class MyGame extends FlameGame with PanDetector {
  late Player player;
  
  @override
  Future<void> onLoad() async {
    await images.loadAll(['player.png']);
    player = Player();
    add(player);
  }
  
  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.position.add(info.delta.global);
  }
}
```

### Pattern 2: Tap Spawning Objects

```dart
class MyGame extends FlameGame with TapCallbacks {
  @override
  void onTapUp(TapUpEvent event) {
    // Spawn a coin where tapped
    final coin = Coin()
      ..position = event.localPosition;
    add(coin);
  }
}
```

### Pattern 3: Drag with Boundaries

```dart
class MyGame extends FlameGame with PanDetector {
  late Player player;
  
  @override
  void onPanUpdate(DragUpdateInfo info) {
    Vector2 newPos = player.position + info.delta.global;
    
    // Clamp to screen bounds
    newPos.x = newPos.x.clamp(0, size.x);
    newPos.y = newPos.y.clamp(0, size.y);
    
    player.position = newPos;
  }
}
```

### Pattern 4: Double Tap Detection

```dart
class MyGame extends FlameGame with TapCallbacks {
  DateTime? lastTapTime;
  static const doubleTapWindow = Duration(milliseconds: 300);
  
  @override
  void onTapUp(TapUpEvent event) {
    final now = DateTime.now();
    
    if (lastTapTime != null && 
        now.difference(lastTapTime!) < doubleTapWindow) {
      // Double tap detected!
      onDoubleTap(event.localPosition);
      lastTapTime = null;
    } else {
      // Single tap
      onSingleTap(event.localPosition);
      lastTapTime = now;
    }
  }
  
  void onSingleTap(Vector2 position) {
    print('Single tap at $position');
  }
  
  void onDoubleTap(Vector2 position) {
    print('Double tap at $position');
  }
}
```

---

## Keyboard Input (Desktop/Web)

For keyboard controls on desktop or web:

```dart
import 'package:flame/events.dart';
import 'package:flutter/services.dart';

class MyGame extends FlameGame with KeyboardEvents {
  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.space) {
        player.jump();
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }
  
  @override
  void update(double dt) {
    super.update(dt);
    
    // Continuous key checking
    if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      player.moveLeft(dt);
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      player.moveRight(dt);
    }
  }
}
```

---

## Important Rules

### ✅ DO

```dart
// Import events package
import 'package:flame/events.dart';

// Add mixin to game class
class MyGame extends FlameGame with TapCallbacks {
  // ...
}

// Access event properties correctly
void onTapUp(TapUpEvent event) {
  Vector2 pos = event.localPosition;  // Game coordinates
}

// Use delta for smooth dragging
void onPanUpdate(DragUpdateInfo info) {
  position.add(info.delta.global);  // Smooth movement
}
```

### ❌ DON'T

```dart
// Don't forget the import
class MyGame extends FlameGame with TapCallbacks {  // Error without import!
  // ...
}

// Don't try to hot reload after changing mixins
// Must do full restart!

// Don't use wrong event type
void onTapUp(TapUpEvent event) {
  position = event.delta.global;  // Error! Tap events don't have delta
}

// Don't set position directly from every drag event
void onPanUpdate(DragUpdateInfo info) {
  position = info.eventPosition.global;  // Jumpy! Use delta instead
}
```

---

## Common Errors & Fixes

### "The method 'onTapUp' isn't defined"

**Problem:** Missing import or mixin

```dart
// WRONG
class MyGame extends FlameGame {
  void onTapUp(TapUpEvent event) { }  // Error!
}

// CORRECT
import 'package:flame/events.dart';

class MyGame extends FlameGame with TapCallbacks {
  @override
  void onTapUp(TapUpEvent event) { }
}
```

### Input Doesn't Work After Code Change

**Problem:** Forgot to restart after mixin change

**Solution:** Do a full app restart (stop and run again), not just hot reload

### Drag Feels Jumpy

**Problem:** Using position instead of delta

```dart
// WRONG - jumpy
void onPanUpdate(DragUpdateInfo info) {
  player.position = info.eventPosition.global;
}

// CORRECT - smooth
void onPanUpdate(DragUpdateInfo info) {
  player.position.add(info.delta.global);
}
```

---

## Touch Priority & Hit Detection

By default, the entire game receives input. To detect touches on specific components:

```dart
class Button extends SpriteComponent with TapCallbacks {
  @override
  void onTapUp(TapUpEvent event) {
    // Only called if this button was tapped
    onClick();
  }
  
  void onClick() {
    print('Button clicked!');
  }
}

// Add to game
add(Button()
  ..position = Vector2(100, 100)
  ..size = Vector2(80, 40)
);
```

---

## When Covered in Course

- **[Week 11B](../../weekly/11B.md)** - PanDetector, TapCallbacks, drag movement, tap-to-move
- **Project 3** - Optional for game-based projects

---

## Related Topics

- [GameWidget & FlameGame Basics](gamewidget-basics.md) - Setting up Flame
- [Sprite Components](sprite-components.md) - Creating game objects
- [JoystickComponent](joystick-component.md) - Virtual joystick control

---

## Quick Reference

```dart
// Imports
import 'package:flame/events.dart';

// Pan/Drag detection
class MyGame extends FlameGame with PanDetector {
  @override
  void onPanUpdate(DragUpdateInfo info) {
    position.add(info.delta.global);
  }
}

// Tap detection
class MyGame extends FlameGame with TapCallbacks {
  @override
  void onTapUp(TapUpEvent event) {
    Vector2 tapPos = event.localPosition;
  }
}

// Multiple mixins
class MyGame extends FlameGame with TapCallbacks, PanDetector {
  // Both tap and pan work
}

// Event properties
event.localPosition    // Game coordinates (most common)
event.devicePosition   // Raw screen coordinates
info.delta.global      // Movement since last frame (for drag)

// Keyboard (desktop/web)
class MyGame extends FlameGame with KeyboardEvents {
  @override
  KeyEventResult onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    // Handle keyboard
  }
}
```

---

*Last updated: Week 11B | Fall 2025*
