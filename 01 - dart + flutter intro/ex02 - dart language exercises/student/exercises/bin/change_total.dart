import 'dart:io';

double GetTotal(double pennies, double nickles, double dimes, double quarters, double loonies, double twoonies) {
  return (pennies * 0.01) + (nickles * 0.05) + (dimes * 0.1) + (quarters * 0.25) + (loonies) + (twoonies * 2);
}

void main() {
    print("Give me the number of pennies, nickles, dimes, quarters, loonies and twoonies to total");
  // I need to a) take in user input, and b) immediately coerce that to a double
  // because terminal input shows up as a string
  double pennies = double.parse(stdin.readLineSync()!);
  double nickles  = double.parse(stdin.readLineSync()!);
  double dimes = double.parse(stdin.readLineSync()!);
  double quarters = double.parse(stdin.readLineSync()!);
  double loonies = double.parse(stdin.readLineSync()!);
  double twoonies = double.parse(stdin.readLineSync()!);

  print('Total Change: ${GetTotal(pennies, nickles, dimes, quarters, loonies, twoonies)}');
}