import 'package:neon_chat/neon_chat.dart';
import 'package:test/test.dart';

//TODO
void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });
}
