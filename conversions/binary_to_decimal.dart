import "dart:math" show pow;

import 'package:test/test.dart';

int binaryToDecimal(String binaryString) {
  binaryString = binaryString.trim();
  if (binaryString == null || binaryString == "") {
    throw Exception("An empty value was passed to the function");
  }
  bool isNegative = binaryString[0] == "-";
  if (isNegative) binaryString = binaryString.substring(1);
  int decimalValue = 0;
  for (int i = 0; i < binaryString.length; i++) {
    if ("01".contains(binaryString[i]) == false) {
      throw Exception("Non-binary value was passed to the function");
    } else {
      decimalValue +=
          pow(2, binaryString.length - i - 1) * int.parse((binaryString[i]));
    }
  }
  return isNegative ? -1 * decimalValue : decimalValue;
}

void main() {
  test('test case 1', () {
    expect(binaryToDecimal("-111"), -7);
  });
  test('test case 2', () {
    expect(binaryToDecimal("101011"), 43);
  });

  test('test case 3', () {
    try {
      binaryToDecimal("1a1");
    } catch (e) {
      expect('Exception: Non-binary value was passed to the function',
          e.toString());
    }
  });
}
