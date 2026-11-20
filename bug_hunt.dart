class Phone {
  String _brand = '';
  int _battery = 0;

  Phone(String brand, int battery) {
    _brand = brand;
    _battery = battery;
  }
  int get battery {
    return _battery;
  }

  set battery(int value) {
    if (value >= 0 && value <= 100) {
      _battery = value;
    } else {
      print('Error: battery must be 0 to 100');
    }
  }
}

class SmartPhone extends Phone {
  String _system = '';

  SmartPhone(String brand, int battery, String system)
      : super(brand, battery) {
    _system = system;
  }

  void restart() {
    print('Restarting $_system');
  }
}

void main() {
  Phone p = new Phone('Tecno', 50);
  p.battery = 100;
  print(p.battery);
}
```[cite: 4, 5, 6]

Save this inside your `dart-oop-26996` folder as `bug_hunt.dart`, then commit it with[cite: 7, 8]:

```bash
git add .
git commit -m "Part 4: bug hunt fixed"
git push
```[cite: 8]
