import 'dart:collection';

// ignore: prefer_function_declarations_over_variables
main() {
  List<int> demoList = [1, 2, 3, 4];
  List<int> emptyList = [];
  emptyList.addAll(demoList);
  print(emptyList);

  // generic list
  List<String> listData = <String>[];
  listData.add("one");
  listData.add("Two");
  listData.add("Three");
  print(listData);

  // Exception
  int valOne = 10;
  int valTwo = 0;
  int res;
  try {
    res = valOne ~/ valTwo;
  } catch (E) {
    print(E);
  } finally {
    print("this is an finally block");
  }

  // throw -> custom exception
  var demoDeposite = DepositException();
  try {
    depositMoney(-200);
  } catch (e) {
    print(demoDeposite.errorMessage());
  }

  // queue
  Queue<int> queue = Queue<int>();
  queue.add(10);
  queue.add(20);
  queue.add(30);
  queue.add(40);
  print("Queue is:${queue}");
  queue.addFirst(5);
  print("Queue is:${queue}");
  queue.addLast(85);
  print("Queue is:${queue}");

  // callable Class
  var price = Price();
  var msg = price.call(5, 10);
  print("callable Class Ans is:${msg}");

  // lambda expression or anonymous function
  // ignore: prefer_function_declarations_over_variables
  // way 1
  var additionSum = (int valA, int valB) {
    var sum = valA + valB;
    print(sum);
  };
  additionSum(58, 85);

  // ignore: prefer_function_declarations_over_variables
  var mul = (int number) {
    return number * 4;
  };
  print(mul(27));

  // way 2 -> FAT Arrow =>
  var numberAdd = (int temp, int tempTwo) => print(temp + tempTwo);
  numberAdd(20,3);

  var numberMul = (int mul) => mul * 4;
  print(numberMul(6));



}

class DepositException implements Exception {
  String errorMessage() {
    return "You cannot enter amount less than 0";
  }
}

void depositMoney(int money) {
  if (money < 0) {
    throw DepositException();
  }
}

// callable Class
class Price {
  int call(int numOne, int numTwo) {
    return numOne + numTwo;
  }
}
