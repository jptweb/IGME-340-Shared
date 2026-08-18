# Phase 5 — Into the Game Engine

**Read before:** Week 11B (Flame setup and your first game)

---

## What's Changing

Week 11B is the most abrupt gear shift in the course. On Wednesday of Week 11 you'll stop building Flutter widget apps and start building a game — and the two things work almost nothing alike.

Flame is a game engine that runs inside Flutter. But it doesn't use widgets. It doesn't use `setState()`. It doesn't have a `build()` method. Instead it has a **game loop**: a function that runs ~60 times per second, updating game state and redrawing the screen continuously.

If you walk into 11B expecting to apply what you know about widgets, you'll be disoriented. The goal of this guide is to prepare you for what's actually different — so you can focus on the game itself instead of the confusion.

---

## The Key Mental Shift

> Widget apps are event-driven — they wait for user input, then redraw. Game apps are loop-driven — they update and redraw constantly, every frame.

In a Flutter widget app, nothing happens until something changes: a user taps a button, data loads from the network. The app sits idle between events.

In a Flame game, the world is always in motion. Every frame, your `update()` method runs — moving sprites, checking for collisions, advancing animations — whether the player touched the screen or not. Your `render()` method then draws the current state of the game world to the screen. You write these two methods, and Flame calls them 60 times per second.

The other shift: you position things with `x` and `y` coordinates (like a canvas), not with layout widgets. There are no `Column` or `Row` widgets in game space. Sprites have positions and sizes; you move them by changing their coordinates in `update()`.

---

## Before You Come to Class

- **[GameWidget Basics](../reference/flame/gamewidget-basics.md)** — how Flame fits inside a Flutter app; `FlameGame`, `GameWidget`, and the `update()`/`render()` cycle
- **[Sprite Components](../reference/flame/sprite-components.md)** — loading and displaying images in a Flame game
- **[Input Handling](../reference/flame/input-handling.md)** — detecting taps and key presses in game space

Optional but useful — read after class when you get deeper into the game project:
- **[Joystick Component](../reference/flame/joystick-component.md)**
- **[Flame Overlays](../reference/game-development/flame-overlays.md)**

---

## Check Yourself

1. In Flame, what are the two methods you override to make a game work? What does each one do?
2. How is sprite positioning in Flame different from widget positioning in Flutter?
3. `GameWidget` is a Flutter widget — what does it actually contain?
4. If you want a score counter displayed on top of the game, would you use a Flame component or a Flutter widget? Why?
5. What does `dt` (delta time) mean in an `update(dt)` method? Why does Flame pass it to you?

---

## What's Coming in Weeks 11–13

Week 11B is game setup, sprites, and basic input. Week 12A adds overlays (Flutter widgets layered on top of the game — score displays, menus, pause screens) and pause/resume. Week 12B covers audio (`audioplayers`) and integrating Provider with your game. Week 13 steps back to app lifecycle — how Flutter apps behave when they're sent to the background — and production prep (splash screens, icons). Project 3 starts in Week 11, so the game weeks are also your main project work period.

---

*IGME-340 — Study Guide 6 of 6*
