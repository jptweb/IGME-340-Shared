# Dart ICE 6 - Class Inheritance

Now that we know how to create an object, we move onto the ability to create sub-objects where the new object inherits the fields and methods of another. Let's continue with some of the work done in the previous lab.

In Dartpad, create a New Pad and replace everything in the editor with the following code:

```dart
/// our list of monsters
List<dynamic> monsters = [];

///
/// Our Base Monster class
///
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

void main() {

}
```

Let's start by creating a simple object that inherits from `Monster`. Add the following code after the `Monster` class.
```dart
  class Goomba extends Monster {}  
```
add this to the `main` function:
```dart
void main() {
  Goomba myGoomba = Goomba();
  myGoomba.status();
}
```
if you run the program now, myGoomba will call the `status` function that was inherted from `Monster`. We will get the following:
```
name: , hp: 0, speed: 0, score: 0
```
We've now successfully created a sub-class of `Monster`.
But how do we get at the fields? Could we add a constructor to Goomba, like this?
```dart
class Goomba extends Monster {
  Goomba({this.name, this.hp, this.speed, this.score});
}
```
If you tried it, you'll find out you can't. Those fields are NOT in Goomba, but it's parent, Monster. We need to send these parameters to the parent, to do that we need to use `super`. 
Make the following updates:
```dart
class Goomba extends Monster {
  Goomba({super.name, super.hp, super.speed, super.score});
}
```
We also need to update how we create `myGoomba`:
```dart
void main() {
  Goomba myGoomba = Goomba(name: "Pinky", hp: 50, speed: 5, score: 100);
  myGoomba.status();
}
```
Running the program now gives us the following output:
```
name: Pinky, hp: 50, speed: 5, score: 100
```
Let's continue and expand on our Goomba object, let's add `color` and `dmg`. Our Goomba looks like this now:
```dart
class Goomba extends Monster {
  String color;
  int dmg;

  Goomba(
      {super.name,
      super.hp,
      super.speed,
      super.score,
      this.color = "brown",
      this.dmg = 20});
}
```
Notice how we need to now add the new fields into our constructor, and we are using `this` vs `super`.
We are now faced with another problem. The `status` function will not output our new fields. We could create a new function in `Goomba`, but why bother, when we can __override__ the parent `status` with our own. Let's add this to our `Goomba`:
```dart
  @override
  void status() {
    print(
        "name: $name, hp: $hp, speed: $speed, score: $score, color: $color, dmg: $dmg");
  }
```
Notice we use a `@override` directive to tell Dart that we are going to use our own function of the same name, thus using Goomba's `status`, and not `Monster`'s.
Running the program now will output:
```
name: Pinky, hp: 50, speed: 5, score: 100, color: brown, dmg: 20
```
---
## Exercise ##
Now it's time you do some work. Complete the following tasks.

1. Add a `type` proprety to the **Monster** class. Make the `Goomba` add a value to this property. Be sure to output this new property, also fix any issues that arise.
    
1. Create a new class called **Boo** that inherits everything from Monster. Add an `mp` property and a new constructor.

1. Add a function called **castSpell** to **Boo** which takes in an integer and reduces the **Boo** mp by that amount, it should also write something to console. 

1. Override the **Monster** `status` class in **Boo** to return all the stats, including `mp`.


1. Create a `makeSomeMonsters` function and add a number of **Goombas** and **Boos** to the monster list. Call this function from main.
		

1. Finally, create a `showMonsters` function can take a specific `type` of monster and goes through our list of monsters, when that type is encountered, call its `status` function. Call this function from `main` once for Boos and once for Goombas.



Save the resulting file as `dart_ice_06.dart`for submission.