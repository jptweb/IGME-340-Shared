# Dart ICE 7 - Asynchronous Programming

Dart and Flutter are built for asynchronous operations, and this is something that is vital for mobile apps. You can never know when exactly external queries will come back with data, so sitting around waiting for a response is not ideal. We looked at this in 230/235 when dealing with API calls, and the importance is the same here. Before diving into actual API calls, we need to understand how Dart handles Asynchronous operations.

Start a new __VSCode Dart Console application__. Call it `dart_async`. Clear out the sample file and replace with the following content:

### dart_async.dart
```dart
import 'dart:io';

void main() {
  print("Start");
  getData();
  print("End");
}

void getData() {
  sleep(Duration(seconds: 2));
  print("> I have Data!");
}
```

Let's take a look at this program. The first thing you will notice is we are now doing our first library import; for this example we are using Dart's IO library, `dart:io`. The main program performs some output, then calls a function `getData` then prints again.
The `getData` function uses a sleep function that waits 2 seconds before printing. 

What do you think will happen when you run it? Do that now, you will get the following:
```
Start
> I have Data!
End
```
If you paid attention you will notice there was a delay before `End` was finally output to the console. The delay is to simulate a blocking operation, such as a long for loop or heavy processing event. This situation isn't ideal, since in a larger application your entire app would essentially freeze while the `getData` function finished. What should happen is the program should continue and once `getData` is done, something should happen later. The program needs to run in an 'asynchronous` mode.
Let's alter the program and change the `getData` function:
```dart
void getData() {
  Future.delayed(Duration(seconds: 2), () {
    print("> I have Data!");
  });
}
```
We removed the `sleep` function and switched to a `Future.delayed` function, which inside has an anonymous function that prints something after the delay. 
Run the program now, and your output should be:
```
Start
End
> I have Data!
```
This is more like it, we can see the `End` is hit before the data is returned from the `getData` function, which shows that the data returned after a delay and the program thread was not locked.
But we're not quite done yet. What if there is a step afterwards that requires data from `getData`?
Replace everything in the file with the following:
```dart
void main() {
  print("Start");
  String? data = getData();
  processData(data);
  print("End");
}

String? getData() {
  String? result;

  Future.delayed(Duration(seconds: 2), () {
    result = "Data came back from task.";
    print("> I have Data!");
  });

  return result;
}

void processData(String? data) {
  print(">> Process Data, $data");
}
```
What did we change?
* main
  * changed the call to `getData` to store the return in a String called `data`.
  * new `processData` function that takes in the returned `data` String.

* getData
  * Now returns a String from the local `results` String.
  * `results` is set in the `Future.delayed` function.
  
* `processData` is our new function, it takes in a String called `data`, and prints it.
* __NOTE__ Do you see the `?` for the variable declarations and returns? We need that because we're telling Dart that a null is a potential return. Remember, Dart is null safe, and we need to tell it when we want a potential null.

Run the program, and notice the output:
```
Start
>> Process Data, null
End
> I have Data!
```
The output isn't quite right yet, `null` is displayed as the return from `getData`.
Why? Because the function isn't waiting for data before sending it off to the `processData` function.
Let's fix this now by adding the keyword `async` and `await`:
```dart
void main() async {
  print("Start");
  String? data = await getData();
  processData(data);
  print("End");
}

Future<String?> getData() async {
  String? result;

  await Future.delayed(Duration(seconds: 2), () {
    result = "Data came back from task.";
    print("> I have Data!");
  });

  return result;
}

void processData(String? data) {
  print(">> Process Data, $data");
}
```
Look closely at the changes, we've added `async` after the function definition of `main` and `getData`. Then we added `await` to the function calls for `getData` and our `Future.delayed`. These keywords tell Dart that the functions are now asynchrnous, and certain parts will be need to be done before continuing. Lastly, our `getData` function now returns a `Future<String?>` which is required for an async function. 
Run the program now, and the results will be more desirable:
```
Start
> I have Data!
>> Process Data, Data came back from task.
End
```
---
## Working with API's

Now that we have a bit more understanding about asynchronous functions, let's put it to use in a real situation. We are now going to get data from an external API. But first we need to do some setup, and utilize some packages to give dart the functionality we need. 

To keep it simple, let's create a new Dart console application, call it `dart_http`. When the project is created, let's make an update to the `pubspec.yaml` file. We've not talked about this file yet, but this is where the project informatio s stored. 
Your file will look similar to this:
```yaml
name: dart_http
description: A sample command-line application.
version: 1.0.0
# homepage: https://www.example.com

environment:
  sdk: '>=2.17.6 <3.0.0'

# dependencies:
#   path: ^1.8.0

dev_dependencies:
  lints: ^2.0.0
  test: ^1.16.0
```
Notice the `dependencies` section is commented out. We need to gain access to the `http` package, so change that section to be:
```yaml
dependencies:
  http: any
```
Now go back to your dart file, and replace its contents with the following:
```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
}

```
You can see we imported to items into our program. The `package:http/http.dart` grants us access to the http library to perform web requests. The `dart:convert` gives us access to some converters which we will use to work with the data returned by our API.

For our example we will be using a public test api, [JSON Placeholder](https://jsonplaceholder.typicode.com/). This is a handy site that produces fake JSON responses so we can test API access code.
The first endpoint we will work with is `https://jsonplaceholder.typicode.com/todos/1`, make the rest of your dart file look like the following:
```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

String url = 'https://jsonplaceholder.typicode.com/todos/1';

void main() async {
  var response = await http.get(Uri.parse(url));  

  print(response.runtimeType);
  print(response.statusCode);
  print(response.body.runtimeType);
  print(response.body);
}
```
It's important to understand what's happening here. 
* We made our `main` function into an `async` function.
* We use the `http.get` operation to __GET__ data from a URL, we use an `await` for our call.
* We have to __convert__ our String into a Uri, we rely on the Uri converter for this.
* Pay attention to the output, it's important to understand what is returned.
  
Run the program and observee the output:
```
Response
200
String
{
  "userId": 1,
  "id": 1,
  "title": "delectus aut autem",
  "completed": false
}
```
The `response runtimeType` is a `Response`, we have a `status code` of `200`, which is a success. The response body is a `String`, and it contains a stringified JSON object.
A stringiied JSON object isn't going to be useful for us to work with, so we need to convert it. Add the following code after our print statements:
```dart
  var data = jsonDecode(response.body);
  print(data.runtimeType);
  print(data);
```
Run the program now and observe what `data` is:
```
_InternalLinkedHashMap<String, dynamic>
{userId: 1, id: 1, title: delectus aut autem, completed: false}
```
You can see that `jsonDecode` has converted our string into a type of `Map`, with a `String` key and `dynamic` value. When we output the Map, we can see the key/value pairs.

---
## Exercises
OK, time for you to do some work. Clear out your dart file or start a new dart console application and replace the contents with the following:
```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

String url = 'https://jsonplaceholder.typicode.com/todos/1';

void main() {
  print("01: Start");
  getData(url);
  processData();
  print("04: main Done");
}

void getData(String url) {
  print("02: Calling API");

  /// Your code goes here.
}
void processData(Map data) {
  print("03: Output Data");

  /// Your code goes here.
}
```

1. Change this program in the following ways:
   * Make `main` asynchronous.
   * Call `getData` asynchronously
   * `getData` should call the url and process the data into a `Map` and return to the caller.
   * `processData` should take in a Map.
   * `processData` should output all the keys and values from the `Map`.


2. If you've not handled error conditions in the previous step, go ahead and break the url to cause an error. Trap and handle the errors. Output the error condition to the console.
   

3. Add a new `String` url variable and set it to this:
   ```
   https://jsonplaceholder.typicode.com/posts
   ```
   Call this url and get data from it. Take this data and pass it to another function to output only the `title` in each return object.


If you are successful, go ahead and submit your dart file for grading.