# Dart ICE 4 - Functions

Let's explore functions in Dart. Functions are vital for code re-use. Luckily Dart functions don't vary much from other languages.

In Dartpad, create a New Pad and replace everything in the editor with the following code:

```dart
void main() {
    // add your new code here.
}
```

## Basic Functions ##

Perform the following tasks, call each of the functions created from your main function:

1. Create a __function__ called `helloFunction` that returns nothing but takes in a string and an integer parameter. The function should just print the parameters out. Call the function from main as follows:
    ```dart
    helloFunction("hi", 10);    
    ```
    ```dart
    void helloFunction (String a, int b) {
        print ("$a, $b");
    }
    ```

1. Now attempt to call the `helloFunction` as follows:
    ```dart
    helloFunction(null,10);
    ```
    Notice what happens? We can't because or parameter isn't allowed to be null.

1. Alter the `helloFunction` and allow the String parameter to be null.
    ```dart
    void helloFunction (String? a, int b) {
        print ("$a, $b");
    }
    ```
---

## Optional Positional Parameters ##
Function parameters can also be made optional, so instead of allowing nulls, you can make some parameters optional, you use `[]` to mark optional parameters. However, you will also be required to give the optional parameters a default value. ex:
```dart
    void helloFunction3 ([String a="hi", int b=10]) {
        print ("$a, $b");
    }
``` 
I made all the function parameters optional, I could have done this with just one. If we run the function now:
```dart
    helloFunction3();
```
we will get back `hi, 10`.

---

## Named Parameters ##
__Named Parameters__ offers another way to send parameters into a function in a more readble way. Take a look at this example:
```dart
void printThree({String? first, String? second, String? third}) {
    print ("$first, $second, $third");
}
```
Calling this function looks like this:
```dart
    printThree(first: "Hello", second: "Fall", third: "Season");
```
Try this yourself. You should get the following output:
```
   Hello, Fall, Season 
```
Another benefit of named parameters, is you can call them out of order, like this:
```dart
    printThree(third: "Season", first: "Hello", second: "Fall", );
```
There are times where you may want to require parameters, you can do that by adding `required` in front of a parameter. If a parameter is required, you don't need to add the `?`, since there is no potential of a missing paramter, even a __null__ is considered a valid parameter. Make sure your function looks like below:
```dart
void printThree({String? first, required String second, String? third}) {
  print("$first, $second, $third");
}
```
So, we are allowing nulls for `first`, and `third`, but only `second` is required. Now we can skip sending some parameters to the function, so we could invoke `printThree` as follows:
```dart
    printThree(second:"Hello");
```
Bypassing all the other named parameters. However, you will need to trap for `null` variables, because calling our function now will produce:
```
    null, Hello, null
```

---

## Exercises ##
Now it's time for you to do work. Complete the following tasks:

1. Create a new function called `addThree`, as the function name implies, pass in 3 `int` named parameters, add them and print them.
    

1. Create a __function__ that does the following:
    * returns a `String`.
    * named `joinStrings`. 
    * takes in named string parameters. 
    * allow the first 2 parameters to be null.
    * make the last 2 parameteres optional with default values. 
    * Don't print nulls, and combine all the strings into one and return.


1. Create a __function__ that does the following:
    * returns an `Map`.
    * named `hiLow`.
    * takes in __3 floating point numbers__. 
    * __Add__ the numbers together. Store in our return map as `sum`. 
    * __Round__ the result __upward__ and __downward__. Store in our return map with keys `high` and `low`.
    

1. Create a __function__ that does the following:
    * returns an `Map`.
    * named `makeCharacter`.
    * takes in __4 named parameters__; `name, playerClass, mp, hp`. 
    * if `mp` or `hp` is null, give them a default value.    
    * __Add__ to the map `xp` and `level` with some default value.



Save the resulting file as `dart_ice_04.dart`for submission.