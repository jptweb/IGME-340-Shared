# Commenting Guide

Commenting your code is one of those things that feels like busywork right up until the moment
it saves you. Come back to a project after two weeks and you will not remember why you wrote
what you wrote. Neither will the person grading it, and neither will the teammate who picks it
up after you.

This guide has two halves. The first is the small set of rules you have to follow to get full
credit in this class. The second is what commenting looks like in industry, which goes well
beyond what I am asking of you.

---

## What's Required

Three rules. That's the whole list.

### 1. A header block at the top of every `.dart` file

What the file does, your name, the date.

### 2. One line above every function saying what it does

Plain English. One sentence is fine.

### 3. One line on anything non-obvious saying why

If you had to think about it, or if you would have to think about it again in a month, say why
you did it that way. This is the rule that matters most and the one students skip.

### What that looks like

```dart
///
/// gif_search.dart
/// Handles the GIPHY search screen: text input, the API call, and the results grid.
/// Jane Student
/// 2026-09-15
///

/// Sends the search term to GIPHY and returns the decoded list of results.
Future<List<dynamic>> searchGifs(String term) async {
  // Trimming here because a trailing space returns zero results from the API.
  final query = term.trim();

  final response = await http.get(Uri.parse('$_baseUrl?q=$query&api_key=$_apiKey'));
  return jsonDecode(response.body)['data'];
}

/// Clears the search field and empties the results grid.
void resetSearch() {
  _controller.clear();
  setState(() => _results = []);
}
```

That is a complete, compliant example. Nothing fancy in it. If your code looks like that, you
are fine.

### What doesn't count

- Commenting out old code and leaving it there. Delete it, that's what version control is for.
- Restating the obvious. `// set the color to red` above `color: Colors.red` tells me nothing.
- One comment at the top of a 300 line file and nothing after it.

---

## Where It's Graded

The bar rises as the semester goes on. Early work is about building the habit. By Project 3 I
expect comments that explain your thinking.

| Assignment | What I expect | How it's graded |
|---|---|---|
| Dart exercises | Label your answers with `// Task 1`, `// Task 2` | Not graded on commenting |
| Labs 01 to 04 | All three rules | Light touch. You'll get feedback, not deductions |
| Project 1 | All three rules | Part of Code Quality. Graded leniently: you lose points only if there are no comments at all |
| Project 2 | All three rules, and every function has one | Part of the rubric. Missing function comments cost points here |
| Project 3 | All three rules, with comments that explain **why** | Part of Code Quality and Organization. Highest bar of the semester |

Two things that apply to every project: remove or comment out your `print` statements before
you submit, and don't leave blocks of dead code sitting in the file.

---

## Going Further: Professional Commenting

Everything below this line is recommended, not required. You will not lose points for skipping
it. You will see all of it the moment you work on a real codebase, so it's worth knowing.

The closest thing to an industry standard is **Doxygen** and **Javadoc**, automated tools that
generate documentation pages from the comments in your source files. We won't use a
documentation generator in this class, but the conventions come from those tools and you will
run into them constantly.

Here are the comment forms:

```javascript
/**
 *
 * Here be a comments block
 *
 */

 ///
 /// This is also a comment block
 ///

 // Here is a single line comment.
```

You can add detail with tags: parameters, return types, author, and other metadata.

```javascript
/**
 * This is a my function that does a + b and returns c.
 *
 * @author John-Paul Takats
 * @version 1.0.0
 * @param a - first integer
 * @param b - second integer
 * @return c - sum of both a and b.
 */
```

That block sits above a function and describes what the function does, who wrote it, what comes
in as a parameter, and what goes back out.

Below is a complete program commented in that fuller style:

```dart
import 'package:flutter/material.dart';

/// 
/// Basic example Flutter program to demonstrate professional commenting style.
/// This block is what would be expected at the very top of your program or file
/// and describes what this file/program is for.
/// 
/// @author: John-Paul Takats
/// @version: 1.0.0
/// @since: 2026-08-24
/// 
/// todo:
/// Expand upon the base program to demonstrate the use of comments.
/// 
/// notes:
/// This information is based off of Doxygen and JavaDoc style comments.
/// 

///
/// Main function that starts the program. 
/// We use runApp to start the program with our StatelessWidget MainApp.
///
void main() {
  runApp(MainApp());
}
// END main

///
/// StatelessWidget that is the root of our program.
/// 
class MainApp extends StatelessWidget {
  late int _counter = 0;
  late String _name = 'Your Name';

  MainApp({super.key});

  //
  // primary build function that builds the UI for the program.
  // Notice for this comment block, we're only using a double slash, this is because 
  // we're inside our MainApp. Technically, you could still use the triple slash, but I
  // this is is easier to read.
  //
  // @return MaterialApp
  //
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
  // END build
}
// END MainApp
```

Notice the `// END main` and `// END MainApp` closers. In a deeply nested widget tree, those
make it much easier to tell which closing brace belongs to what. Flutter code nests hard, so
this is a habit worth picking up even though I'm not requiring it.
