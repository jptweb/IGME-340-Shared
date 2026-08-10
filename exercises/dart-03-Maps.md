# Dart Exercise 3 - Maps

**Time:** about 15 minutes for the core tasks
**Where:** [DartPad](https://dartpad.dev)
**Covered in:** [Week 1B](../weekly/1B.md)

> **Read first:** [Study Guide 01, Section III: Maps](../study-guides/01-dart-fundamentals.md#maps). Pay attention to the `List<Map<String, dynamic>>` callout near the end, because that shape is exactly what a web API hands you in Project 2.

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

## 1. Make a map

A Map is key-value pairs. If you know JavaScript objects or Python dictionaries, you already know this.

```dart
Map<String, int> stats = {'hp': 100, 'attack': 50};
```

`Map<String, int>` means string keys, integer values.

**Tasks:**

1. Create a `Map<String, int>` with at least two entries, and print it.
2. Print one value by its key. Note it's **bracket notation**, not dot notation.

---

## 2. Add and update

```dart
stats['defense'] = 25;   // new key
stats['hp'] = 120;       // existing key, gets overwritten
```

Same syntax for both. Whether it adds or updates depends on whether the key already exists.

**Tasks:**

1. Add a new key and print the map.
2. Change an existing value and print the map.

---

## 3. Remove and inspect

```dart
stats.remove('attack');
print(stats.length);
print(stats.containsKey('hp'));
```

**Tasks:**

1. Remove one key and print the result.
2. Print how many entries are left.
3. Print whether a specific key exists.

---

## 4. Missing keys give you null

This is the important one.

```dart
int? missing = stats['speed'];   // that key isn't there
print(missing);                   // null
print(stats['speed'] ?? 0);       // 0
```

Looking up a key that doesn't exist doesn't crash. It returns `null`. Which is why the type is `int?` and not `int`.

**Tasks:**

1. Look up a key that doesn't exist, store it in a nullable variable, and print it.
2. Print the same lookup with `?? 0` so you get a number instead of null.

**Why it matters:** this is the single most common source of null in Project 2. APIs leave fields out, and a missing field is a missing key.

---

## 5. Loop through it

```dart
stats.forEach((key, value) => print('$key: $value'));

for (final key in stats.keys) {
  print(key);
}
```

**Task:** print every key-value pair, one per line. Either approach is fine.

---

## Submitting

Copy your code out of DartPad and save it as a `.dart` file. All six get submitted together as one bundle, so hang onto this until you've done the rest. Due date is in MyCourses.

- [ ] Every Core task has code that runs
- [ ] File runs without errors
- [ ] Named `dart_ice_03.dart`

---

# Stretch (optional, never graded)

## S1. Merging and extracting

```dart
stats.addAll({'luck': 7});
print(stats.values.toList());
print(stats.keys.toList());
```

## S2. The shape an API gives you

This is worth doing if you want Project 2 to feel less sudden.

```dart
List<Map<String, dynamic>> players = [
  {'name': 'Mario', 'score': 9500},
  {'name': 'Luigi', 'score': 4200},
];

print(players[1]['name']);   // Luigi
```

A list of maps. When you fetch JSON from a web API, this is what you get back.

**Try:** loop through that list and print each player's name and score using string interpolation.

Note the `dynamic` here. This is the one place it's genuinely reasonable, because the values really are different types and you don't control the API.

## S3. Nested maps

```dart
Map<String, dynamic> monster = {
  'name': 'Goomba',
  'stats': {'hp': 20, 'attack': 5},
};

print(monster['name']);
print((monster['stats'] as Map)['hp']);
```

That `as Map` cast is Dart making you prove you know what's in there. Nested JSON does this to you constantly.

---

## Resources

- [Study Guide 01: Maps](../study-guides/01-dart-fundamentals.md#maps)
- [Dart Maps](https://dart.dev/language/collections#maps)
- [Map class API](https://api.dart.dev/stable/dart-core/Map-class.html)

---

| <-- Previous | Exercises | Next -->
| --- | --- | ---
| [**Dart 2: Lists**](dart-02-Lists.md) | [**All Exercises**](../exercises/) | [**Dart 4: Functions**](dart-04-Functions.md)
