# Phase 0 — Dart Fundamentals

**Read before:** Week 1A (ideally before the semester starts)

---

## What Is Dart, and Why Should You Care

Dart is the programming language Flutter is built on. You're going to write a lot of it this semester. The good news: if you've taken IGME-235, you already know JavaScript, and the two languages share enough DNA that Dart will feel familiar within a few hours. The rough edges are mostly in the type system — Dart is stricter than JS, which means more red squiggles early on but fewer mysterious bugs later.

This guide covers what's different between JS and Dart, gets you comfortable with the syntax you'll need for Week 1, and sets you up to attempt the Dart exercises before class. Nothing here requires installing anything — you'll use [DartPad](https://dartpad.dev), Dart's in-browser editor.

[Watch: Dart Fundamentals Overview](https://www.youtube.com/watch?v=yBSVWE4WC0I)

---

## I. JavaScript → Dart at a Glance

| JavaScript | Dart | Notes |
|---|---|---|
| `let x = 5` | `var x = 5` | Dart's `var` locks the type once set |
| `const x = 5` | `final x = 5` | `final` = set once at runtime |
| *(no equivalent)* | `const x = 5` | `const` = known at compile time |
| `` `Hello ${name}` `` | `"Hello $name"` | Dart uses `$` not `${}` for simple vars |
| `` `${obj.method()}` `` | `"${obj.method()}"` | `${}` for expressions |
| `let arr = []` | `List<String> items = []` | Typed — String list only |
| `let obj = {}` | `Map<String, dynamic> m = {}` | Typed keys/values |
| `function foo(a, b) {}` | `void foo(String a, int b) {}` | Return type comes first |
| `() => value` | `() => value` | Arrow syntax is identical |
| `foo({a, b})` destructuring | `foo({required String a, int b = 0})` | Named params — big in Flutter |
| `null` / `undefined` | `null` only — and only if you declare `String?` | Dart has no `undefined` |

---

## II. Types and Variables

Dart is **statically typed** — the compiler knows what type every variable is before the program runs. This catches a whole category of bugs that JS silently allows.

### The Basic Types

```dart
int score = 100;         // whole numbers only — no int 3.14
double price = 9.99;     // decimal numbers
String name = "JP";      // capital S, always
bool isReady = true;
```

No `Number` supertype like in JS. `int` and `double` are separate, and the compiler enforces it.

### var, final, and const

```dart
var x = 42;           // Dart infers int — and x stays an int forever
x = 100;              // ✅ fine
x = "hello";          // ❌ error — var locked to int on first assignment

final y = "hello";    // set once, cannot be reassigned
// y = "world";       // ❌ error

const pi = 3.14159;   // compile-time constant — value must be known before running
```

**The practical difference between `final` and `const`:**
- `final` is for values you calculate at runtime: `final now = DateTime.now();`
- `const` is for literal values that never change and are the same every time: `const appName = "GifFinder";`

When in doubt, use `final`. You'll see `const` a lot in Flutter for widget constructors.

### Null Safety

Dart won't let a variable be `null` unless you explicitly say it can be:

```dart
String name = "JP";    // cannot be null — the compiler guarantees it
String? nickname;      // can be null — the ? says so

print(name.length);    // ✅ safe
print(nickname!.length); // ⚠️ forces it — crashes if actually null
print(nickname?.length);  // ✅ safe — returns null instead of crashing
```

If you see a red squiggle saying something "can't be null," the fix is usually adding `?` to the type declaration. You'll also see `late` occasionally — it means "I promise this will be set before use," which lets you declare without immediately assigning.

### String Interpolation

Stop using `+` to build strings. Dart's interpolation is cleaner:

```dart
String player = "Mario";
int score = 9500;

print("Player: $player");             // Player: Mario
print("Score: ${score * 2}");        // Score: 19000 — use {} for expressions
print("Length: ${player.length}");   // Length: 5 — use {} for method calls
```

---

## III. Collections

### Lists

A `List` in Dart is what you'd call an array in JS. The main difference: you declare what type of things go in it.

```dart
// Growable typed list — what you'll use most
List<String> names = [];
names.add("Alice");
names.add("Bob");
print(names.length);     // 2
print(names[0]);         // Alice

// Fixed-length list — less common, but the exercises test it
List<int> scores = List.filled(5, 0);  // [0, 0, 0, 0, 0]
```

**Common list methods (JS equivalents in parentheses):**

| Dart | JS equivalent |
|---|---|
| `list.add(item)` | `arr.push(item)` |
| `list.insert(2, item)` | `arr.splice(2, 0, item)` |
| `list.removeAt(2)` | `arr.splice(2, 1)` |
| `list.removeRange(2, 5)` | `arr.splice(2, 3)` |
| `list.length` | `arr.length` |
| `list.addAll(otherList)` | `arr.push(...otherArr)` |

**Looping:**
```dart
for (String name in names) {
  print(name);
}
// or
names.forEach((name) => print(name));
```

### Maps

A `Map` in Dart is what you'd call an object or dictionary in JS. Keys and values are typed.

```dart
Map<String, dynamic> player = {
  "name": "Mario",
  "score": 9500,
  "lives": 3,
};

print(player["name"]);       // Mario  (bracket notation, not dot notation)
player["score"] = 10000;     // update a value
player["level"] = 1;         // add a new key
player.remove("lives");      // remove a key

print(player.keys);          // (name, score, level)
print(player.values);        // (Mario, 10000, 1)
```

> 🎯 **Pattern to know:** `List<Map<String, dynamic>>` — a list of maps. This is exactly what comes back from an API call. The dart-03 exercise builds toward this. Get comfortable with it now and the async/API weeks will feel natural.

```dart
List<Map<String, dynamic>> players = [
  {"name": "Mario", "score": 9500},
  {"name": "Luigi", "score": 4200},
];
print(players[1]["name"]);  // Luigi
```

---

## IV. Functions

Functions in Dart look like JS but with explicit types:

```dart
// Basic function
int add(int a, int b) {
  return a + b;
}

// Arrow shorthand — same as JS
int double(int n) => n * 2;

// Void — no return value
void greet(String name) {
  print("Hello, $name");
}
```

### Named Parameters — Read This Carefully

This is the single most important Dart concept for Flutter. Every widget you write this semester uses named parameters.

In JS you use destructuring for named args. In Dart, named parameters use curly braces in the function signature:

```dart
void createPlayer({required String name, int lives = 3, double speed = 1.0}) {
  print("$name — lives: $lives, speed: $speed");
}

// Call site — arguments can go in any order
createPlayer(name: "Mario");                       // uses defaults for lives and speed
createPlayer(name: "Luigi", lives: 5);            // override just lives
createPlayer(speed: 2.0, name: "Wario", lives: 1); // any order
```

**`required` vs optional with defaults:**
- `required String name` — must be provided, no default. Compiler error if omitted.
- `int lives = 3` — optional, uses the default if not passed.
- `String? nickname` — optional, is `null` if not passed.

When you write `Container(color: Colors.blue, width: 200, child: Text("hi"))` in Flutter next week, that's exactly this pattern — `Container` takes named parameters, most optional.

---

## V. Classes

Dart classes will feel familiar if you've done any OOP. The main thing that's different is how constructors work.

### Basic Class

```dart
class Monster {
  String name = "";
  int hp = 0;
  int score = 0;

  void status() {
    print("$name — HP: $hp, Score: $score");
  }
}

// Create an instance
Monster goomba = Monster();
goomba.name = "Goomba";
goomba.hp = 10;
goomba.status();  // Goomba — HP: 10, Score: 0
```

### Constructor Shorthand

Dart lets you skip the repetitive assignment boilerplate:

```dart
// Long form — what you'd write in Java or C#
class Monster {
  String name;
  int hp;
  Monster(String name, int hp) {
    this.name = name;
    this.hp = hp;
  }
}

// Dart shorthand — same thing in one line
class Monster {
  String name;
  int hp;
  Monster(this.name, this.hp);  // Dart fills in the assignments
}

// Named parameter constructor — the Flutter-style way
class Monster {
  String name;
  int hp;
  Monster({this.name = "", this.hp = 0});
}

// Now you can do:
Monster goomba = Monster(name: "Goomba", hp: 10);
```

### Inheritance

The dart-05 and dart-06 exercises use inheritance. The key syntax:

```dart
class Goomba extends Monster {
  String color;

  Goomba({required this.color, super.name = "Goomba", super.hp = 10});

  @override
  void status() {
    super.status();  // call parent's status first
    print("Color: $color");
  }
}
```

> ⚠️ **dart-06 heads-up — the part that trips people up:**
> 
> When you need to add a new field to a *parent* class (like adding `type` to `Monster`), you have to:
> 1. Add the field to `Monster`'s declaration
> 2. Add it to `Monster`'s constructor
> 3. Update any child class constructors that call `super()` to pass the new field
> 
> If you only do step 1, the compiler will complain that the child constructor doesn't match. The error message is confusing — it says something about the superclass constructor, not the field you just added. This is exactly what Step 1 of dart-06 asks you to do. Read that step slowly.

---

## VI. Check Yourself

**This guide has two graded pieces attached to it.**

- **The sg01 quiz** in MyCourses, due **Fri Aug 28**. Multiple choice, auto-graded, and **you can retake it until you get 100%**. It's a small slice of your grade and it's designed to be passable, not to catch you out. A few questions ask you to paste a snippet into DartPad, run it, and report what printed, so keep a tab open.
- **The [Dart Exercises](../exercises/dart-01.md)**, Core sections, bundled and due **Wed Sep 9**. Hands-on DartPad work, graded on completion.

The division of labor: this guide explains, the quiz checks you understood it, the exercises make you type it.

The list below is **not** the quiz and isn't submitted. It's a readiness check. Work through it first and the quiz is straightforward.

1. What's the difference between `final` and `const`, and when would you reach for each?
   *[var, final, and const](#var-final-and-const)*

2. You write `var x = 42;` then try `x = "hello";`. Dart rejects it. Why? What would you write instead if `x` genuinely needed to hold either type?
   *[var, final, and const](#var-final-and-const)*

3. You look up a key that isn't in a Map. What comes back, and why is the type written `int?` instead of `int`?
   *[Null Safety](#null-safety), [Maps](#maps)*

4. Flutter uses named parameters almost everywhere. Given that `Container` accepts dozens of properties and you usually set three or four, why is that better than positional?
   *[Named Parameters](#named-parameters--read-this-carefully)*

5. You add a new required field to a parent class, and the error appears in the *child's* constructor. Why?
   *[Inheritance](#inheritance)*

Questions 4 and 5 are the two that bite people hardest. If those are the blank ones, you're in normal company. Bring them to Week 1B or Slack.

---

## VII. Getting Started with DartPad

Everything in this guide and in the Dart exercises runs in [DartPad](https://dartpad.dev) — no installation needed. Open it now and paste this to confirm it works:

```dart
void main() {
  String name = "your name here";
  int year = 2026;
  print("Welcome to IGME-340, $name. It's $year.");
}
```

If you see output on the right, you're ready.

**What's coming up:**
- **Lab 00** (Flutter + VS Code install) — **due before Week 2A**, because that's the first hands-on Flutter class. Separate from Dart; instructions are in the lab itself.
- **Exercises 1–3** (Variables/Types/Null, Lists, Maps) — uses Sections II and III above
- **Exercises 4–6** (Functions, Classes, Inheritance) — uses Sections IV and V above

**How this guide relates to class.** We are *not* touring the whole language in class. Week 1A is course setup plus a first taste of Dart, and Week 1B covers only the four pieces Flutter leans on constantly: string interpolation, named and `required` parameters, null safety, and `const` versus `final`.

Everything else in this guide (loops, collections, classes, inheritance) is yours to work through here and in the exercises. It's all fair game on assignments, and you'll use it constantly. This guide is the primary source for it, not a preview of a lecture.

If something here doesn't land, bring it to class or Slack. That's a better use of class time than watching me retype syntax you already know from 235.

---

*IGME-340 — Study Guide 1 of 7*

<!-- Video companion: "Dart for JavaScript Developers" — ~20-25 min — script TBD -->
