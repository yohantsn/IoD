# IoD - Dependency Injection

https://codecov.io/github/yohantsn/IoD/settings/badge



The objective of this package is provide a simple way to do the Dependency Injection.

## How to use
### Register
The first you need register an instance of the object, for example:
```
  void main() {
    IoD.register<IPersistence>(Persistence());
    runApp(const MyApp());
  }
```
To clarify, the IPersistence is just example of an interface, like this bellow:
```
  abstract class IPersistence {
    String read();
    void write(String text);
  }
```

The Class Persistence is a implementation of a interface IPersistence.

### Read Instance

To get the instance you need to use the method read, like that:
```
    final persistence = IoD.read<IPersistence>();
```
