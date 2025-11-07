# Sprite Components Reference

**When Covered:** Week 11B  
**Package:** `flame` (pub.dev)  
**Prerequisites:** [GameWidget & FlameGame Basics](gamewidget-basics.md)

---

## What is a SpriteComponent?

A `SpriteComponent` is Flame's way of representing a **visual game object** - anything that displays an image on screen (player, enemy, coin, background, etc.).

**Built-in Features:**
- ✅ Position, size, and rotation
- ✅ Automatic rendering (you set properties, Flame draws it)
- ✅ Lifecycle hooks (onLoad, update)
- ✅ Parent-child relationships
- ✅ Collision detection support

**Think of it as:** A GameObject/Actor/Entity from other game engines

---

## Quick Example

```dart
import 'package:flame/components.dart';
import 'main.dart';  // Your game class

class Player extends SpriteComponent with HasGameReference<MyGame> {
  @override
  Future<void> onLoad() async {
    sprite = Sprite(game.images.fromCache('player.png'));
    position = Vector2(100, 200);
    size = Vector2(64, 64);
    anchor = Anchor.center;
  }
  
  @override
  void update(double dt) {
    super.update(dt);
    position.x += 100 * dt;  // Move right at 100 pixels/second
  }
}
```

---

## Core Concepts

### Extending SpriteComponent

```dart
class Player extends SpriteComponent with HasGameReference<MyGame> {
  // Your player code
}
```

**Breaking it down:**
- `extends SpriteComponent` - Gives you sprite properties and rendering
- `with HasGameReference<MyGame>` - Gives access to game via `game.`
- `<MyGame>` - Replace with your actual game class name

**Why HasGameReference?**
```dart
// Without it:
// Can't access screen size, loaded images, or game state

// With it:
position = Vector2(game.size.x / 2, game.size.y / 2);  // Center of screen
sprite = Sprite(game.images.fromCache('player.png'));  // Access loaded assets
```

### Lifecycle Methods

```dart
class Player extends SpriteComponent with HasGameReference<MyGame> {
  // Runs once when component is added to game
  @override
  Future<void> onLoad() async {
    // Set initial properties
    sprite = Sprite(game.images.fromCache('player.png'));
    position = Vector2(100, 100);
    size = Vector2(64, 64);
  }
  
  // Runs every frame (~60 times/second)
  @override
  void update(double dt) {
    super.update(dt);
    // Game logic here
    position.x += speed * dt;
  }
  
  // Optional - runs when removed from game
  @override
  void onRemove() {
    super.onRemove();
    // Cleanup code
  }
}
```

---

## Essential Properties

### Position

Where the sprite is on screen.

```dart
// Set position
position = Vector2(100, 200);  // x: 100, y: 200

// Modify position
position.x += 10;
position.y -= 5;

// Using methods
position.add(Vector2(10, 0));      // Move right
position.setFrom(Vector2(50, 50)); // Jump to position

// Access game size for centering
position = Vector2(game.size.x / 2, game.size.y / 2);
```

**Coordinate System:**
- (0, 0) is **top-left** corner
- X increases going **right**
- Y increases going **down**

### Size

How big the sprite displays (scales the image).

```dart
// Set size explicitly
size = Vector2(64, 64);

// Or just width/height
width = 100;
height = 100;

// Scale uniformly
scale = Vector2.all(2.0);  // 2x size

// Scale differently per axis
scale = Vector2(2.0, 1.0);  // Wide but not tall
```

### Anchor

The "handle" point of the sprite - affects positioning and rotation.

```dart
// Common anchor points
anchor = Anchor.center;      // Middle of sprite
anchor = Anchor.topLeft;     // Top-left corner (default)
anchor = Anchor.bottomCenter; // Bottom center

// Custom anchor (0.0 to 1.0 range)
anchor = Anchor(0.5, 0.25);  // Horizontal center, 25% from top
```

**Why anchor matters:**

```dart
// With anchor = Anchor.topLeft (default):
position = Vector2(100, 100);
// Top-left corner of sprite is at (100, 100)

// With anchor = Anchor.center:
position = Vector2(100, 100);
// CENTER of sprite is at (100, 100)

// Rotation always happens around anchor point!
anchor = Anchor.center;  // Rotates around center (usually what you want)
angle = 1.57;            // 90 degrees in radians
```

### Angle (Rotation)

Rotation in **radians** (not degrees!).

```dart
// Set rotation
angle = 1.57;  // 90 degrees (π/2 radians)

// Common rotations
angle = 0;      // 0 degrees (facing right)
angle = 1.57;   // 90 degrees (facing down)
angle = 3.14;   // 180 degrees (facing left)
angle = 6.28;   // 360 degrees (full circle)

// Rotate over time
@override
void update(double dt) {
  super.update(dt);
  angle += 2 * dt;  // Rotate 2 radians per second
}

// Convert degrees to radians
import 'dart:math';
angle = 90 * pi / 180;  // 90 degrees to radians
```

---

## Common Patterns

### Pattern 1: Basic Player Component

```dart
class Player extends SpriteComponent with HasGameReference<MyGame> {
  double speed = 200.0;
  
  @override
  Future<void> onLoad() async {
    sprite = Sprite(game.images.fromCache('player.png'));
    position = Vector2(game.size.x / 2, game.size.y - 100);
    size = Vector2(64, 64);
    anchor = Anchor.center;
  }
  
  @override
  void update(double dt) {
    super.update(dt);
    // Movement logic goes here
  }
  
  void moveLeft(double dt) {
    position.x -= speed * dt;
  }
  
  void moveRight(double dt) {
    position.x += speed * dt;
  }
}
```

### Pattern 2: Enemy with Movement

```dart
class Enemy extends SpriteComponent with HasGameReference<MyGame> {
  Vector2 velocity = Vector2(100, 50);  // Moving right and down
  
  @override
  Future<void> onLoad() async {
    sprite = Sprite(game.images.fromCache('enemy.png'));
    position = Vector2(0, 100);
    size = Vector2(48, 48);
    anchor = Anchor.center;
  }
  
  @override
  void update(double dt) {
    super.update(dt);
    
    // Move based on velocity
    position.add(velocity * dt);
    
    // Bounce off edges
    if (position.x <= 0 || position.x >= game.size.x) {
      velocity.x *= -1;  // Reverse horizontal direction
    }
    
    // Remove if off bottom of screen
    if (position.y > game.size.y + 50) {
      removeFromParent();
    }
  }
}
```

### Pattern 3: Collectible Item

```dart
class Coin extends SpriteComponent with HasGameReference<MyGame> {
  @override
  Future<void> onLoad() async {
    sprite = Sprite(game.images.fromCache('coin.png'));
    size = Vector2(32, 32);
    anchor = Anchor.center;
  }
  
  @override
  void update(double dt) {
    super.update(dt);
    
    // Spin the coin
    angle += 5 * dt;
    
    // Bob up and down
    position.y += (10 * sin(angle)).toDouble();
  }
  
  void collect() {
    // Play sound, add score, etc.
    removeFromParent();
  }
}
```

### Pattern 4: Component with Constructor Parameters

```dart
class Projectile extends SpriteComponent with HasGameReference<MyGame> {
  final Vector2 direction;
  final double speed;
  
  Projectile({
    required this.direction,
    this.speed = 500.0,
  });
  
  @override
  Future<void> onLoad() async {
    sprite = Sprite(game.images.fromCache('bullet.png'));
    size = Vector2(16, 16);
    anchor = Anchor.center;
    
    // Point in direction of travel
    angle = direction.screenAngle();
  }
  
  @override
  void update(double dt) {
    super.update(dt);
    position.add(direction * speed * dt);
    
    // Remove if off-screen
    if (position.x < -50 || position.x > game.size.x + 50 ||
        position.y < -50 || position.y > game.size.y + 50) {
      removeFromParent();
    }
  }
}

// Usage in game:
add(Projectile(
  direction: Vector2(1, 0).normalized(),  // Shooting right
  speed: 600,
));
```

---

## Vector2 Quick Reference

Flame uses `Vector2` for 2D coordinates and directions.

```dart
// Creating vectors
Vector2(100, 200)      // x: 100, y: 200
Vector2.zero()         // (0, 0)
Vector2.all(50)        // (50, 50)

// Common operations
vector1.add(vector2)        // Add vectors (modifies vector1)
vector1.sub(vector2)        // Subtract vectors
vector1 + vector2           // Add (returns new vector)
vector1 - vector2           // Subtract (returns new vector)
vector * 2.0                // Multiply by scalar
vector / 2.0                // Divide by scalar

// Useful methods
vector.length               // Distance from (0,0)
vector.normalized()         // Unit vector (length = 1)
vector.distanceTo(other)    // Distance between two points
vector.angleTo(other)       // Angle between vectors
vector.screenAngle()        // Angle for screen rotation
vector.clone()              // Copy the vector

// Direction vectors
Vector2(1, 0)    // Right
Vector2(-1, 0)   // Left
Vector2(0, 1)    // Down
Vector2(0, -1)   // Up

// Example: Move towards target
Vector2 direction = (target - position).normalized();
position.add(direction * speed * dt);
```

---

## Adding Components to Game

```dart
// In your game class
class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await images.loadAll(['player.png', 'enemy.png']);
    
    // Method 1: Create then add
    final player = Player();
    add(player);
    
    // Method 2: Create inline
    add(Enemy());
    
    // Method 3: Add with position
    add(
      Coin()
        ..position = Vector2(200, 300)
        ..size = Vector2(32, 32)
    );
  }
}
```

### Removing Components

```dart
// From inside the component
removeFromParent();

// From game or parent component
component.removeFromParent();

// Remove after condition
if (health <= 0) {
  removeFromParent();
}
```

---

## Important Rules

### ✅ DO

```dart
// Always use HasGameReference mixin
class Player extends SpriteComponent with HasGameReference<MyGame> {
  // ...
}

// Set anchor for rotation
anchor = Anchor.center;

// Use delta time for movement
position.x += speed * dt;

// Load sprite from cache (must be preloaded)
sprite = Sprite(game.images.fromCache('sprite.png'));

// Call super in lifecycle methods
@override
void update(double dt) {
  super.update(dt);
  // Your code
}
```

### ❌ DON'T

```dart
// Don't forget HasGameReference
class Player extends SpriteComponent {  // Missing mixin!
  // Can't access game.size or game.images
}

// Don't hardcode movement
position.x += 5;  // Frame-rate dependent!

// Don't try to load images in component
sprite = Sprite(await images.load('sprite.png'));  // Wrong place!

// Don't forget to add to game
player = Player();
// Missing add(player)!
```

---

## Common Errors & Fixes

### "Cannot access game before it's set"

**Problem:** Trying to use `game` before component is added

```dart
// WRONG - onLoad runs before game is set
class Player extends SpriteComponent with HasGameReference<MyGame> {
  final Vector2 startPos = game.size / 2;  // Error!
  
  @override
  Future<void> onLoad() async {
    // Use game here instead
    position = game.size / 2;  // Correct!
  }
}
```

### Sprite Appears in Wrong Location

**Problem:** Forgetting about anchor point

```dart
// If sprite appears offset from where you expect:
anchor = Anchor.center;  // Usually what you want

// Or check if you're accounting for anchor in position calculations
```

### Rotation Looks Weird

**Problem:** Wrong anchor or using degrees instead of radians

```dart
// WRONG - degrees
angle = 90;  // Actually 90 radians (way more than 1 circle!)

// CORRECT - radians
import 'dart:math';
angle = 90 * pi / 180;  // Convert degrees to radians

// Also make sure anchor is center for rotation
anchor = Anchor.center;
```

---

## Performance Tips

### Efficient Component Creation

```dart
// ✅ GOOD - Reuse components by moving them
component.position = newPosition;
component.sprite = newSprite;

// ❌ LESS EFFICIENT - Creating new components frequently
for (int i = 0; i < 100; i++) {
  add(Bullet());  // Creates 100 new objects
}
```

### Cleanup Off-Screen Components

```dart
@override
void update(double dt) {
  super.update(dt);
  
  // Remove if far off screen
  if (position.x < -100 || position.x > game.size.x + 100 ||
      position.y < -100 || position.y > game.size.y + 100) {
    removeFromParent();  // Frees memory
  }
}
```

---

## When Covered in Course

- **[Week 11B](../../weekly/11B.md)** - SpriteComponent basics, positioning, movement, rotation
- **Project 3** - Optional for game-based projects

---

## Related Topics

- [GameWidget & FlameGame Basics](gamewidget-basics.md) - Setting up Flame
- [Input Handling](input-handling.md) - Making sprites respond to touch/keyboard
- [JoystickComponent](joystick-component.md) - On-screen joystick control

---

## Quick Reference

```dart
// Basic structure
import 'package:flame/components.dart';
import 'main.dart';

class Player extends SpriteComponent with HasGameReference<MyGame> {
  @override
  Future<void> onLoad() async {
    sprite = Sprite(game.images.fromCache('player.png'));
    position = Vector2(x, y);
    size = Vector2(width, height);
    anchor = Anchor.center;
  }
  
  @override
  void update(double dt) {
    super.update(dt);
    // Movement logic
  }
}

// Common properties
position      // Vector2 - where sprite is
size          // Vector2 - display size
width/height  // double - individual dimensions
anchor        // Anchor - reference point
angle         // double - rotation in radians
scale         // Vector2 - size multiplier

// Common methods
removeFromParent()     // Remove from game
add(component)         // Add child component
position.add(delta)    // Move by offset
position.distanceTo(other)  // Distance between points
```

---

*Last updated: Week 11B | Fall 2025*
