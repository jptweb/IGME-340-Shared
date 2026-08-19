# Phase 2 — Static to Stateful

**Read before:** Week 4A (setState and interactive widgets)

> **This guide is still a draft.** It will be filled out and finalized before the week it's
> assigned, so don't study from it yet. **Study Guides 01 and 02 are finished** and are the
> ones to read now. If you found this by browsing the repo ahead, that's fine, just know it
> will change.

---

## What's Changing

For the first three weeks you've been building layouts that just sit there. They look right, but nothing happens when you tap something. Week 4 is when that changes: you'll learn how to make the UI respond to the user.

This is the second big mental shift of the course, and it's one that trips people up if they go in cold. The core issue is this: Flutter's widget tree is **immutable** — once it's drawn, it doesn't change. So how do you update the screen? You don't change the existing widgets. You **rebuild them from scratch** with new data.

`setState()` is the mechanism that triggers this rebuild. Understanding *why* it works this way — not just the syntax — will save you a lot of debugging time later.

---

## The Key Mental Shift

> The UI is a function of state. You don't change the UI directly — you change the data, then Flutter redraws.

Imagine a counter app. When the user taps "+", you don't reach into the `Text` widget and update its number. Instead you update the counter variable, call `setState()`, and Flutter re-runs your `build()` method to produce a fresh widget tree with the new number displayed.

This feels strange coming from JavaScript (where you'd do `element.textContent = newValue`), but it's the foundation of how all Flutter state management works — from `setState()` all the way up to Provider and beyond. Get this model in your head now and the rest of the course builds on it cleanly.

---

## Before You Come to Class

- **[setState Basics](../reference/state-management/setstate-basics.md)** — the syntax and the lifecycle; read this first
- **[Declarative UI Architecture](../reference/state-management/declarative-ui-architecture.md)** — the "why" behind Flutter's approach; important for understanding later topics
- **[Button Types](../reference/widgets/button-types.md)** — `ElevatedButton`, `TextButton`, `IconButton`; you'll wire these up to `setState()`
- **[InkWell & GestureDetector](../reference/widgets/inkwell-gesturedetector.md)** — for making any widget respond to taps

---

## Check Yourself

1. What's the difference between a `StatelessWidget` and a `StatefulWidget`? When do you need the second?
2. Why does `setState()` take a callback function as its argument? What goes inside that callback?
3. If you forget to call `setState()` but update a variable, what happens? What do you see on screen?
4. In Flutter's declarative model, the UI is described as a function of what?
5. `ElevatedButton` and `TextButton` both show a tappable button — when would you use one over the other?

---

## What's Coming in Weeks 4–6

Week 4 also covers images and `AppBar` customization — you'll use `setState()` to swap images in and out. Week 5 introduces `Stack` (overlapping widgets) and `ScaffoldMessenger` (snack bars and banners). Week 6 is forms: `DropdownButton`, `TextField`, and `TextEditingController` — which is where managing state becomes nontrivial. The groundwork you lay in Week 4 carries all of it.

---

*IGME-340 — Study Guide 3 of 6*
