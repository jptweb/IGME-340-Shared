//PHASE 1
// sumNums(a, b) {
//   return a + b;
// }

// void main() {
//   int a = 10;
//   int b = 20;

//   var retVal = sumNums(a, b);

//   print(retVal);
// }

// //Phase 2
// sumNums(a, b) {
  
//   return Future.delayed(Duration(seconds:2), () {
//     return a+b;
//   });
  
// }

// void main() {
//   int a = 10;
//   int b = 20;

//   var retVal = sumNums(a, b);

//   print(retVal);
// }

// //Phase 3
// sumNums(a, b) {
  
//   return Future.delayed(Duration(seconds:2), () {
//     int retVal = a+b;
//     print("sumNums: $retVal");
    
//     return retVal;
//   });
  
// }

// void main() {
//   int a = 10;
//   int b = 20;

//   var retVal = sumNums(a, b);

//   print("Final: ${retVal}");
// }


//Phase 4
// Future<int> sumNums(a, b) {
  
//   return Future.delayed(Duration(seconds:2), () {
//     int retVal = a+b;
//     print("sumNums: $retVal");
    
//     return retVal;
//   });
  
// }

// void main() async {
//   int a = 10;
//   int b = 20;

//   var retVal = await sumNums(a, b);

//   print("Final: ${retVal}");
// }

//Phase 5
Future<int> sumNums(a, b) {
  
  return Future.delayed(Duration(seconds:2), () {
    throw Exception("OMG something bad happened");
  });
  
}

void main() async {
  int a = 10;
  int b = 20;

  print("start");
  
  try{
     var retVal = await sumNums(a, b);
      print("Final: ${retVal}");
  }catch(err){
    print("ERROR: $err");
  }

  
}
