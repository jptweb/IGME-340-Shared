# Theme.of(context) Inside ThemeData — A Common Pitfall

## The Problem

`Theme.of(context)` looks **up** the widget tree for the nearest `Theme` ancestor.

Inside `MyApp.build()`, the `context` is **above** `MaterialApp`, so it finds Flutter's default fallback theme — not the one you're currently defining. No crash, but your colors won't match what you expect.

## What NOT to Do

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            // BAD — context is above MaterialApp, reads the default theme
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            // BAD — same issue
            backgroundColor: WidgetStatePropertyAll(
              Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
```

This compiles and runs fine, but the colors come from Flutter's built-in default theme, not your deepPurple seed.

## The Fix

Build your `ColorScheme` first, then reference the variable directly:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lightScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);

    return MaterialApp(
      theme: ThemeData(
        colorScheme: lightScheme,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: lightScheme.onPrimary, // references the variable
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: lightScheme.primary,
            foregroundColor: lightScheme.onPrimary,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
```

## Where Theme.of(context) Works Fine

Anywhere **below** `MaterialApp` in the tree, `context` correctly finds your custom theme:

```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme; // works here

    return Scaffold(
      body: Container(
        color: scheme.primary,
        child: Text("Hello", style: Theme.of(context).textTheme.displayLarge),
      ),
    );
  }
}
```

## Quick Reference

| Where are you? | Theme.of(context) safe? |
|---|---|
| Inside `ThemeData(...)` definition | No — use a variable or hardcoded color |
| Inside widgets below `MaterialApp` | Yes — this is the intended usage |
