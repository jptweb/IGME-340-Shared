# Flutter ICE 2 - Buttons, Styles and ThemeData

We've explored some basic layout, now let's start with looking at buttons and the Flutter Themeing/Styling system.

Create a new __Flutter Application__ called `themes_and_buttons`. Once the project is created, remove all the starter code in the main.dart and replace with the following:

### main.dart
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IGME-340: Themes"),
      ),
      body: Column(
        
        children: [
          Container(
            width: 300,
            height: 200,
            color: Colors.green,
            child: Text("I am Green"),
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.yellow,
            child: Text("I am Yellow"),
          ),
          Container(
            width: 350,
            height: 100,
            color: Colors.pink,
            child: Text("I am Pink"),
          ),
          ElevatedButton(
            onPressed: () {
            },
            child: const Text('Elevated Button'),
          )
        ],
      ),
    );
  }
}

```
This code will be the basis for the exercise.

---
## Exercise:

1. Add a `themeMode` attribute to your MaterialApp and set it to `light`.

2. Add a `darkTheme` to the MaterialApp, and apply a new color scheme based on a seed color of `red`.

3. Add a `scaffoldBackgroundColor` to both light and dark themes. Set the dark background to `blueGrey[500]` and the light background to `grey[300]`. Now toggle the theme between light and dark and observe the background color change, it should toggle between the blueGrey when dark, and grey when light. **Return back to the `light` theme before continuing.**

4. Change the colors of the containers to material theme colors and observe the changes:
    * `green` to `primary`
    * `yellow` to `secondary`
    * `pink` to `error`


5. Add to both light and dark themes a `textTheme`, and establish a custom `color`, `fontSize`, and `fontWeight` for the following properties:
   * `displayLarge`
   * `displayMedium`
   * `displaySmall`
   * `bodyLarge`
   * `bodyMedium`
   * `bodySmall`
  
    experiment with the font sizes, colors and weights, ie: displayLarge can be `48`, Medium `36`.

6. Change each container's text to a different textTheme, observe the changes when the app reloads. 

7. Add another `ElevatedButton` below the existing one.

8. In the ThemeData, create a style for all `ElevatedButtons`, do this for both the light and dark theme. Give the theme a `background`, `foreground` color and a `textStyle`. Use colors from the theme's colorScheme.

9. Wrap the `Column` in a `SingleChildScrollView` Widget.

10. At the top of the `Column`, Add a, `TextButton` and `OutlinedButton`. Give each some identifying text. For now, make each onpressed event an empty function. Style the buttons with inline styles; give them a background and foreground color, and some font settings.

11. Change your latest `ElevatedButton` to use an inline style of your choice.

12. At the top of the `Column`, Create an `ElevatedButton` with an icon. Create and use an inline style to customize it as you like, but also alter the `border` of this button.

13. Alter the default font of the theme to `Courier`.

14. Add an `onPressed` event for each of your buttons, you can use either an external function or an anonymous function. Output some text to the console.
   
Perform a `flutter clean`, zip up your app and submit to the Assignment dropbox.
