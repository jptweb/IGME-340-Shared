# Dart Exercise 1 - Variables, Types, and Null

**Time:** about 20 minutes for the core tasks
**Where:** [DartPad](https://dartpad.dev), no install needed
**Covered in:** [Week 1A](../weekly/1A.md) and [Week 1B](../weekly/1B.md)

> **Read first:** [Study Guide 01: Dart Fundamentals](../study-guides/01-dart-fundamentals.md), sections II and III. That's where the explanations live. This page is just the tasks.

---

## How these exercises work

Every Dart exercise has two parts.

> **Graded.** The **Core** sections of all six exercises are submitted **together as one bundle**. Graded on completion: did you do it, and does it run. **Check MyCourses for the due date.** **Stretch** is optional and never graded.

Read [Study Guide 01](../study-guides/01-dart-fundamentals.md) first. It has the explanations; these are the reps.

**Label your work** with `// Task 1`, `// Task 2` comments above each answer. It takes five seconds, it's how I find things when grading, and it means you get feedback faster.

---

## Setup

In DartPad, create a **New Pad** and replace everything with:

```dart
void main() {
  // your code goes here
}
```

Add code as you work through the tasks. Keep everything in one file. You'll submit the whole thing at the end.

---

# Core

## 1. The four basic types

> Guide: [Types and Variables](../study-guides/01-dart-fundamentals.md#ii-types-and-variables)

Dart is typed. You say what a variable holds.

```dart
int lives = 3;
double health = 87.5;
String player = 'Mario';
bool isAlive = true;
```

There are only two number types: `int` and `double`. No `float`, no `long`.

**Task:** declare those four variables with your own values and print each one.

---

## 2. String interpolation

> Guide: [String Interpolation](../study-guides/01-dart-fundamentals.md#string-interpolation)

Use `$` for a plain variable, `${}` when you need an expression.

```dart
print('$player has $lives lives');
print('Half health: ${health / 2}');
```

**Tasks:**

1. Print a sentence using `$` that includes both `player` and `lives`.
2. Print `health` divided by 2, using `${}`.
3. Print `player` in all uppercase. You'll need `.toUpperCase()` inside `${}`.

**Why it matters:** every piece of text your Flutter apps display gets built this way.

---

## 3. `var` locks its type

> Guide: [var, final, and const](../study-guides/01-dart-fundamentals.md#var-final-and-const)

`var` lets Dart figure out the type, but only once.

```dart
var score = 100;
score = 250;        // fine, still an int
```

**Tasks:**

1. Create a `var` holding a number, change it to a different number, and print it.
2. Now try assigning a String to it. **Leave the error in place long enough to read it**, then delete that line.

**Why it matters:** this catches a whole category of bug that JavaScript would let you ship.

---

## 4. `const` and `final`

> Guide: [var, final, and const](../study-guides/01-dart-fundamentals.md#var-final-and-const)

Both mean "can't be reassigned." The difference is when the value is locked in.

```dart
const maxHealth = 100;              // known before the app runs
final startedAt = DateTime.now();   // set once while running, then locked
```

**Tasks:**

1. Create a `const` and print it.
2. Try to reassign it. Read the error, then delete the line.
3. Create a `final` holding `DateTime.now()` and print it.
4. Try `const startedAt = DateTime.now();` instead. Read that error too, then delete it.

**Why it matters:** Flutter skips rebuilding widgets marked `const`, so you'll see the editor suggest it constantly.

---

## 5. Null

> Guide: [Null Safety](../study-guides/01-dart-fundamentals.md#null-safety)

By default nothing in Dart can be null. Adding `?` opts a variable in.

The most realistic way to meet null is looking up a key that isn't there:

```dart
Map<String, String> profile = {'name': 'Mario'};

String? nickname = profile['nickname'];   // that key doesn't exist
print(nickname);                          // null
```

Three operators handle it:

```dart
print(nickname?.length);              // null instead of crashing
print(nickname?.length ?? 0);         // 0, because ?? supplies a fallback
print(profile['name']?.toUpperCase() ?? 'UNKNOWN');   // MARIO
```

**Tasks:**

1. Create a `Map<String, String>` with at least two real keys.
2. Look up a key that **doesn't** exist, store it in a `String?`, and print it.
3. Print its `.length` using `?.` and observe you get `null` rather than a crash.
4. Print it again with `?? 0` so you get a number instead.
5. Look up a key that **does** exist, uppercase it with `?.`, and give it a `?? 'UNKNOWN'` fallback.

**Why it matters:** this is exactly how you'll meet null in Project 2. Web APIs leave fields out, and your app has to survive it.

---

## Submitting

Copy your code out of DartPad and save it as a `.dart` file. All six get submitted together as one bundle, so hang onto this until you've done the rest. Due date is in MyCourses.

DartPad has no save button, so the copy-paste step is the only way out.

- [ ] Every Core task has code that runs
- [ ] The deliberate-error lines are deleted, so your file runs cleanly
- [ ] Named `dart_ice_01.dart`

---

# Stretch (optional, never graded)

Only if you want to.

## S1. Loops

Straight transfer from any C-style language, which is why it's optional.

1. A `for` loop printing 0 to 20.
2. The same thing with a `while` loop.
3. Modify both to `break` at 10.
4. A `for-in` loop over a list of names.

```dart
final party = ['Mario', 'Luigi', 'Peach'];
for (final member in party) {
  print(member);
}
```

`for-in` is the one you'll actually use in Flutter.

## S2. `dynamic`, and why it's a trap

`dynamic` turns type checking off for that variable.

```dart
dynamic anything = 1234;
anything = 'now I am a String';
```

Try it. Then consider that you've given up every protection from task 3.

Modern Dart style says avoid `dynamic` unless you genuinely can't know the type. You'll occasionally need it for messy JSON in Project 2, and that's about it.

## S3. Formatting numbers

1. Print `health` rounded up, and rounded down. Look up `ceil()` and `floor()`.
2. Print `health` to exactly one decimal place. Look up `toStringAsFixed()`.
3. Print the absolute value of `-999`.

## S4. Dates

Print how many seconds have passed since January 1, 1970, using the `DateTime` library.

---

## Resources

- [Dart Language Tour: Variables](https://dart.dev/language/variables)
- [Understanding Null Safety](https://dart.dev/null-safety/understanding-null-safety)
- [Dart Built-in Types](https://dart.dev/language/built-in-types)

---

| <-- Previous | Exercises | Next -->
| --- | --- | ---
|   | [**All Exercises**](../exercises/) | [**Dart 2: Lists**](dart-02-Lists.md)
