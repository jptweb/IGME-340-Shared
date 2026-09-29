# Phase 3 — External Data

**Read before:** Week 7A (HTTP requests and async/await)

---

## What's Changing

Everything before Week 7 has worked with data you wrote yourself: variables in your Dart code, hardcoded lists, whatever the user typed into your widget. Week 7 changes this. Your app will talk to a server, wait for a response, and display data that didn't exist when you compiled the app.

This is the hardest conceptual shift in the whole course. It trips up more students than any other topic, not because the syntax is complicated, but because **asynchronous code requires a different mental model**. If you arrive at 7A without that model, the session will feel like drinking from a firehose. If you arrive with it, the session clicks.

---

## Watch This First

[Watch: External Data](https://www.youtube.com/watch?v=Qm5qyTVgzTM)

This is the main thing for this guide. It's narrated slides built around one picture, ordering a coffee, and that picture carries the whole unit. The notes below cover the same ground if you'd rather read it, and the reference guides at the bottom go deeper than either.

---

## The Key Mental Shift

> Code doesn't always run top to bottom. Some operations take time, and Dart lets you write code that *waits* without freezing the whole app.

When you call `http.get()` to fetch data from an API, Dart doesn't pause everything until the server responds. The app keeps running. At some point in the future, the data arrives and your code picks up where it left off. `Future` is the type that represents "a value that will exist eventually." `async` and `await` are the keywords that let you write asynchronous code that reads like normal, top-to-bottom code.

If you've ever used `fetch` in JavaScript, you've already done this. Same idea, cleaner syntax.

---

## The Short Version

The ideas from the video, in writing.

### The problem is waiting

Up to now you could read your code top to bottom. Line one runs, then line two, then line three. A network request breaks that, because it takes time: maybe a tenth of a second, maybe two whole seconds on bad wifi.

So what should your app do on the line where it asks for data? If it stops and waits, the whole app freezes. Buttons don't respond, animations stop, and it looks crashed. If it skips ahead, the next line tries to use data that hasn't arrived yet. Neither is okay. You need a third option: start the slow thing, let the app keep living, and come back to this exact spot when the answer is ready.

### Ordering coffee

You order a coffee. Making it takes time, so the barista doesn't hand you a coffee. They hand you a numbered receipt, and you go sit down. The shop doesn't freeze while your drink gets made. The line keeps moving and other people keep ordering.

That receipt is not your coffee. You can't drink it. It's a promise that a coffee is on its way, with a way to claim it when it's ready. When your number gets called, you walk back up and the receipt turns into the real thing.

- The **receipt** is a `Future`: a stand-in for a value that hasn't arrived yet.
- The **coffee** is the value.
- **`await`** is the word for claiming it.

### Future

Read `Future<String>` out loud as "a String that will exist eventually." `Future<int>` is a number that's coming. The type in the angle brackets is what you'll eventually get.

The first time you call out to a server, what lands in your hands is not the data. It's a `Future`, the receipt. That catches everyone off guard the first time.

### async and await

`await` goes right before the slow thing. It says: pause here, let the value finish arriving, then hand me the real value and continue. While you await, the rest of the app does not freeze. Other code keeps running. You're just sitting with your receipt until your order is ready.

So `await` turns a `Future<String>` back into a plain `String`.

The catch: any function that uses `await` has to be labeled `async`. That's you telling Dart "heads up, this function does some waiting." Forget the label and the editor gives you a red squiggle. The fix is just adding the word.

```dart
Future<String> getCoffee() async {
  await Future.delayed(Duration(seconds: 2)); // pretend this is a slow server
  return 'Your coffee is ready';
}

void main() async {
  var coffee = await getCoffee();
  print(coffee); // Your coffee is ready (after two seconds)
}
```

Your code still reads top to bottom, line by line, even though there's waiting happening. That's the whole trick.

### The bug everybody hits

You call the function that gets your data, you go to use it, and instead of your data you get this:

```
Instance of 'Future<String>'
```

You forgot `await`. You grabbed the receipt and tried to drink it. The data was on its way and everything was fine. You just never waited to claim it.

```dart
// Prints: Instance of 'Future<String>'. You're holding the receipt.
var coffee = getCoffee();

// Prints: Your coffee is ready. You waited for it.
var coffee = await getCoffee();
```

Bank this now. When you see `Instance of Future` where you expected real data, you're missing an `await`.

### The data comes back as text

When data finally arrives from a server, it isn't a neat Dart object. It's one long string of text in a format called **JSON**. It looks like a Dart map, with curly braces, keys, and values, but it's still just text until you decode it into real Dart data. One function call does that, and we'll do it hands-on in class.

The shape to remember: data arrives as text, you decode it, then you use it.

---

## Go Deeper

Not needed for the quiz. Worth reading before class, and again when you're stuck on the lab. In order:

1. **[Async/Await Fundamentals](../reference/network/async-await-fundamentals.md)**: start here, since the other two build on it
2. **[HTTP & API Integration](../reference/network/http-api-integration.md)**: making requests, handling responses, parsing JSON
3. **[ListView Basics](../reference/widgets/listview-basics.md)**: you'll display the fetched data in a list

Also useful when you get to Week 7B:

- **[GridView Basics](../reference/widgets/gridview-basics.md)**: for the GifFinder lab, results display in a grid

---

## Check Yourself

1. What is a `Future<String>` in Dart? What does that type tell you about the value?
2. What does `await` actually do when placed before a function call? What happens to the rest of the app while it waits?
3. Why does a function that uses `await` need to be marked `async`?
4. You print your data and see `Instance of 'Future<String>'`. What went wrong, and how do you fix it?
5. JSON comes back from the server as a `String`. What do you need to do to it before you can access individual fields?

---

## About GifFinder (Lab 04)

Weeks 7–8 are when the GifFinder lab comes together. Unlike the earlier labs, GifFinder is a multi-step build (API call, result display, search input, grid layout), and the async concepts from this phase are the foundation for all of it. The more fluent you are with `async`/`await` before class, the more you'll get out of the in-class walkthrough and the less you'll be stuck on the fundamentals while trying to write the lab.

---

## What's Coming in Weeks 7–8

Week 7A you'll write your first HTTP request, display the result, and handle what happens when a request fails. Week 7B introduces GridView and the Giphy API, which is where the GifFinder lab kicks off. Week 8 covers responsive layouts and more complex form-to-API connections. By the end of Week 8 you'll have the skills to build most common consumer app data flows.

---

*IGME-340 — Study Guide 4 of 6*
