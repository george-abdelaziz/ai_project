import 'package:logger/logger.dart';

double abs(double a) {
  return a > 0 ? a : -a;
}

enum PlayerType { human, minmax, alpa, iter }

enum Selected { selected, not }

class MyPoint {
  //qwerty[which board][vertical height of the board][horizontal width of the board][n/height of the stack]=double;
  //qwerty[x][y][z][n]=double;
  int x = 0;
  int y = 0;
  int z = 0;

  MyPoint({this.x = 0, this.y = 0, this.z = 0});

  void zero() {
    x = 0;
    y = 0;
    z = 0;
  }

  void nagOne() {
    x = -1;
    y = -1;
    z = -1;
  }

  void myPrint() {
    print('$x,     $y,     $z');
  }

  double getLastNumber({required List<List<List<List<double>>>> arr}) {
    try {
      if (arr[x][y][z].isEmpty) return 0;
      return arr[x][y][z].last;
    }
    catch(e){
      Logger().e(x);
      Logger().e(y);
      Logger().e(z);
      Logger().e(arr);
    }
    return 0;
  }

  void popNumber({required List<List<List<List<double>>>> arr}) {
    if (getLastNumber(arr: arr) == 0) {
      return;
    }
    arr[x][y][z].removeLast();
  }

  void insertNumber(
      {required List<List<List<List<double>>>> arr, required double num}) {
    arr[x][y][z].add(num);
  }
}
