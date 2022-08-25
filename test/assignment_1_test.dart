 import 'package:assignment_1/assignment_1.dart';
//import 'package:assignment_1/sol.dart';
import 'package:test/test.dart';

void main() {
  group("Stack<int>", () {
    final stack = Stack<int>();
    test('empty stack', () {
      expect(stack.isEmpty, true);
    });
    test('push and length', () {
      stack.push(1);
      stack.push(2);
      stack.push(3);
      stack.push(4);
      expect(stack.length, 4);
    });
    test('pop and top', () {
      final stack = Stack<int>();
      stack.push(1);
      stack.push(2);
      stack.push(3);
      stack.push(4);
      expect(stack.pop(), equals(4));
      expect(stack.pop(), equals(3));
      expect(stack.top(), equals(2));
      expect(stack.pop(), equals(2));
      expect(stack.pop(), equals(1));
    });
    test('throws error on popping empty', () {
      final stack = Stack<int>();
      expect(() => stack.pop(), throwsA(isA<Exception>()));
    });
  });
  group("Pancakehandler", () {
    final stack = PancakeHandler();

    test('push and length', () {
      stack.push(Pancake(1, true, 1));
      stack.push(Pancake(2, true, 2));
      stack.push(Pancake(3, true, 3));
      stack.push(Pancake(4, true, 4));
      expect(stack.length, 4);
    });
    test('pop and top', () {
      stack.push(Pancake(1, true, 1));
      stack.push(Pancake(2, true, 2));
      stack.push(Pancake(3, true, 3));
      stack.push(Pancake(4, true, 4));
      stack.push(Pancake(5, true, 5));
      stack.push(Pancake(6, true, 6));
      expect(stack.pop(), equals(Pancake(6, true, 6)));
      expect(stack.pop(3), equals(Pancake(3, true, 3)));
      expect(stack.top(), equals(Pancake(2, true, 2)));
      expect(stack.pop(), equals(Pancake(2, true, 2)));
    });
    test('throws error on popping empty', () {
      final stack = PancakeHandler();
      expect(() => stack.pop(), throwsA(isA<Exception>()));
    });
    test('remove set of pancakes', () {
      final stack = PancakeHandler();
      stack.push(Pancake(1, true, 1));
      stack.push(Pancake(2, true, 2));
      stack.push(Pancake(3, false, 3));
      stack.push(Pancake(4, false, 4));
      stack.push(Pancake(5, true, 5));
      stack.push(Pancake(6, true, 6));
      stack.push(Pancake(7, false, 7));
      expect(stack.remove(4, 6), equals(Pancake(5, true, 5)));
      expect(() => stack.remove(1, 2), throwsA(isA<Exception>()));
    });
  });
  group("Chef extension", () {
    late PancakeHandler stack; // = PancakeHandler();
    setUp(() {
      stack = PancakeHandler();
      stack.push(Pancake(1, true, 1));
      stack.push(Pancake(1, true, 2));
      stack.push(Pancake(3, false, 3));
      stack.push(Pancake(3, false, 4));
      stack.push(Pancake(5, true, 5));
      stack.push(Pancake(5, true, 6));
      stack.push(Pancake(7, false, 7));
    });
    test("Inspect", () {
      expect(stack.inspect((p) => p.serialNumber == p.weight), equals(3));
      expect(stack.pop(), equals(Pancake(7, false, 7)));
      expect(stack.remove(1, 2), equals(Pancake(3, false, 3)));
      expect(stack.top(), equals(Pancake(1, true, 1)));
      expect(stack.length, equals(1));
    });
    test("pop", () {
      stack.inspect((p) => p.serialNumber == p.weight);
      expect(stack.pop(), equals(Pancake(7, false, 7)));
    });
    test("remove", () {
      stack.inspect((p) => p.serialNumber == p.weight);
      stack.pop();
      expect(() => stack.remove(1, 2), throwsA(isA<Exception>()));
    });
    test("length", () {
      stack.inspect((p) => p.serialNumber == p.weight);
      stack.pop();
      stack.pop();
      expect(stack.length, equals(2));
    });
  });
}
