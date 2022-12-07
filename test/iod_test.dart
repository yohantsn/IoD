import 'package:flutter_test/flutter_test.dart';
import 'package:iod/iod.dart';

void main() {
  final testInjection = TestInjection();
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

  group("Test errors cases", () {
    test("Read without register case", () {
      expect(
        () => IoD.read<ITestInjection>(),
        throwsA(
          const TypeMatcher<IoDException>(),
        ),
      );
    });

    test("Remove without register case", () {
      expect(
        () => IoD.removeObject<ITestInjection>(),
        throwsA(
          const TypeMatcher<IoDException>(),
        ),
      );
    });

    test("Try register the same Object case", () {
      IoD.register<ITestInjection>(testInjection);
      expect(
        () => IoD.register<ITestInjection>(testInjection),
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
