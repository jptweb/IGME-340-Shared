# Dart Exercise 5 - Classes and Constructors

**Time:** about 20 minutes for the core tasks
**Where:** [DartPad](https://dartpad.dev)
**Covered in:** [Week 1B](../weekly/1B.md)

> **Read first:** [Study Guide 01, Section V: Classes](../study-guides/01-dart-fundamentals.md#v-classes). The **Constructor Shorthand** part shows the same class written three ways, which is the thing to understand here.

**Why it matters:** every Flutter widget is a class, and every widget you use is a constructor call with named parameters. `Text('Hello')` is a constructor. This exercise is that pattern without the Flutter on top.

> **Graded.** The **Core** sections of all six exercises are submitted **together as one bundle**. Graded on completion: did you do it, and does it run. **Check MyCourses for the due date.** **Stretch** is optional and never graded.

Read [Study Guide 01](../study-guides/01-dart-fundamentals.md) first. It has the explanations; these are the reps.

**Label your work** with `// Task 1`, `// Task 2` comments above each answer. It takes five seconds, it's how I find things when grading, and it means you get feedback faster.

---

## Setup

New Pad in DartPad. Classes go **outside** `main()`:

```dart
// your class goes up here

void main() {
  // create instances and call methods here
}
```

---

# Core

## 1. A class with fields

```dart
class Player {
  String name;
  int hp;

  Player({required this.name, this.hp = 100});
}
```

Two things worth noticing:

- **`this.name` in the constructor is shorthand.** Dart assigns the parameter to the field for you. No `this.name = name;` line needed.
- **The curly braces make them named parameters**, same as last exercise. This is the Flutter-style constructor.

**Tasks:**

1. Write a class with at least two fields, using the shorthand named-parameter constructor.
2. Create an instance and print one of its fields.

Note there's **no `new` keyword** in Dart. Just `Player(name: 'Mario')`.

---

## 2. Defaults and required

In the example above, `name` is required and `hp` defaults to 100.

**Tasks:**

1. Create an instance passing **only** the required field. Print the field that used its default.
2. Create a second instance passing **all** fields.

---

## 3. A method

```dart
void damage(int amount) {
  hp -= amount;
}
```

Methods go inside the class, and can read and change the object's own fields.

**Tasks:**

1. Add a method that changes one of your fields.
2. Call it, then print the field to confirm it changed.

---

## 4. A getter

A getter is a computed value that reads like a field.

```dart
bool get isAlive => hp > 0;
```

Called without parentheses: `player.isAlive`, not `player.isAlive()`.

**Tasks:**

1. Add a getter that returns something computed from your fields.
2. Print it.

---

## 5. `toString`

By default, printing an object gives you something useless like `Instance of 'Player'`.

```dart
@override
String toString() => 'Player($name, hp: $hp)';
```

**Tasks:**

1. Print your object **before** adding `toString`. Note what you get.
2. Add a `toString` override and print it again.

The `@override` annotation tells Dart you're deliberately replacing an inherited method. You'll see it constantly in Flutter, on every `build` method you write.

---

## Submitting

Copy your code out of DartPad and save it as a `.dart` file. All six get submitted together as one bundle, so hang onto this until you've done the rest. Due date is in MyCourses.

- [ ] Every Core task has code that runs
- [ ] File runs without errors
- [ ] Named `dart_ice_05.dart`

---

# Stretch (optional, never graded)

## S1. Named constructors

A class can have more than one constructor if you name the extras:

```dart
class Player {
  String name;
  int hp;
  final String team;

  Player({required this.name, this.hp = 100, this.team = 'red'});

  Player.guest() : name = 'Guest', hp = 50, team = 'none';
}

final g = Player.guest();
```

That `:` before the body is an **initializer list**, which is how you assign `final` fields.

Flutter uses this pattern a lot. `Colors.blue` and `EdgeInsets.all(8)` are related ideas.

## S2. `final` fields

Change one of your fields to `final`. Now it can only be set in the constructor, never after.

Try changing it from a method and read the error.

Most Flutter widgets have **all** their fields `final`, because widgets are immutable. That's worth sitting with for a second.

## S3. A list of objects

```dart
final roster = [
  Player(name: 'Mario'),
  Player(name: 'Luigi', hp: 80),
];

for (final p in roster) {
  print(p);
}
```

A `List<Player>`. Next week you'll write `List<Widget>`, and it's the same idea.

---

## Resources

- [Study Guide 01: Classes](../study-guides/01-dart-fundamentals.md#v-classes)
- [Dart Classes](https://dart.dev/language/classes)
- [Constructors](https://dart.dev/language/constructors)

---

| <-- Previous | Exercises | Next -->
| --- | --- | ---
| [**Dart 4: Functions**](dart-04-Functions.md) | [**All Exercises**](../exercises/) | [**Dart 6: Inheritance**](dart-06-Class_inheritance.md)
