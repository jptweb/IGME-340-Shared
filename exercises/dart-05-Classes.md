# Dart ICE 5 - Objects and Constructors

Dart is an object-oriented language, and the use of objects is important to making more manageable programs. Dart has similar object mechanics to other languages like C#.
In this exercise we will explore them and have you work on mastering some of the concepts.

In Dartpad, create a New Pad and replace everything in the editor with the following code:

```dart
/// our list of monsters
List<dynamic> monsters = []; 

///
/// Our Base Monster class
///
class Monster {
  String? name;
  int? hp;
  int? speed;
  int? score;
}

void main() {

}
```
---
## The Basics
An object can simply be a store for variables, almost like a Map. But it can do so much more. Let's take a look at the `Monster` class, it has a series of fields. What's important here is they all have `?` after the data type, which allows the fields to be null. If you remove them, the compiler will complain. Alternatively, you can avoid the `?` by giving each field a default value:
```dart
class Monster {
  String name = "";
  int hp = 0;
  int speed = 0;
  int score = 0;
}
```
To use our object, we can simply make our `main` look like the following:
```dart
void main() {
  Monster myGoomba = Monster();
  print(myGoomba);
}
```
If you run the program now you will notice the printing of the object does not show anything other than `Instance of Monster`. So unlike a Map, you can't just print an object.
Let's now add a method into our object, make the class look like this now:
```dart
class Monster {
  String name = "";
  int hp = 0;
  int speed = 0;
  int score = 0;

  /// class method
  void status() {
    print("name: $name, hp: $hp, speed: $speed, score: $score");
  }
}
```
in the `main`, change the print to call our `status` method:
```dart
void main() {
  Monster myGoomba = Monster();
  myGoomba.status();
}
```
now our output shows data, which is are the default values.
```
name: , hp: 0, speed: 0, score: 0
```
---
## Constructors
If you've done any object-oriented programming, you'll know that all objects must have some kind of construtor which sets up the object for use. Dart, by default, under-the-hood does this without you needing to specify one. There are a number of ways to make a constructor, so let's take a look at some.  Change the `Monster` class to look like the following:
```dart
class Monster {
  String name = "";
  int hp = 0;
  int speed = 0;
  int score = 0;

  /// constructor
  Monster(String name, int hp, int speed, int score) {
    this.name = name;
    this.hp = hp;
    this.speed = speed;
    this.score = score;
  }

  /// class method
  void status() {
    print("name: $name, hp: $hp, speed: $speed, score: $score");
  }
}
```
Adding this constructor you will notice we now have an error in our `main`, we can no longer just create our `Monster` without parameters. So now we must alter creation of the `myGoomba` object.
```dart
Monster myGoomba = Monster('John', 50, 20, 200);
```
Running the program will produce the following result:
```
name: John, hp: 50, speed: 20, score: 200
```
Let's make the constructor a little better. VSCode is probably complaining about using __initialize formals__. So let's just do that. Alter the constructor to look like this:
```dart
  Monster(this.name, this.hp, this.speed, this.score);
```
VSCode stops complaining and our constructor looks much simplier now. Running the program produces the same results.

The last change we will make to our constructor is to allow the use of __named parameters__. Alter the `Monster` class to look like the following:
```dart
class Monster {
  String name;
  int hp;
  int speed;
  int score;

  /// constructor
  Monster({this.name = "", this.hp = 0, this.speed = 0, this.score = 0});

  /// class method
  void status() {
    print("name: $name, hp: $hp, speed: $speed, score: $score");
  }
}
```
Notice the main differences? __We no longer set the default values in the field declarations and moved them into the constructor.__ Dart won't let us keep the defaults in the declaration, give it a try, you'll notice VSCode will issue an error saying your parameter cannot be null.
Now you can change `myGoomba` creation to the following:
```dart
  Monster myGoomba = Monster(hp: 50, name: 'John', score: 200, speed: 20);
```

---
## Exercise ##
Now let you get to do some work. Complete the following tasks:

1. Create a `Player` class, and do the following:
    * Add fields for `name`, `lives`, `score`, `xp`and `speed`
    * create a constructor and use named parameters. 
    * create a method called `status`, which outputs the object fields.
    * create another method called `levelUp` which adds 100 to `xp`, increases `speed` by 10, and adds 500 to `score`. The method should also call the `status` method.

1. Use your `Player` class and create a player called `Mario` and give him some data. Call the `status` function and then level him up 10x (hint, use a loop).

1. Create a `Treasure` class and do the following:
    * Add fields for `name`, `value`, `rarity`, and `type`. Use default values.
    * create a constructor __without__ using named parameters. 
    * create a method called `status`, which outputs the object fields.

1. Create a new `List` of `Treasure`, and add 5 treasure items to it, then loop through the list and report each item's status. 

1. Use Cascading/Chaining to create a new __Player__ and add a new item to the __treasures__ list. At the end of the chain call the __status__ method to output the results.	For the new treasure item, output the entire list. 

    ** HINT: You will need to alter the Treasure class.



Save the resulting file as `dart_ice_05.dart`for submission.