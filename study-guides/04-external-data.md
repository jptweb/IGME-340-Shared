# Phase 3 — External Data

**Read before:** Week 7A (HTTP requests and async/await)

---

## What's Changing

Everything before Week 7 has worked with data you wrote yourself — variables in your Dart code, hardcoded lists, user input stored in your widget. Week 7 changes this: your app will talk to a server, wait for a response, and display data that didn't exist when you compiled the app.

This is the hardest conceptual shift in the whole course. It trips up more students than any other topic, not because the syntax is complicated, but because **asynchronous code requires a different mental model**. If you arrive at 7A without that model, the session will feel like drinking from a firehose. If you arrive with it, the session clicks.

---

## The Key Mental Shift

> Code doesn't always run top to bottom. Some operations take time, and Dart lets you write code that *waits* without freezing the whole app.

When you call `http.get()` to fetch data from an API, Dart doesn't pause everything until the server responds — the app keeps running. At some point in the future, the data arrives and your code picks up where it left off. `Future` is the type that represents "a value that will exist eventually." `async` and `await` are the keywords that let you write asynchronous code that reads like synchronous code.

The other thing that changes in Week 7: your data comes back as raw JSON — a string of text formatted as a dictionary. You'll need to parse that into Dart objects before you can use it. This is the first time in the course where you're bridging from the network to your widget tree, and that bridge has multiple steps.

---

## Before You Come to Class

These three guides are the core reading for this phase. Read them in order:

1. **[Async/Await Fundamentals](../reference/network/async-await-fundamentals.md)** — read this first; the rest won't make sense without it
2. **[HTTP & API Integration](../reference/network/http-api-integration.md)** — making requests, handling responses, parsing JSON
3. **[ListView Basics](../reference/widgets/listview-basics.md)** — you'll display the fetched data in a list

Also useful when you get to Week 7B:
- **[GridView Basics](../reference/widgets/gridview-basics.md)** — for the GifFinder lab, results display in a grid

---

## Check Yourself

1. What is a `Future<String>` in Dart? What does that type tell you about the value?
2. What does `await` actually do when placed before a function call?
3. Why does a function that uses `await` need to be marked `async`?
4. If a network request fails, how do you prevent your app from crashing?
5. JSON comes back from the API as a `String`. What do you need to do to it before you can access individual fields?
6. `FutureBuilder` is a widget that handles async data in the UI — what does it show while the data is loading?

---

## About GifFinder (Lab 04)

Weeks 7–8 are when the GifFinder lab comes together. Unlike the earlier labs, GifFinder is a multi-step build — API call, result display, search input, grid layout — and the async concepts from this phase are the foundation for all of it. The more fluent you are with `async`/`await` and `http.get()` before class, the more you'll get out of the in-class walkthrough and the less you'll be stuck on the fundamentals while trying to write the lab.

---

## What's Coming in Weeks 7–8

Week 7A you'll write your first HTTP request and display the result. Week 7B introduces GridView and the Giphy API — that's the GifFinder lab kicking off. Week 8 covers responsive layouts and more complex form-to-API connections. By the end of Week 8 you'll have the skills to build most common consumer app data flows.

---

*IGME-340 — Study Guide 4 of 7*
