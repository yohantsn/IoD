abstract class IPersistence {
  String read();
  void write(String text);
}

class Persistence implements IPersistence {
  String _text = "";

  @override
  String read() {
    return _text;
  }

  @override
  void write(String text) {
    _text = text;
  }
}
