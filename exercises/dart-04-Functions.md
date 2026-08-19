# Dart Exercise 4 - Functions

**Time:** about 20 minutes for the core tasks
**Where:** [DartPad](https://dartpad.dev)
**Covered in:** [Week 1B](../weekly/1B.md)

> **Read first:** [Study Guide 01, Section IV: Functions](../study-guides/01-dart-fundamentals.md#iv-functions), especially **Named Parameters, Read This Carefully**.

**This is the most important exercise in the set.** Named parameters are how every Flutter widget works. If only one of these sticks, make it this one.

> **Graded.** The **Core** sections of the five graded exercises (01, 02, 04, 05, 06) are submitted **together as one bundle**. Graded on completion: did you do it, and does it run. **Check MyCourses for the due date.** **Stretch** is optional and never graded.

Read [Study Guide 01](../study-guides/01-dart-fundamentals.md) first. It has the explanations; these are the reps.

**Label your work** with `// Task 1`, `// Task 2` comments above each answer. It takes five seconds, it's how I find things when grading, and it means you get feedback faster.

---

## Setup

New Pad in DartPad. Functions go **outside** `main()`:

```dart
// your functions go up here

void main() {
  // your calls go here
}
```

---

# Core

## 1. A basic function

Return type comes first, unlike JavaScript.

```dart
int add(int a, int b) {
  return a + b;
}
```

**Tasks:**

1. Write a function that takes two `int` values and returns their sum. Call it from `main` and print the result.
2. Write a `void` function that takes a `String` and prints a greeting. `void` means it returns nothing.

---

## 2. Arrow functions

For one-liners. Identical to JavaScript's arrow syntax.

```dart
int multiply(int a, int b) => a * b;
```

**Task:** rewrite your `add` function as an arrow function called `multiply` that multiplies instead. Call it and print the result.

---

## 3. Named parameters

Curly braces in the signature make parameters **named**.

```dart
void greet({String? name, String? title}) {
  print('Hello, $title $name');
}

greet(name: 'JP', title: 'Prof');
greet(title: 'Dr', name: 'Who');    // order doesn't matter
```

**Tasks:**

1. Write a function with two named parameters and call it.
2. Call it again with the arguments in the **opposite order**. Confirm you get the same result.

---

## 4. `required`

Named parameters are optional by default. `required` makes one mandatory.

```dart
void greet({required String name, String? title}) {
  print('Hello, $title $name');
}
```

Note that `name` lost its `?`. Something required can't also be allowed to be missing.

**Tasks:**

1. Change one of your named parameters to `required`.
2. Try calling the function **without** it. Read the error, then delete that line.
3. Call it correctly.

---

## 5. Default values

An optional named parameter can have a default instead of being null.

```dart
double area({required double w, double h = 1.0}) => w * h;

print(area(w: 3.0));            // 3.0, h defaulted to 1.0
print(area(w: 3.0, h: 2.0));    // 6.0
```

**Tasks:**

1. Write a function with one `required` named parameter and one that has a default value.
2. Call it twice: once relying on the default, once overriding it.

---

## Why this matters

Here's the Flutter you'll write next week:

```dart
Container(
  width: 100,
  height: 200,
  color: Colors.blue,
  child: Text('Hi'),
)
```

Named parameters, some required, most optional with defaults. `Container` accepts dozens of properties and you pass the four you care about, in whatever order you like.

You just built that pattern by hand.

---

## Submitting

Copy your code out of DartPad and save it as a `.dart` file. All five get submitted together as one bundle, so hang onto this until you've done the rest. Due date is in MyCourses.

- [ ] Every Core task has code that runs
- [ ] The deliberate-error line from task 4 is deleted
- [ ] File runs without errors
- [ ] Named `dart_ice_04.dart`

---

# Stretch (optional, never graded)

## S1. Optional positional parameters

Square brackets instead of curly braces:

```dart
String describe(String name, [int level = 1]) => '$name is level $level';

print(describe('Mario'));       // Mario is level 1
print(describe('Luigi', 5));    // Luigi is level 5
```

Positional and optional. You'll see this occasionally, but named parameters are far more common in Flutter.

## S2. Functions as parameters

This one pays off later. Flutter's `onPressed:` takes a function.

```dart
void applyTwice(int start, int Function(int) op) {
  print(op(op(start)));
}

applyTwice(3, (n) => n * 2);   // 12
```

`int Function(int)` is a type: "a function that takes an int and returns an int."

**Try:** call `applyTwice` with a different operation.

When you write a button in Flutter, you're passing a function exactly like this:

```dart
ElevatedButton(
  onPressed: () { print('tapped'); },
  child: Text('Tap me'),
)
```

---

## Resources

- [Study Guide 01: Named Parameters](../study-guides/01-dart-fundamentals.md#named-parameters--read-this-carefully)
- [Dart Functions](https://dart.dev/language/functions)
- [Parameters in Dart](https://dart.dev/language/functions#parameters)

---

| <-- Previous | Exercises | Next -->
| --- | --- | ---
| [**Dart 2: Lists**](dart-02-Lists.md) | [**All Exercises**](README.md) | [**Dart 5: Classes**](dart-05-Classes.md)
