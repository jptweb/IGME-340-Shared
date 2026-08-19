# Phase 1 — Dart to Flutter

**Read before:** Week 2A (your first full Flutter session)

---

## What's Changing

The first week of the course was all Dart — a language that runs anywhere and looks a lot like Java or TypeScript. Starting Week 2, you'll use Dart inside Flutter, which means the code you write isn't just logic anymore: it *is* your user interface.

This is the biggest conceptual shift early in the course. In most languages you build UI by *calling functions* that create visual elements. Flutter works differently: your entire app is a **widget tree**, and you describe what you want by *composing* widgets inside other widgets. The more comfortable you are with this idea before Week 2, the less time you'll spend confused about why things are structured the way they are.

---

## The Key Mental Shift

> Everything in Flutter is a widget.

Not just buttons and text fields — the padding around a button is a widget. The background color of a screen is a widget. The thing that makes your content scrollable is a widget. You build a UI by nesting widgets: each one wraps or contains others, forming a tree.

This is different from web development (where you have HTML elements styled by CSS), different from native Android (where XML layouts describe the view), and different from how most frameworks separate "data" from "presentation." In Flutter, the structure, the style, and the behavior all live in the same widget tree.

---

## See It First: Hello Flutter in VS Code

[Watch: Dart to Flutter](https://www.youtube.com/watch?v=B2JPEkpTm3o)

The video for this guide walks through building a minimal Flutter app from scratch in VS Code. Follow along if you want, or just watch. Either way, the goal is to see the widget tree take shape before class.

**Heads up, this one works differently from the others.** It runs about 24 minutes and it is mostly live coding rather than slides, which makes it the longest of the set and the only one built that way. Study Guide 1 is the better model for the ones that follow: shorter, narrated slides, concept first.

It is a build-along because watching an app come together from an empty file is something a diagram cannot really give you. Having it on video also means you can come back to it later, or catch up if your setup was fighting you during class. It is not a re-recording of a class session.

> **No Flutter install yet? Use DartPad instead.** Lab 00 is not due until Sep 6, so you are not expected to have a working environment for this guide. Go to [DartPad](https://dartpad.dev), click **Create**, and pick the **Flutter snippet** template. Everything below works there in your browser. The video does exactly this for its first few minutes before switching over to VS Code.

### Step 1 — The starting point

Start a new Flutter project (or a DartPad Flutter snippet), open `main.dart`, and replace everything with this:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('My App')),
        body: const Center(
          child: Text('Hello Flutter'),
        ),
      ),
    );
  }
}
```

Hot reload. You've got a screen with an app bar and centered text. Notice the tree: `MaterialApp` → `Scaffold` → `Center` → `Text`. Each widget wraps the next.

### The `const` error you will probably hit

If you started from a fresh `flutter create` project rather than pasting the code above, your `main.dart` almost certainly says `return const MaterialApp(`. The moment you add something that cannot be `const`, which includes the `Container` in Step 2, you get this:

> The constructor being called isn't a const constructor.

`const` is a promise that nothing inside will ever change. A `Container` cannot make that promise, so nothing above it can be `const` either.

**The fix is to delete the `const` in front of `MaterialApp`.** In VS Code you can also put your cursor on the underlined code and press **Cmd+.** on Mac or **Ctrl+.** on Windows, which opens the quick fix menu and offers to remove it for you. That same menu is where "Wrap with Center" and "Wrap with Padding" live, so it is worth learning early.

Why `const` exists at all, and when you want it back, is a Study Guide 3 conversation. For now, deleting it is the right move.

### Step 2 — Swap in a Container

Replace the `body` with a `Container`:

```dart
body: Container(
  color: Colors.blue[100],
  padding: const EdgeInsets.all(24),
  child: const Text('Hello Flutter'),
),
```

Hot reload. The `Container` wraps the `Text` with a background color and spacing on all sides. It only covers what's inside it — watch it grow when you add more content.

### Step 3 — Give it a size and center it

Add `width` and `height`, then wrap the whole thing in a `Center`:

```dart
body: Center(
  child: Container(
    color: Colors.blue[100],
    padding: const EdgeInsets.all(24),
    width: 200,
    height: 200,
    child: const Text('Hello Flutter'),
  ),
),
```

Hot reload. `Center` is itself a widget — it positions its child in the middle of available space.

### Step 4 — Style the text

```dart
child: const Text(
  'Hello Flutter',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ),
),
```

Hot reload. Done. You've got `Center` → `Container` → `Text`, each nested inside the last.

That's the widget tree. `Column` and `Row` — how you arrange multiple widgets — are what you'll build in class.

---

## Before You Come to Class

Read these reference guides. They're short — each one is built to be scanned quickly:

- **[VS Code Flutter Workflow](../reference/setup/vs-code-flutter-workflow.md)** — the keyboard shortcuts and commands you'll use every class
- **[Layout Widgets](../reference/widgets/layout-widgets.md)** — Column, Row, and how Flutter arranges things on screen
- **[Container Basics](../reference/widgets/container-basics.md)** — Flutter's most versatile layout widget; you'll use it constantly

If you're on a lab machine or setting up a new computer, also check:
- **[Flutter on Lab Machines](../reference/setup/flutter-lab-machines.md)**

---

## Check Yourself

Before Week 2A, you should be able to answer these:

1. What does a `Widget` do in Flutter? How is it different from a function call?
2. `Column` and `Row` are both layout widgets — what's the difference in how they arrange their children?
3. What does `Scaffold` give you? What would happen if you tried to build a screen without it?
4. In DartPad, you wrote standalone functions. In a Flutter project, where does the code that builds your UI actually go?
5. What is "hot reload" and why does it matter for how you work in class?

If any of these are unclear after reading the reference guides, bring the question to class — you're not alone.

---

## What's Coming in Weeks 2–3

Week 2 you'll get Flutter running on your machine and build your first real app — `MaterialApp`, `Scaffold`, `Text`, your first hot reload. Week 3 is layouts: you'll put `Container`, `Column`, `Row`, and `SingleChildScrollView` to work and see what happens when content overflows. By the end of Week 3 you'll have the vocabulary to build any static screen.

---

*IGME-340 — Study Guide 2 of 6*
