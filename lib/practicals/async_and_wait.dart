import 'dart:ffi';

main() async {
   print(await getName());
    // print("hello");
}

Future<String> getName() {
  return Future.delayed(Duration(seconds: 2),() {
    return "Vishal";
  });
}