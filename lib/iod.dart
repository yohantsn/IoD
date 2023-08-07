library iod;

class IoD {
  static final _cache = <Type, dynamic>{};
  static final IoD _injection = IoD._internal();

  factory IoD() {
    return _injection;
  }

  IoD._internal();

  ///Use this to get the instance of the object, Example:
  ///
  ///`final foo = IoD.read<IFoo>()`
  static T read<T>() {
    final instance = _cache[T];

    if (instance == null) {
      throw IoDException("You must create an instance of this object!");
    }

    return instance;
  }

  ///To be possible read a instance of a object, you need first register the Object, Example:
  ///
  ///`IoD.register<IFoo>(Foo())`
  static register<T>(T object) {
    if (_cache[T] != null) {
      throw IoDException("This object is already instantiated!");
    }
    _cache.addAll({T: object});
  }

  ///You can remove a instance using this mehtod, Example:
  ///
  ///`IoD.removeObject<IFoo>()`
  static removeObject<T>() {
    if (_cache[T] == null) {
      throw IoDException("You must create an instance of this object before to remove it!");
    }
    _cache.remove(T);
  }
}

class IoDException implements Exception {
  String cause;
  IoDException(this.cause);
}
