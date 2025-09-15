# Program Commenting Guide
As a software developer it is an important task to comment your code. Good comments are meant to not only help others, but yourself. Often you may revisit a program after a lengthy amount of time, and it is a certainty you will not remember all the details of your program. Valuable time will be wasted in reacquanting yourself with your code. Good comments can alleviate this issue and help others who may be called to maintain your code in the future.
Ultimately, commenting, regardless of how important it is, is not a very liked activity.

The closest thing to an industry standard for commenting is Doxygen and Javadoc, which are automated tools that generates documenation pages based on comments in your program files.

Even though we will not be utilizing documentation generators in our class, understanding the concepts will be invaluable when working on large projects or in a large organization that will require you to comment your code.

Here are some examples of doxygen/javadoc comments:

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

Simple enough, right? But we can also add more detail into the comments by using tags; such as adding parameters, return types, author and other meta data.

```javascript
/**
 * This is a my function that does a + b and returns c.
 *
 * @author Dower Chin
 * @version 1.0.0
 * @param a - first integer
 * @param b - second integer
 * @return c - sum of both a and b.
 */
```

As you can see, the comment block above would be for a function header block and describes what the function will do, who wrote it, details about what is coming in as a parameter and what the function returns.

Below is an example of a complete program that is commented:

```dart
import 'package:flutter/material.dart';

/// 
/// Basic example Flutter program to demonstrate the expected use
/// of comments in your code. These types of comments will be required for 
/// full credit in the documentation portion of any project.
/// This block is what would be expected at the very top of your program or file
/// and describes what this file/program is for.
/// 
/// @auther: Dower Chin
/// @version: 1.0.0
/// @since: 2021-09-20
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

