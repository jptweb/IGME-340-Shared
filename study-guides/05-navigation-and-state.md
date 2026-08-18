# Phase 4 — Navigation and State

**Read before:** Week 9B–10A (Navigator → GoRouter, local state → Provider)

---

## What's Changing

Up to this point, almost everything in your app has happened on one screen. Week 9–10 is where that changes: you'll build apps with multiple screens, move between them, and — most importantly — manage data that needs to be shared across those screens.

Two separate problems get introduced here in quick succession:

1. **Navigation:** how to move between screens (Navigator → named routes → GoRouter)
2. **State management:** how to share data between screens that are far apart in the widget tree

Both problems are solvable, but the tools for each take some getting used to. If you go into Weeks 9–10 cold, you'll be juggling two unfamiliar systems at once. The pre-read here is specifically designed to let you arrive with at least one of them already making sense.

---

## The Key Mental Shifts

**On navigation:**
> Flutter's default `Navigator` uses a stack — you push screens on, you pop them off. Most real apps need more structure than that, which is why GoRouter exists.

The basic `Navigator.push()` pattern gets you started, but breaks down quickly when you need deep links, persistent bottom navigation, or complex routing logic. GoRouter is the production-grade approach and the one you'll use in your projects.

**On state management:**
> `setState()` works great for state that lives in one widget. When multiple widgets — on different screens — need the same data, you need a different approach.

Provider is a package that lets you place shared data in a central location and have any widget in the tree read from it or listen to changes. It requires a new way of thinking about your data — separate from the UI — but once it clicks, it handles a whole category of problems that `setState()` can't.

---

## Before You Come to Class

Start with navigation, then move to state management:

**Navigation:**
- **[Basic Navigation](../reference/navigation/basic-navigation.md)** — `Navigator.push()` and `Navigator.pop()`; the stack model
- **[Named Routes](../reference/navigation/named-routes.md)** — registering named routes in `MaterialApp`
- **[GoRouter](../reference/navigation/gorouter.md)** — the declarative router; this is what you'll use in projects

**State management:**
- **[Provider Pattern](../reference/state-management/provider-pattern.md)** — `ChangeNotifier`, `ChangeNotifierProvider`, `context.watch()` and `context.read()`

**Also covered in Week 9A (before navigation):**
- **[SharedPreferences](../reference/data-persistence/shared-preferences.md)** — storing simple persistent data between app launches

---

## Check Yourself

**Navigation:**
1. In Flutter's Navigator, what does "pushing" a route mean? What does "popping" mean?
2. What's the advantage of using GoRouter over basic `Navigator.push()` calls?
3. How do you pass data to a new screen when navigating to it?

**State management:**
4. Why doesn't `setState()` work well for sharing data between two separate screens?
5. What does a `ChangeNotifier` class do? What is the `notifyListeners()` call for?
6. What's the difference between `context.watch()` and `context.read()`? When would you use each?

---

## What's Coming in Weeks 9–11

Week 9A introduces SharedPreferences (persistent key-value storage) and url_launcher. Week 9B and 10A are the navigation + Provider core. Week 10B goes deeper on `FutureProvider` and JSON models. Week 11A adds tabbed navigation (`TabBar`, `BottomNavigationBar`) — this is where GoRouter and Provider come together in a full app structure. By the end of Week 11A you'll have everything you need to build Project 2.

---

*IGME-340 — Study Guide 5 of 6*
