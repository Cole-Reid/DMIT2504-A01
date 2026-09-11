// inputs? - two user inputs: number of values and their upper limit
// outputs? - 

// 1. we're running this directly as a program, so I need a main()
// 2. I need to handle CLI user inputs & ouputs, so I need the dart:90 module
// 3. I need some sort of function that returns a List<int> (or similar)
// 4. Somehow, I need to make sure that doesn't have duplications

import 'dart:io';
import 'dart:math';

void main() {
  // print is equivalent to stdout.writeIn and also doens't require an imported module
  print("Please enter how many lotto numbers are in the series");
  int count = int.parse(stdin.readLineSync()!); // tells compiler "trust me this won't be null" (not best practice)

  print("What is the largest lotto number (inclusive)?");
  int largestNum = int.parse(stdin.readLineSync()!);

  // 3. number
  List<int> lottoNumbers = List.filled(count, 0);
  Random rng = Random();

  for (int i = 0; i < count; i++) {

    int value = rng.nextInt(largestNum) + 1;

    if (lottoNumbers.contains(value)) {
      i--;
    } else {
      lottoNumbers[i] = value;
    }

    lottoNumbers[i] = value;
  }

  print(lottoNumbers.join(' '));
}