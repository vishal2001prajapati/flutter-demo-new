import 'dart:io';

main() {
  // Print the statement
  print("Hello");

  // variable declarations
  var name = "Vishal";
  var number = 241;
/*   This is the example of multi-line comment
    This will print the given statement on screen */

  print("Your Name is $name and Your Number is $number");

  // DataTypes in Dart
  // Number, Strings, Booleans, Lists, Maps, Runes, Symbols

  int integerValue = 2;
  double doubleValue = 2.08;
  String stringMsg = "Hello Dart";
  bool isValid = true;

  // Lists ->  list is similar to an array.
  var list = [85, 1, 2, 3, 8];
  print("List Value is -> $list");
  list.add(106);

  print(list);

  // Maps ->  store values in key-value pairs.
  var maps = {1: "vishal", 2: "raj", 3: "vinayak"};
  print("Maps -> $maps");
  print("Maps Key -> ${maps.keys}");
  print("Maps Value -> ${maps.values}");

  // variables
  // Declaring the variable with Multiple Values
  int i, j, k;

  // Final and const
  final double pi = 3.14;
  // constant
  const raj = 2001;

  // Types of Operators
  // Arithmetic Operators + , - , * , /
  var a = 5;
  print(++a);
  print(--a);
  // Assignment Operator
  var b = 6;
  a += b;
  print(a);

  // Relational Operator -> <, > ,<=,>=, !=

  // Test Operators
  // as-> type cast, is-> , is!
  var num = 10;
  // ignore: unnecessary_type_check
  print(num is int);
  // ignore: unnecessary_type_check
  print(name is! String);

  // Logical Operators -> &&, ||, !
  //Conditional Operators (?:)
  var x = null;
  var y = 20;
  var val = x ?? y;
  print(val);

  var temp = 30;
  var output =
      temp > 42 ? "value greater than 10" : "value lesser than equal to 30";
  print(output);

  // parse() function
  var testOne = int.parse("5256");
  print(testOne);

  // Fixed Length List
  // syntax  ->  var list_name = new List(size)
  var tempList = List.filled(5, 0);
  tempList[0] = 5;
  tempList[1] = 10;
  print("tempList is:${tempList}");

  List newList = [4, 9, 5, 7, 65, 96];
  newList.insert(3, 408);
  print("List after insert value:${newList}");
  newList.remove(96);
  print("List after removing element:${newList}");
  newList.forEach((element) {
    print(element);
  });

  // set -> unordered collection and doesn't allow storing the duplicate values
  var studentName = <String>{"vishal", "raj", "vinayak", "raj", "raj"};
  print("set is:${studentName}");
  studentName.add("dharmik");
  print("New set is:${studentName}");
  var tempVal = studentName.elementAt(2);
  print("elementAt is:${tempVal}");

  // Map constructor
  var studentMap = Map();
  studentMap['name'] = 'vishal';
  studentMap['age'] = 23;
  studentMap['course'] = 'IT';
  print("studentMap is:${studentMap}");

  // enum
  print(Year.values);
  Year.values.forEach((element) {
    print("value:${element}, index:${element.index}");
  });

  // if statement
  var age = 25;
  if (age >= 18) {
    print("You are eligible for voting");
  } else {
    print("You are not eligible for voting");
  }

  // if else-if Statement

  var marks = 74;
  if (marks > 85) {
    print("Excellent");
  } else if (marks > 75) {
    print("Very Good");
  } else if (marks > 65) {
    print("Good");
  } else {
    print("Average");
  }

  // switch statement
  int Roll_num = 90014;
  // Evaluate the test-expression to find the match
  switch (Roll_num) {
    case 90009:
      print("My name is vishal");
      break;
    case 90010:
      print("My name is Raj");
      break;
    case 090011:
      print("My name is Dharmik");
      break;

    // default block
    default:
      print("Roll number is not found");
  }

  // Loop
  for (var i = 1; i <= 5; i++) {
    for (var j = 1; j <= i; j++) {
      stdout.write("* ");
    }
    print("");
  }

  // Function
  int sum(int a, int b) {
    int result;
    result = a + b;
    return result;
  }

  var c = sum(5, 10);
  print("Sum is ${c}");

  // simple class and object
  var student = Student();
  student.num = 17;
  print(student.num);
  student.showData();

  // Constructor
  DemoConstructor demoConstructor = DemoConstructor(980, 1);

  // static keyword
  var college = College();
  College.studentBranch = "IT";
  college.collegeId = 25;
  college.collegeName = "VGEC";
  college.displayCollegeInfo();
  var collegeObjTwo = College();
  collegeObjTwo.collegeName = "L.D";
  collegeObjTwo.collegeId = 36;
  collegeObjTwo.displayCollegeInfo();

  // super keyword
  var childClass = ChildClass();
  childClass.message();

  // Hierarchical Inheritance
  var vishal = Vishal();
  vishal.displayName("Vishal");
  vishal.displayBranch("IT");
  vishal.displayAge(21);

  var dharmik = Dharmik();
  dharmik.displayResult(6556);
  dharmik.displayName("Dharmik");

  // getter and setter
  var aObj = A();
  aObj.userName = "Raj";
  print(aObj.userName);

  // Abstract Classes
  var boy = Boy();
  boy.displayUserInfo();


  // interface
 var collegeDemo = CollegeDemo();
  collegeDemo.per_name = "raj";
  collegeDemo.per_age = 20;
  collegeDemo.department = "IT";
  collegeDemo.displayName();
  collegeDemo.displayAge();
  collegeDemo.displayDepartment();

}

// oop concept
class Student {
  var studentName = "Vishal Prajapati";
  var num;

  void showData() {
    print("Name is:${studentName}");
    print("Enrolment Number is:${num}");
  }
}

// Constructor
/* Default Constructor or no-arg Constructor
  Parameter Constructor -> Value we can pass in parameter
  Named Constructor -> Multiple constructor in one class
  this keyword
  */

class DemoConstructor {
  int x = 0;
  int y = 0;

  DemoConstructor(int x, int y) {
    this.x = x;
    this.y = y;
    print(x + y);
  }
}

  // static keyword
  class College {
  static late String studentBranch;
  late String collegeName;
  late int collegeId;

  void displayCollegeInfo() {
    print("College Name:${collegeName}");
    print("College Id:${collegeId}");
    print("College Branch Name:${studentBranch}");
  }
}

  // super keyword and Inheritance
  class SuperClass {
  void display() {
    print("this a SuperClass");
  }
}

class ChildClass extends SuperClass {
  @override
  void display() {
    print("this is a Modification method of SuperClass");
  }
  void displayChild(){
    print("this is a ChildClass");
  }

  void message() {
    super.display();
    display();
    displayChild();
  }
}
  // Hierarchical Inheritance
  class Person {

  void displayName(String name){
    print(name);
  }
  void displayAge(int age){
    print(age);
  }

}
  class Vishal extends Person {
  void displayBranch(String branch){
    print(branch);
  }

}

  class Dharmik extends Person {
  void displayResult(int result) {
    print(result);
  }
}

  // getter and setter
  class A {
 var userName;
 void set curSet(String name){
   this.userName = name;
 }

 String get curSet {
   return userName;
 }

}

  // Abstract Classes
  abstract class Peron {
    void displayUserInfo();
  }

  class Boy extends Peron {
  @override
  void displayUserInfo() {
    print("this is a Abstract Classes example");
  }

  }


  // interface
  class PersonDemo {
   late String per_name;
   late int per_age;
   void displayName(){

   }
   void displayAge() {

   }
  }

  class Faculty {
    late String department;
    late int salary;
    void displayDepartment(){

    }
    void displaySalary() {

    }
  }

  class CollegeDemo implements PersonDemo,Faculty {
  @override
  late String department;

  @override
  late int per_age;

  @override
  late String per_name;

  @override
  late int salary;

  @override
  void displayAge() {
    print("Age: ${per_age}");
  }

  @override
  void displayDepartment() {
    print("I am a proffesor of ${department}");
  }

  @override
  void displayName() {
    // TODO: implement displayName
  }

  @override
  void displaySalary() {
    // TODO: implement displaySalary
  }

  }





// enumration
enum Year {
  January,
  February,
  March,
  April,
  May,
  June,
  July,
  August,
  September,
  October,
  November,
  December,
}