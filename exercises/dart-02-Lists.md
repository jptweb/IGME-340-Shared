# Dart Exercise 2 - Lists

**Time:** about 15 minutes for the core tasks
**Where:** [DartPad](https://dartpad.dev)
**Covered in:** [Week 1B](../weekly/1B.md)

> **Read first:** [Study Guide 01, Section III: Lists](../study-guides/01-dart-fundamentals.md#lists). It has a table of Dart list methods next to their JavaScript equivalents. This page is just the tasks.

> **Graded.** The **Core** sections of all six exercises are submitted **together as one bundle**. Graded on completion: did you do it, and does it run. **Check MyCourses for the due date.** **Stretch** is optional and never graded.

Read [Study Guide 01](../study-guides/01-dart-fundamentals.md) first. It has the explanations; these are the reps.

**Label your work** with `// Task 1`, `// Task 2` comments above each answer. It takes five seconds, it's how I find things when grading, and it means you get feedback faster.

---

## Setup

New Pad in DartPad:

```dart
void main() {
  // your code goes here
}
```

---

# Core

## 1. Make a typed list

```dart
List<String> party = ['Mario', 'Luigi'];
```

`List<String>` means only strings go in it. That angle-bracket type is the part that matters.

**Tasks:**

1. Create a `List<String>` with two names in it, and print it.
2. Print the first item using its index.
3. Print how many items are in it.

---

## 2. Add and insert

```dart
party.add('Peach');        // goes on the end
party.insert(1, 'Toad');   // goes at position 1, shifts the rest right
```

**Tasks:**

1. Add one name to the end of your list and print the result.
2. Insert a name at position 1 and print the result.

---

## 3. Remove

Two different removals, and the difference catches people out:

```dart
party.remove('Toad');   // removes by VALUE
party.removeAt(0);      // removes by INDEX
```

**Tasks:**

1. Remove one item **by value** and print the result.
2. Remove one item **by index** and print the result.

---

## 4. Loop through it

```dart
for (final member in party) {
  print(member);
}
```

**Task:** print every item in your list one per line, using a `for-in` loop.

**Why this one matters:** this is the loop you'll actually use in Flutter. The others are mostly for the exercises.

---

## 5. A list of numbers

```dart
List<int> scores = [10, 20, 30];
```

**Tasks:**

1. Create a `List<int>` with at least three numbers.
2. Print its `first` and `last`.
3. Print whether it `isEmpty`.

---

## Why lists matter in Flutter

When a Flutter widget holds several things, it takes a **`List<Widget>`**:

```dart
Column(
  children: [
    Text('One'),
    Text('Two'),
  ],
)
```

Same square brackets, same commas, same `List<T>` you just used. The only difference is what's inside.

---

## Submitting

Copy your code out of DartPad and save it as a `.dart` file. All six get submitted together as one bundle, so hang onto this until you've done the rest. Due date is in MyCourses.

- [ ] Every Core task has code that runs
- [ ] File runs without errors
- [ ] Named `dart_ice_02.dart`

---

# Stretch (optional, never graded)

## S1. Combining lists

```dart
party.addAll(['Yoshi', 'Daisy']);           // append another list
final combined = [...party, ...otherList];  // spread operator, like JS
```

Try both.

## S2. Transforming

```dart
print(scores.reversed.toList());
print(scores.where((s) => s > 15).toList());
```

`where` is Dart's `filter`. Try `map` too, and see what `.toList()` is doing at the end.

## S3. Fixed-length lists

```dart
final fixed = List<int>.filled(5, 0);   // [0, 0, 0, 0, 0]
fixed[2] = 1;
```

You can change items but not add or remove. Try `.add()` on it and read the error.

You'll rarely want this, but it comes up in older code.

---

## Resources

- [Study Guide 01: Lists](../study-guides/01-dart-fundamentals.md#lists)
- [Dart Lists](https://dart.dev/language/collections#lists)
- [List class API](https://api.dart.dev/stable/dart-core/List-class.html)

---

| <-- Previous | Exercises | Next -->
| --- | --- | ---
| [**Dart 1: Variables**](dart-01.md) | [**All Exercises**](README.md) | [**Dart 4: Functions**](dart-04-Functions.md)
