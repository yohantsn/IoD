import 'package:example/data/persistence.dart';

class RegisterLogic {
  final IPersistence persistence;
  const RegisterLogic(this.persistence);

  void saveText(String text) => persistence.write(text);

  String readText() => persistence.read();
}
