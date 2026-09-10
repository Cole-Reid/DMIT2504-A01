import "dart:io";

double calculateArea(double length, double width, double height) {
  return 2 * (
    (length * width) + (length * height) + (width * height)
  );
}

double calculateVolume(double length, double width, double height) {
  return length * width * height;
}

void main() {
  print("Gimme a length, width, and height for a rectangular prism");
  // I need to a) take in user input, and b) immediately coerce that to a double
  // because terminal input shows up as a string
  double length = double.parse(stdin.readLineSync()!);
  double width  = double.parse(stdin.readLineSync()!);
  double height = double.parse(stdin.readLineSync()!);

  print('Surface Area: ${calculateArea(length, width, height)}');
  print('Volume: ${calculateVolume(length, width, height)}');
}
