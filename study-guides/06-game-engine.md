# Study Guide 06: Into the Game Engine

**Read before:** Week 11B (Thursday: Flame setup and your first game)

> **Reading only: no video and no quiz for this one.** It's about a 10-minute read. Nothing here
> needs memorizing, and we build all of it together on Thursday. The point is that none of it
> catches you off guard.

---

## What's Changing

Week 11B is the most abrupt gear shift in the course. On Thursday you'll stop building Flutter widget apps and start building a game, and the two work almost nothing alike.

Flame is a game engine that runs inside Flutter. But your game doesn't use widgets. It doesn't use `setState()`. It doesn't have a `build()` method. Instead it has a **game loop**: Flame runs your code about 60 times per second, updating the game and redrawing the screen every time.

If you walk into 11B expecting to apply what you know about widgets, you'll be disoriented. This guide covers what's actually different so you can focus on the game itself.

---

## The Key Mental Shift

> Widget apps are event-driven: they wait for user input, then redraw. Games are loop-driven: they update and redraw constantly, every frame.

In a Flutter widget app, nothing happens until something changes: a user taps a button, or data loads from the network. The app sits idle between events.

In a Flame game, the world is always in motion. Every frame, Flame calls your `update()` method whether the player touched the screen or not. That's where you move things, check for collisions, and keep score. Then Flame redraws everything in its new spot and starts over.

```
┌──────────────┐
│   onLoad()   │        once: load the image, set size and position
└──────┬───────┘
       ↓
┌──────────────┐
│  update(dt)  │ ←──┐   every frame: move, collide, keep score
└──────┬───────┘    │
       ↓            │
┌──────────────┐    │
│    render    │ ───┘   every frame: Flame draws it all for you
└──────────────┘
  repeats about 60 times per second
```

On Thursday you'll write two methods: `onLoad()` to set something up, and `update(dt)` to change it every frame. You won't write the drawing step. A `SpriteComponent` already knows how to draw its own image.

---

## What You Already Know, Translated

Most things you know from widgets have a Flame version. If you only read one part of this guide, read this table.

| In a widget app you... | In Flame you... | Thursday's code |
|---|---|---|
| build screens out of widgets | build the game out of **components** | `class Player extends SpriteComponent` |
| describe the screen in `build()` | set things up once in `onLoad()` | `sprite = ...`, `position = ...` |
| call `setState()` to make a change show up | change values in `update(dt)`, and the next frame shows it | `position.add(...)` |
| lay things out with `Column`, `Row`, `Padding` | give each thing an x/y `position` | `Vector2(x, y)` |
| handle taps with `onPressed:` | add an input mixin to the game | `with PanDetector`, `with TapCallbacks` |
| nest widgets with `child:` and `children:` | nest components with `add()` | `add(player)` |

---

## Positioning: x and y, Not Column and Row

There are no `Column`, `Row`, or `Padding` widgets in game space. Everything has a `position`, which is a `Vector2` (an x and a y), plus a `size`. To move something, you change its position.

```
(0, 0)                 x grows →
   ┌──────────────────────────┐
   │                          │
   │                          │
 y │                          │
 ↓ │                          │
   │                          │
   │          [ship]          │  ← Vector2(game.size.x / 2, game.size.y - 100)
   │                          │     (centered, 100 pixels up from the bottom)
   └──────────────────────────┘ (game.size.x, game.size.y)
```

Two things that trip people up:

- **(0, 0) is the top-left corner, and y goes down.** A bigger y means lower on the screen. If you're used to Unity, that's flipped.
- **The anchor decides which point of the sprite sits at its position.** By default it's the sprite's top-left corner. On Thursday we set `anchor = Anchor.center` so the position is the middle of the ship, which also makes rotation look right.

---

## Why `update(dt)` Gets a `dt`

`dt` stands for delta time: the number of seconds since the last frame. At 60 frames per second it's about 0.016.

Phones don't all run at the same frame rate. If you move something a fixed amount every frame, it moves at different speeds on different devices:

| Code inside `update(dt)` | 30 fps phone | 120 fps phone |
|---|---|---|
| `position.x += 5;` (5 pixels per frame) | 150 pixels/sec | 600 pixels/sec |
| `position.x += 100 * dt;` (100 pixels per second) | 100 pixels/sec | 100 pixels/sec |

Multiply movement by `dt` and your speeds mean the same thing on every device. If you've used Unity, this is `Time.deltaTime`, handed to you as a parameter.

---

## Where Flame Sits in Your App

The whole game lives inside one Flutter widget, `GameWidget`. Inside it, things are components instead of widgets, and you nest them with `add()` instead of `child:`.

```
GameWidget                    a normal Flutter widget
└── FlameDemoGame             your game (extends FlameGame)
    ├── Player                your ship (extends SpriteComponent)
    └── JoystickComponent     added later in class
```

UI that sits on top of the game, like a score or a pause button, is still regular Flutter widgets. Flame calls these **overlays**, and they're Week 12A.

```
┌──────────────────────────┐
│ Score: 120        [ || ] │  ← overlays: regular Flutter widgets
│                          │
│                          │
│          [ship]          │  ← the game: Flame draws everything in here
│                          │
│                          │
└──────────────────────────┘
```

---

## Want to Peek Ahead?

Optional. These are the reference pages we'll use in class, with the actual code. Skim them if you're curious, but you don't need them before Thursday.

- [GameWidget Basics](../reference/flame/gamewidget-basics.md): how Flame fits inside a Flutter app, and the game loop
- [Sprite Components](../reference/flame/sprite-components.md): loading and showing images
- [Input Handling](../reference/flame/input-handling.md): drag and tap input

For later, once you're deeper into game work:

- [Joystick Component](../reference/flame/joystick-component.md)
- [Flame Overlays](../reference/game-development/flame-overlays.md)

---

## Check Yourself

1. Which method runs once when a component is set up, and which one runs every frame?
2. Where is (0, 0) on a Flame screen, and which way does y go?
3. How is positioning a sprite in Flame different from positioning a widget in Flutter?
4. `GameWidget` is a Flutter widget. What does it actually contain?
5. If you want a score counter on top of the game, would you use a Flame component or a Flutter widget? Why?
6. What does `dt` mean in `update(dt)`, and why do you multiply movement by it?

---

## What's Coming in Weeks 11–13

Week 11B is game setup, sprites, and three ways to move things: drag, tap, and an on-screen joystick. Week 12A adds overlays (Flutter widgets layered on the game, like score displays, menus, and pause screens) and pause/resume. Week 12B covers audio (`audioplayers`) and connecting Provider to your game. Week 13 steps back to the app lifecycle (what happens when your app goes to the background) and finishing touches like splash screens and icons.

You don't have to use Flame for Project 3. It can be a game or an app, and Flame is one option if you go the game route.

---

*IGME-340: Study Guide 6 (reading only)*
