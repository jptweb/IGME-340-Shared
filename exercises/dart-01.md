# Dart ICE 1 - Variables, Data Types and Loops.

Welcome to Dart, this is the underlying language used by Flutter, so getting a basic grasp of this language will be important to build apps in Flutter. So, first thing we will look into are the Variables and Data Types used in the language.

For simplicity, we will use Dartpad (https://dartpad.dev). In Dartpad, create a __New Pad__ and put the following code into the editor.

```dart
void main() {
    int myNumber = 1234;
    double myFloat = 1234.6234;
    String myString = "Hello World";
    bool myBoolean = false;
    const myConst = "I don't change";
    final iAmFinal;
    dynamic iAmDynamic;
    var iAmVar;
    
     // add your new code here.
}
```

At first glance there isn't much special about the data types in Dart, the interesting thing here is we only have `int` and `double` for our numbers, there is no `float`, or unsigned versions of int. `String` and `bool` are also pretty straightfoward. Dart however still has some loosely typed options found in `var` and `dynamic`.

Let's work with some of the quirks with data types.

1. __Const vs Final__. At first glance these perform the same, but the important point here is Const is set at compile time, which means it's already know before the program even starts. So in our example above, myConst is already know, you can't make a blank const and populate with data later. That's where final is different. Final will act as a const, but you see above, it's not given a value at first. However, once it's assigned, it can no longer be changed.

    1. Attempt to change `myConst`. You should get an error.
        ```dart
        myConst = "changed const";
        ```
    2. Assign some value to `iAmFinal`. 
        ```dart
        iAmFinal = "My Final Offer";
        ```
    3. Attempt to change `iAmFinal`, you will get an error.
        ```dart
        iAmFinal = "I changed my Mind!";
        ```
2. __Var vs Dynamic__, `var` and `dynamic` are similar, but the difference is `dynamic` can always change type whereas var, once the data type is set, cannot change. Try the following:

    1. In the main, add this following code:
        ```dart
        iAmVar = 12345;
        print(iAmVar);
        iAmVar = "I am String now";
        print(iAmVar);
        ```
        This works fine? Why? because we defined `iAmVar` without a type, so Dart converts this to a dynamic. However, if you modify the var to initially assign `iAmVar` to an number, you will not be allowed to change it into a String. Try that now, you will see the above code no longer work.

    2. Now let's try `iAmDynamic`, alter the declaration of our dynamic and give it a number. Then try the same code in step 1 and see what happens.

## Console Output ##
At some point you'll want to ouput data, we've already seen from above you can use `print`, but you can do more than just output a variable. Dart supports string interpolation. You can do the following:
    
* print ("some text " + dbl.toString());
* print ("some text $variable");
* print ("some text ${variable.function()}");

*__Note:__ in the above example, if you print a number without interpolation, such as a `int` or `double`, you need to use the `toString` function.*

---

### Exercise ###
Do the following tasks, feel free to use Dart documentation or your internet search skills to figure some of the tasks out.

1. Use interpolation and output `myString` along with `myFloat`.


1. Use interpolation and output `myString`, but make all the characters uppercase.


1. Use interpolation and output both the value of `myFloat` rounded up and down.


1. Use interpolation to print out the number of seconds that have passed since 1970 - use the `DateTime` library.


1. Print out the absolute value of -999.


1. Create a new dynamic variable. Assign it initially to `1234`, print it, then assign to `"Hello there!"`, and print it.

1. Create a `for loop` that prints 0 to 20.
    
1. Perform the same operation as above but using a `while loop`.
    
1. Modify both the `for loop` and `while loop` and break out of the loop once the counter reaches 10.
    
Save the resulting file for submission as `dart_ice_01.dart`.