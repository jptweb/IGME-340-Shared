# Phase 2 — Static to Stateful

**Read before:** Week 4A (setState and interactive widgets)

---

## What's Changing

For the first three weeks you've been building layouts that just sit there. They look right, but nothing happens when you tap anything. Week 4 is when that changes.

Flutter's widget tree is **immutable**. Once a widget is drawn it's frozen, so you can't reach in and edit it. To update the screen you change your data and ask Flutter to build the whole thing again. That's the second big mental shift of the course, and it trips people up if they go in cold.

---

## Watch This First

[Watch: Static to Stateful](https://www.youtube.com/watch?v=_2iWfpRE1lw)

About 12 minutes, and it's the main thing for this guide. Narrated slides for the concept, then a short demo in VS Code where I build a counter, hit the bug on purpose, and fix it with one line. The notes below cover the same ground if you'd rather read it, and the reference guides at the bottom go deeper than either.

---

## The Key Mental Shift

> The UI is a function of your data. You don't change the UI directly. You change the data, then Flutter redraws.

Imagine a counter app. When the user taps "+", you don't reach into the `Text` widget and update its number. You update the counter variable, call `setState()`, and Flutter re-runs your `build()` method to produce a fresh widget tree with the new number in it.

A counter at 5 and a counter at 6 aren't two edits to the same screen. They're two separate screens, built from two different numbers.

This feels strange coming from JavaScript, where you'd grab an element and set its `textContent`. But it's the foundation of how all Flutter state management works, from `setState()` up through Provider later in the semester. Get this model in your head now and the rest of the course builds on it cleanly.

---

## The Short Version

The five ideas from the video, in writing.

### Widgets are frozen

Once a widget is built it's immutable. There's no line of code where you grab a `Text` widget and set it to something new. The widget on screen is a snapshot, and snapshots don't change.

Coming from the web, that's the weird part. In JavaScript you'd find the element, set its text, and you're done. Flutter closes that door. If you can't edit a widget, your only move is to throw it away and build a fresh one. That sounds wasteful. It isn't, and Flutter is very good at it.

### The UI is a function of your data

You give Flutter some data, it runs your `build()` method, and out comes a screen. Change the data, run `build()` again, out comes a new screen.

You're never decorating the screen by hand. You're describing what the screen should look like for a given set of data, then handing Flutter different data.

### Stateless vs Stateful

That model needs somewhere to keep the data, and a way to say "the data changed, redraw."

Everything you've built so far has been a `StatelessWidget`. It takes its inputs, builds a screen, and it's done. It has no memory, and nothing about it changes while the user is looking at it.

A `StatefulWidget` holds data that changes over time and rebuilds itself when it does: a counter's number, whether a box is checked, which image is showing.

Deciding between them comes down to one question:

> Does anything on this screen need to change while the user is looking at it?

No means a `StatelessWidget` is fine, so keep it simple. Yes means you need a `StatefulWidget`. It's a little more boilerplate, and we'll write the exact setup out in class. In VS Code you can type `stfu`, pick the snippet, and it generates the whole thing for you. Practice that one until it's automatic, because you'll do it constantly.

### setState is how you ask for a redraw

`setState()` does two jobs at once. You hand it a small function, and inside that function you change your data: bump the counter, flip the checkbox, swap the image.

The act of calling `setState()` is the signal. It tells Flutter that the data just changed, so run `build()` again and put the new version on screen.

```dart
void increment() {
  setState(() {
    count = count + 1;
  });
}
```

Why does the change have to go inside that function instead of sitting on its own line? Short version: it's how Flutter knows exactly when the data changed, so it can redraw right after. We'll go deeper on that in class.

### The bug everybody hits

You change a variable, you run it, and nothing happens on screen. The number doesn't move, and you're sure your code is right.

Your code probably is right. The variable really did change. Print it and you can watch it climb in the console while the screen sits there at zero. But you forgot to call `setState()`, so Flutter never re-ran `build()`, and the screen is still showing the old snapshot.

```dart
// The screen never updates. count really does go up, but Flutter never hears about it.
void increment() {
  count = count + 1;
}

// One line of difference. Now the screen keeps up.
void increment() {
  setState(() {
    count = count + 1;
  });
}
```

Bank this now. If you change something and the screen won't update, the first thing to check is whether you wrapped it in `setState()`. Nine times out of ten that's the reason.

---

## Go Deeper

Optional. Useful before class, and useful again when you're stuck on a lab:

- **[setState Basics](../reference/state-management/setstate-basics.md)**: the syntax and the lifecycle
- **[Declarative UI Architecture](../reference/state-management/declarative-ui-architecture.md)**: the "why" behind Flutter's approach, and where it leads later in the course
- **[Button Types](../reference/widgets/button-types.md)**: `ElevatedButton`, `TextButton`, `IconButton`, and when to use each
- **[InkWell & GestureDetector](../reference/widgets/inkwell-gesturedetector.md)**: making any widget respond to taps

---

## Check Yourself

1. What's the difference between a `StatelessWidget` and a `StatefulWidget`? When do you need the second one?
2. Why does `setState()` take a function as its argument? What goes inside it?
3. If you update a variable but forget `setState()`, what do you see on screen? What's actually true about the variable?
4. In Flutter's declarative model, the UI is a function of what?
5. `ElevatedButton` and `TextButton` both give you something tappable. When would you use one over the other? The video only uses `ElevatedButton`, so check the [Button Types reference](../reference/widgets/button-types.md) for this one.

---

## What's Coming in Weeks 4–6

Week 4 also covers images and `AppBar` customization, and you'll use `setState()` to swap images in and out. Week 5 introduces `Stack` (overlapping widgets) and `ScaffoldMessenger` (snack bars and banners). Week 6 is forms: `DropdownButton`, `TextField`, and `TextEditingController`, which is where managing state gets genuinely interesting. It's all the same loop: change the data, call `setState()`, rebuild.

---

*IGME-340 — Study Guide 3 of 6*
