# Dart ICE 3 - Maps

In Dartpad, create a New Pad and replace everything in the editor with the following code:

```dart
var player01 = {
  'name': 'Leeroy Jenkins',
  'sex': 'M',
  'class': 'Knight',
  'hp': 1000
};

Map player02 = {
  'name': 'Jarod Lee Nandin',
  'sex': 'M',
  'class': 'Overlord',
  'hp': 9000
};
  
Map <String, dynamic> player03 = {
  'name': 'Samantha Evelyn Cook',
  'sex': 'F',
  'class': 'Gunter',
  'hp': 5000
};

void main() {

}

```

## Perform the following tasks: ##

1. Add the following code into the `main` and observe the output. Notice in particular the `runtimeType`, this is an important distinction when creating and dealing with Maps.
    ```dart
    print (player01);
    print ("${player01.runtimeType}");
    print (player02);
    print ("${player02.runtimeType}");
    print (player03);
    print ("${player03.runtimeType}");
    ```
1. Now add this to the `main`:
    ```dart
    var player04 = Map();
    player04['name'] = 'Gordon Freeman';
    player04['sex'] = 'M';
    player04['class'] = 'Scientist';
    player04['hp']= 6000;

    print ("player04: $player04");
    print ("player04: ${player04.runtimeType}");
    ```
    Notice how you can create an empty map and then add data to it. Notice also how this runtimeType is the same as `player02`.

1. Create a new map called `player05`, give it the same keys as the other players. Use whichever creation method you want, and populate it with data. Print the map.

1. Add a new key to `player05` called `armor`, give it a value, and then remove `hp`. Print the results.

1. Create a new map called `moreStuff` with the following keys, `mp`, `money`, `xp`, and `level`. Add whatever values you want for these. Add `moreStuff` to all the player maps.

1. Print all the keys from `player05`.

1. Print all the values from `player05`.

1. Create a new List of Maps, called `playerList`, and add our player maps to this list, then print it.

1. Get the `second player` from the `playerList` and output the name.

1. Loop through our playerList and output all the player names and classes.    
    
1. Clear `player01`, and output the result.

Save the resulting file as `dart_ice_03.dart`for submission.
