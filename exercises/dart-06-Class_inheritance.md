# Dart Exercise 6 - Class Inheritance

**Time:** about 20 minutes for the core tasks
**Where:** [DartPad](https://dartpad.dev)
**Covered in:** [Week 1B](../weekly/1B.md)

> **Read first:** [Study Guide 01, Section V: Inheritance](../study-guides/01-dart-fundamentals.md#inheritance). There's a heads-up box there about the confusing error you'll hit in Stretch S1. Read it before you get stuck.

**Why it matters:** every Flutter widget you write starts with `extends StatelessWidget` or `extends StatefulWidget`, and overrides a `build` method. This exercise is that pattern in plain Dart.

> **Graded.** The **Core** sections of the five graded exercises (01, 02, 04, 05, 06) are submitted **together as one bundle**. Graded on completion: did you do it, and does it run. **Check MyCourses for the due date.** **Stretch** is optional and never graded.

Read [Study Guide 01](../study-guides/01-dart-fundamentals.md) first. It has the explanations; these are the reps.

**Label your work** with `// Task 1`, `// Task 2` comments above each answer. It takes five seconds, it's how I find things when grading, and it means you get feedback faster.

---

## Setup

New Pad in DartPad. Classes go **outside** `main()`.

Start from something like your dart-05 class, or use this:

```dart
class Character {
  String name;
  int hp;

  Character({required this.name, this.hp = 100});

  void attack() {
    print('$name attacks!');
  }
}

void main() {
  // your code here
}
```

---

# Core

## 1. Extend a class

```dart
class Mage extends Character {
  int mana;

  Mage({required super.name, super.hp, this.mana = 50});
}
```

`super.name` and `super.hp` pass those values up to the parent constructor. `this.mana` is the child's own field.

**Tasks:**

1. Write a child class that extends your parent and adds at least one new field.
2. Create an instance of the child and print both an inherited field and the new one.

---

## 2. Override a method

```dart
@override
void attack() {
  print('$name casts a spell!');
}
```

Same method name, different behavior. `@override` tells Dart you meant to do this.

**Tasks:**

1. Override a method from the parent in your child class.
2. Call it on a child instance and confirm you get the child's version.
3. Call the same method on a **parent** instance and confirm you get the parent's version.

---

## 3. Call the parent with `super`

Sometimes you want the parent's behavior **and** something extra:

```dart
void rest() {
  super.attack();       // run the parent's version
  print('...then rests.');
}
```

**Task:** write a method in the child that calls `super.someMethod()` and then does something additional.

**Why it matters:** in Flutter you'll write `super.initState()` inside your own `initState`, for exactly this reason. Forgetting it is a common bug.

---

## 4. `runtimeType`

```dart
print(mage.runtimeType);   // Mage
```

**Task:** create one parent instance and one child instance, and print the `runtimeType` of each.

---

## Submitting

Copy your code out of DartPad and save it as a `.dart` file. All five get submitted together as one bundle, so hang onto this until you've done the rest. Due date is in MyCourses.

- [ ] Every Core task has code that runs
- [ ] File runs without errors
- [ ] Named `dart_ice_06.dart`

---

# Stretch (optional, never graded)

## S1. Add a field to the parent

This is the one that trips people up, and the study guide warns about it specifically.

Add a **new required field** to your parent class. Watch what breaks.

You'll get an error pointing at the **child's constructor**, complaining about the superclass constructor rather than the field you just added. The message is confusing the first time.

**The fix:** the child's constructor also has to pass the new field up, using `super.newField`.

Steps:
1. Add the field to the parent's declaration
2. Add it to the parent's constructor
3. Update the child's constructor to pass it with `super.`

Miss step 3 and nothing compiles.

## S2. Abstract classes

A class you can't instantiate, only extend. It defines what children must provide.

```dart
abstract class Describable {
  String describe();
}

class Item implements Describable {
  final String label;
  Item(this.label);

  @override
  String describe() => 'An item called $label';
}
```

Try instantiating `Describable` directly and read the error.

`extends` inherits behavior. `implements` only requires you to match the shape, and you write everything yourself.

## S3. `toString` down the chain

Give the parent a `toString` that uses `runtimeType`:

```dart
@override
String toString() => '$runtimeType($name, $hp)';
```

Now print both a parent and a child instance. The child gets a sensible label without you writing a second `toString`.

---

## Resources

- [Study Guide 01: Inheritance](../study-guides/01-dart-fundamentals.md#inheritance)
- [Dart: Extending a class](https://dart.dev/language/extend)
- [Dart: Class modifiers](https://dart.dev/language/class-modifiers)

---

| <-- Previous | Exercises | Next -->
| --- | --- | ---
| [**Dart 5: Classes**](dart-05-Classes.md) | [**All Exercises**](README.md) | [**Dart 7: Async**](dart-07-Async.md)
