bool iszero(int number) {
  return number == 0;
}

void printinfo(int number, Function check, {int t}) {
  print("$number is Zero: ${check(number)}");
}

Function f = iszero;

main() {
  int x = 10;
  int y = 0;
  printinfo(x, f);
  printinfo(y, f);
}

class Point {
  num x = 0, y = 0;
  void printInfo() => print('($x,$y)');
}

//Vector 继承自 Point
class Vector extends Point {
  num z = 0;
  @override
  void printInfo() => print('($x,$y,$z)'); // 覆写了 printInfo 实现
}

//Coordinate 是对 Point 的接口实现
class Coordinate implements Point {
  num x = 0, y = 0; // 成员变量需要重新声明
  void printInfo() => print('($x,$y)'); // 成员函数需要重新声明实现
}

// with 关键字即可。我们来试着改造 Coordinate 的实现，把类中的变量声明和函数实现全部删掉：

class Coordinate2 with Point {}

main2() {
  var xxx = Vector();
  xxx
    ..x = 1
    ..y = 2
    ..z = 3; // 级联运算符，等同于 xxx.x=1; xxx.y=2;xxx.z=3;
  xxx.printInfo(); // 输出 (1,2,3)
}

//Dart 提供了类似 C++ 的运算符覆写机制，使得我们不仅可以覆写方法，还可以覆写或者自定义运算符。

class Vector2 {
  num x, y;
  Vector2(this.x, this.y);
  // 自定义相加运算符，实现向量相加
  Vector2 operator +(Vector2 v) => Vector2(x + v.x, y + v.y);
  // 覆写相等运算符，判断向量相等
  bool operator ==(dynamic v) => x == v.x && y == v.y;
}
