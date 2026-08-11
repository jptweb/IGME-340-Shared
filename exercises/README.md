# Dart Exercises

Short exercises that get you writing Dart before we start writing Flutter. Everything runs in [DartPad](https://dartpad.dev) in your browser, so there is nothing to install and you can start these on day one.

Budget about **an hour and a half total** for the Core sections, spread across however many sittings you want.

> **Graded.** The **Core** sections of the five exercises below are submitted **together as one bundle**. Graded on completion: did you do it, and does it run. **Check MyCourses for the due date.** **Stretch** is optional and never graded.

---

## The graded bundle

| # | Exercise | What it covers | Core time | Read first |
|---|---|---|---|---|
| 1 | [Variables, Types, and Null](dart-01.md) | `int` / `double` / `String` / `bool`, string interpolation, `var` vs `final` vs `const`, and null | ~20 min | [Types and Variables](../study-guides/01-dart-fundamentals.md#ii-types-and-variables) |
| 2 | [Lists](dart-02-Lists.md) | `List<T>`, add / insert / remove, looping with `for-in` | ~15 min | [Lists](../study-guides/01-dart-fundamentals.md#lists) |
| 4 | [Functions](dart-04-Functions.md) | Return types, arrow syntax, **named parameters** and `required` | ~20 min | [Functions](../study-guides/01-dart-fundamentals.md#iv-functions) |
| 5 | [Classes and Constructors](dart-05-Classes.md) | Fields, constructor shorthand, methods, getters, `toString` | ~20 min | [Classes](../study-guides/01-dart-fundamentals.md#v-classes) |
| 6 | [Class Inheritance](dart-06-Class_inheritance.md) | `extends`, `@override`, calling `super`, `runtimeType` | ~20 min | [Inheritance](../study-guides/01-dart-fundamentals.md#inheritance) |

Yes, 3 is missing on purpose. See [the Week 7 pair](#dart-03-and-dart-07-the-week-7-pair) below.

**If you only have time to do one properly, make it number 4.** Named parameters are how every single Flutter widget works. `Text('Hello', style: myStyle)` is that pattern, and you will type some version of it a few hundred times this semester.

Numbers 5 and 6 are next in line. Every Flutter file you open starts with `class MyApp extends StatelessWidget` and an `@override`, so those two exercises are the anatomy of code you will be reading in Week 2.

---

## Core and Stretch

Every exercise is split in two.

**Core** is the required path. It is deliberately small: read the short explanation, type the thing, print the result. This is what gets submitted.

**Stretch** is extra material at the bottom of each file. Some of it is stuff you already know from another language (loops, filtering a list), some of it is a preview of something that shows up later in the course. It is never graded and there is no penalty for skipping all of it. It's there because a few of you will want it.

---

## Where the explanations live

These pages are the reps, not the lesson. The explanations are in [Study Guide 01: Dart Fundamentals](../study-guides/01-dart-fundamentals.md), which has a JavaScript-to-Dart comparison table near the top that is worth reading even if you skim the rest.

Each exercise links to the specific section of the guide it draws on. If a task doesn't make sense, that link is the first place to look.

---

## What to hand in

1. Work through the Core sections. Keep each exercise in its own DartPad tab.
2. **Label your work** with `// Task 1`, `// Task 2` comments above each answer. It takes five seconds, it's how I find things when grading, and it means you get feedback faster.
3. Copy your code out of DartPad and save it as a `.dart` file. Five files: `dart_ice_01.dart`, `dart_ice_02.dart`, `dart_ice_04.dart`, `dart_ice_05.dart`, `dart_ice_06.dart`. Keep the numbers matching the exercises, so there is no `03` in the bundle.
4. Attach all five files to the single MyCourses dropbox. If you'd rather zip them, name the zip `lastname_firstname-dart-exercises.zip`.

DartPad has no save button, so copying your code out is the only way to keep it. Do that as you finish each one instead of at the end.

**Before you submit:** delete the deliberate-error lines. A few tasks ask you to write code that doesn't compile so you can read the error message. Those need to come out so your files run.

---

## dart-03 and dart-07: the Week 7 pair

Two files in this folder sit outside the bundle:

| Exercise | Covers | When |
|---|---|---|
| [dart-03: Maps](dart-03-Maps.md) | Key-value pairs, missing keys returning null, `??` fallbacks | Week 7 |
| [dart-07: Async](dart-07-Async.md) | `Future`, `async`, `await` | Week 7 |

**Neither one is part of the graded bundle and you don't need either yet.** They both come back around Week 7, when we start pulling data from web APIs, and they are much easier to learn at that point than now.

The reason is that a Map only becomes interesting once something hands you one. When you fetch JSON from an API, what comes back is a list of maps, and a field the API left out is a missing key that gives you null. Doing Maps in Week 1 means memorizing bracket syntax with nothing to point it at. Doing them in Week 7 means reading real data.

If you want to get ahead, they're right there and nothing stops you.

---

| <-- Previous | Home | Next -->
| --- | --- | ---
| [**Study Guide 01**](../study-guides/01-dart-fundamentals.md) | [**IGME-340 Home**](../) | [**Dart 1: Variables**](dart-01.md)
