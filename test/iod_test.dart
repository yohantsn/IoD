import 'package:flutter_test/flutter_test.dart';
import 'package:iod/iod.dart';

void main() {
  final testInjection = TestInjection();
  final testInjection1 = TestInjection1();
  group("Test success cases", () {
    test("Simple case", () {
      IoD();
      IoD.register<ITestInjection>(testInjection);
      final testInjec = IoD.read<ITestInjection>();

      expect(testInjec, testInjection);

      expect(testInjec.getText("1"), "1");
    });

    test("Remove object case", () {
      final testInjec = IoD.read<ITestInjection>();

      expect(testInjec, testInjection);

      IoD.removeObject<ITestInjection>();

      expect(
        () => IoD.read<ITestInjection>(),
        throwsA(
          const TypeMatcher<IoDException>(),
        ),
      );
    });
  });

  group("Test with more objects cases", () {
    test("Simple case", () {
      IoD();
      IoD.register<ITestInjection>(testInjection);
      IoD.register<ITestInjection1>(testInjection1);
      final testInjec = IoD.read<ITestInjection>();
      final testInjec1 = IoD.read<ITestInjection1>();

      expect(testInjec, testInjection);
      expect(testInjec1, testInjection1);

      expect(testInjec.getText("1"), "1");
    });

    test("Remove object case", () {
      final testInjec1 = IoD.read<ITestInjection1>();

      expect(testInjec1, testInjection1);

      IoD.removeObject<ITestInjection1>();

      expect(
        () => IoD.read<ITestInjection1>(),
        throwsA(
          const TypeMatcher<IoDException>(),
        ),
      );
    });
  });

  group("Test errors cases", () {
    test("Read without register case", () {
      expect(
        () => IoD.read<ITestInjection1>(),
        throwsA(
          const TypeMatcher<IoDException>(),
        ),
      );
    });

    test("Remove without register case", () {
      expect(
        () => IoD.removeObject<ITestInjection1>(),
        throwsA(
          const TypeMatcher<IoDException>(),
        ),
      );
    });

    test("Try register the same Object case", () {
      expect(
        () => IoD.register<ITestInjection>(testInjection),
        throwsA(
          const TypeMatcher<IoDException>(),
        ),
      );
    });

    test("Try register the other Instance of the same object case", () {
      expect(
        () => IoD.register<ITestInjection>(TestInjection2()),
        throwsA(
          const TypeMatcher<IoDException>(),
        ),
      );
    });
  });
}

abstract class ITestInjection {
  String getText(String text);
}

class TestInjection implements ITestInjection {
  @override
  String getText(String text) {
    return text;
  }
}

abstract class ITestInjection1 {
  String getText(String text);
}

class TestInjection1 implements ITestInjection1 {
  @override
  String getText(String text) {
    return text;
  }
}

class TestInjection2 implements ITestInjection {
  @override
  String getText(String text) {
    return text;
  }
}
