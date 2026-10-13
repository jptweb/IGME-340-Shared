# Study Guide 05: Navigation and State

**Read before:** Week 9B (moving between screens) and 10A (GoRouter and Provider)

---

## What's Changing

Up to this point, almost everything you've built lives on one screen. Weeks 9 and 10 are where that changes. You'll build apps with several screens, move between them, and deal with data that more than one screen needs.

That's two separate problems, and they land in class back to back:

1. **Navigation:** how to move between screens
2. **State management:** how to share data between screens that are far apart

If you go into Week 9B cold, you'll be juggling two unfamiliar systems at once. The goal here is to arrive with at least one of them already making sense.

---

## Watch This First

[Watch: Navigation and State](https://www.youtube.com/watch?v=vAlPJ1ormMU)

About 7 minutes, and it's the main thing for this guide. Narrated slides, no code: navigation first, then sharing data. The notes below cover the same ground if you'd rather read it, and the reference guides at the bottom go deeper than either.

---

## The Key Mental Shifts

**On navigation:**
> Screens are a stack. You push a new screen on top to go forward, and pop it off to go back.

**On state management:**
> `setState()` is state for one widget. When two screens need the same data, it can't keep them in sync, and that's what Provider is for.

Both of these have direct parallels in React and other web frameworks, so what you learn here carries well beyond Flutter.

---

## The Short Version

The ideas from the video, in writing.

### Screens are a stack

Flutter's basic navigation works like a stack of cards on a table. Going to a new screen **pushes** it onto the top of the pile. It covers everything below it, and it's what the user sees. Hitting the back button **pops** the top card off, and the screen underneath shows again.

The screens underneath don't disappear while you're away. They sit there in order, waiting for you to come back.

In code, that's `Navigator.push()` and `Navigator.pop()`, which we'll write in 9B.

### Why GoRouter exists

Push and pop are the foundation, and they're worth understanding. They get messy once an app gets real, though. Maybe you want a link from outside the app to open a specific screen, or a bottom navigation bar that stays put while the content changes. Or you just want every screen defined in one place instead of push calls scattered across twenty files.

GoRouter handles that. You declare all your routes in one spot and move between them by name. If you've used routing in a web framework, it will feel familiar.

In class we start with the basic stack so you feel why it gets messy, then switch to GoRouter. Push and pop is the concept. GoRouter is what you'll build projects with.

### Passing data to a screen

When you open a new screen, you usually need to hand it something. Tap a product, and the detail screen needs to know which product. So you pass that data along as you navigate, and the new screen builds itself around it. Going to a screen and giving it its data happen in the same step. The exact syntax is a class detail.

### Where setState hits a wall

Picture a small game: a home screen showing your coin total, and a separate store screen where you spend coins. You go to the store, buy something, and head back home. The home screen still shows the old number.

The data was right the whole time. You really did spend the coins. But the home screen was built earlier, with the old total, and nothing told it to rebuild.

`setState()` only rebuilds the widget it lives in. The store screen knew about the change. The home screen, a separate screen, had no idea. When the same data has to show up in more than one place, you need it to live somewhere every screen can see, with a way to announce "this changed."

### Provider: one shared source of truth

The fix is to stop letting each screen keep its own copy of the data. You put the shared data in one central place that sits above all your screens. Any screen can read from it, and any screen can listen to it. That central place is what the **Provider** package gives you.

When the data changes there, every screen that's listening rebuilds itself with the new value. No more stale home screen.

`setState()` was state for one widget. Provider is state for the whole app. Same goal (update the screen when the data changes), just at a scale `setState()` can't reach.

### Two words to recognize

You don't need to write any of this yet. Just recognize the words when they show up in class.

The shared data lives in a class that uses `ChangeNotifier`. When the data changes, the class calls `notifyListeners()`, and everything listening reacts. Think of it as `setState()` for the shared box.

```dart
class CoinBox with ChangeNotifier {
  int coins = 10;

  void spend(int amount) {
    coins -= amount;
    notifyListeners(); // tell every listening screen to rebuild
  }
}
```

When a widget connects to that box, it does one of two things:

- **`context.watch()`** means "rebuild me whenever this changes."
- **`context.read()`** means "give me the current value, but don't rebuild me."

---

## Go Deeper

Not needed for the quiz. Worth a look before class, and again when you're building. In order:

1. **[Basic Navigation](../reference/navigation/basic-navigation.md)**: `Navigator.push()` and `Navigator.pop()`, the stack model
2. **[Named Routes](../reference/navigation/named-routes.md)**: the second half of 9B
3. **[Data Passing](../reference/navigation/data-passing.md)**: sending data to a screen, and getting data back when it closes
4. **[GoRouter](../reference/navigation/gorouter.md)**: the router you'll use in projects
5. **[Provider Pattern](../reference/state-management/provider-pattern.md)**: `ChangeNotifier`, `ChangeNotifierProvider`, `context.watch()` and `context.read()`

---

## Check Yourself

1. What does it mean to push a screen? To pop one? What happens to the screens underneath while you're away?
2. Push and pop already work. Why does GoRouter exist?
3. You buy something on the store screen, go back, and the home screen still shows your old coin total, even though the data is correct. Why is the screen wrong?
4. How does Provider fix that? What is `notifyListeners()` for?
5. What's the difference between `context.watch()` and `context.read()`?

---

## What's Coming in Weeks 9–11

Week 9A comes first and is its own topic: [SharedPreferences](../reference/data-persistence/shared-preferences.md) for saving small bits of data between app launches (Project 2 uses it to remember the last search), plus url_launcher. 9B is the navigation half, built around a small clicker game: push and pop, named routes, and passing data. You'll hit the stale-total bug for real at the end of that class. 10A moves the same game to GoRouter and fixes the bug with Provider. 10B builds a Provider app from scratch. 11A adds tabs and a bottom navigation bar.

---

*IGME-340 — Study Guide 5 of 6*
