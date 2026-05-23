# Phase 0 — Dart Fundamentals

**Read before:** Week 1A (ideally before the semester starts)

---

## What Is Dart, and Why Should You Care

Dart is the programming language Flutter is built on. You're going to write a lot of it this semester. The good news: if you've taken IGME-235, you already know JavaScript, and the two languages share enough DNA that Dart will feel familiar within a few hours. The rough edges are mostly in the type system — Dart is stricter than JS, which means more red squiggles early on but fewer mysterious bugs later.

This guide covers what's different between JS and Dart, gets you comfortable with the syntax you'll need for Week 1, and sets you up to attempt the Dart exercises before class. Nothing here requires installing anything — you'll use [DartPad](https://dartpad.dev), Dart's in-browser editor.

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

const PI = 3.14159;   // compile-time constant — value must be known before running
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

Try to answer these before class. If you can't, re-read the relevant section — or bring the question to Week 1A.

1. What's the difference between `final` and `const`? When would you use each?

2. You declare `var x = 42;`. Can you later do `x = "hello"`? Why or why not?

3. How do you declare a growable list of Strings? How do you add one item? How do you insert an item at position 2?

4. Write a function called `describe` that takes a named `String` parameter called `item` and a named `int` parameter called `count` (default: `1`). It should print `"item: N"`. Then call it two ways: once with just `item`, once with both.

5. You have a `Map<String, dynamic>` with a key `"score"` set to `100`. How do you read that value? How do you add a new key `"level"` with value `1`?

6. You have a `Monster` class with `String name` and `int hp` fields. Write the shortest possible constructor for it using Dart's shorthand. Then write a second version using named parameters with default values.

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

**What's due Week 2:**
- **Exercises 1–3** (Variables/Loops, Lists, Maps) — uses the material from Sections II, III above
- **Exercises 4–6** (Functions, Classes, Inheritance) — uses Sections IV, V above
- **Lab 00** (Flutter + VS Code install) — separate from Dart; instructions are in the lab itself

Week 1A in class will walk through all of this live. This guide is the preview so the demo feels like reinforcement, not first exposure.

---

*IGME-340 — Study Guide 1 of 7*

<!-- Video companion: "Dart for JavaScript Developers" — ~20-25 min — script TBD -->
