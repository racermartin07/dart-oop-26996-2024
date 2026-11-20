class BusCard {
  String _owner = '';
  int _balance = 0;

  // Constructor (done for you)
  BusCard(String owner, int balance) {
    _owner = owner;
    _balance = balance;
  }

  // EXAMPLE: getter for owner (done for you)
  String get owner {
    return _owner;
  }

  // TODO 1: write a getter for balance
  int get balance {
    return _balance;
  }

  // EXAMPLE: setter for owner, with a rule (done for you)
  set owner(String newName) {
    if (newName.length < 3) {
      print('Error: name too short');
    } else {
      _owner = newName;
    }
  }

  // EXAMPLE: a method (done for you)
  void showInfo() {
    print('Owner: $_owner | Balance: $_balance RWF');
  }

  // TODO 2: write a method topUp (int amount)
  void topUp(int amount) {
    if (amount >= 500 && amount <= 50000) {
      _balance = _balance + amount;
      print('Topped up $amount RWF');
    } else {
      print('Error: top-up must be 500 to 50000 RWF');
    }
  }

  // TODO 3: write a method pay (int fare)
  void pay(int fare) {
    if (fare > _balance) {
      print('Card declined');
    } else {
      _balance = _balance - fare;
      print('Paid $fare RWF');
    }
  }
}
```[cite: 2, 3]

**Commit #1:**
```bash
git add .
git commit -m "Part 1: BusCard"
git push -u origin main
```[cite: 8]

---

#### Step 2: Parts 2 & 3 — `StudentCard` and `main()` (Commit #2)
Add `StudentCard` (completing TODO 4: `pay` override) and `main()` (completing TODO 5 to TODO 9 using your personal numbers: `1960` starting balance, `296` bus fare, `16` discount) to `main.dart`[cite: 1, 3, 4]. Replace `<Your Full Name>` with your actual full name[cite: 4].

```dart
class StudentCard extends BusCard {
  int _discount = 0;

  // Constructor (done for you)
  StudentCard(String owner, int balance, int discount) : super(owner, balance) {
    _discount = discount;
  }

  // EXAMPLE: override showInfo (done for you)
  @override
  void showInfo() {
    super.showInfo();
    print('Student card: $_discount% off');
  }

  // TODO 4: override pay (int fare)
  @override
  void pay(int fare) {
    int off = fare * _discount ~/ 100;
    print('Student discount: $off RWF');
    super.pay(fare - off);
  }
}

void main() {
  // My numbers: D=96, L=6
  // Starting balance = 1960 RWF, Bus fare = 296 RWF, Discount = 16%

  // EXAMPLE (done for you): create a card and test the setter
  BusCard card = BusCard('Ama', 1000);
  card.owner = 'Al';
  card.showInfo();

  // TODO 5: change the owner to your full name, then call showInfo()
  card.owner = '<Your Full Name>';
  card.showInfo();

  // TODO 6: top up 100 RWF (must be refused), then top up 2000 RWF
  card.topUp(100);
  card.topUp(2000);

  // TODO 7: pay your bus fare 2 times, then call showInfo()
  card.pay(296);
  card.pay(296);
  card.showInfo();

  // TODO 8: create a StudentCard with your name, starting balance and discount
  StudentCard studentCard = StudentCard('<Your Full Name>', 1960, 16);

  // TODO 9: pay your bus fare with the student card, then call showInfo()
  studentCard.pay(296);
  studentCard.showInfo();
}
```[cite: 1, 3, 4]

Run `dart run main.dart` and save the output for `README.md`[cite: 4, 8]. (With `1960` starting balance, `296` fare, and `16%` discount—where `296 * 16 ~/ 100 = 47`, so student pays `296 - 47 = 249` RWF—the balance after paying once is `1960 - 249 = 1711` RWF[cite: 1, 3, 4].)

**Commit #2:**
```bash
git add .
git commit -m "Part 2 and 3: StudentCard and main"
git push
```[cite: 8]

---

#### Step 3: Part 4 — `bug_hunt.dart` (Commit #3)
Fix the **5 bugs**, add the `battery` setter (`0` to `100`) without deleting `p.battery = 100;`, keep the valid line (`new Phone('Tecno', 50)`—in Dart `new` is optional/valid), and ensure `print(p.battery)` prints `100` (fixing `p.battery()` to `p.battery` since `battery` is a getter, not a method)[cite: 4, 5, 6].

```dart
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

**Commit #3:**
```bash
git add .
git commit -m "Part 4: bug hunt fixed"
git push
```[cite: 8]

---

#### Step 4: Part 5 — Prediction First (Commit #4)
Create `README.md` with your **Part 5 prediction and explanation** filled in **before** running the Part 5 code[cite: 7, 8]:
* `Bag a = Bag(); a.add();` -> `_items` becomes `1`[cite: 6, 7].
* `a.items = -5;` -> rejected by the setter (`value >= 0` is false), so `_items` stays `1` -> prints `1`[cite: 6, 7].
* `BigBag b = BigBag(); b.add(); b.add();` -> each `b.add()` calls `super.add()` twice (adding `2` per call), so two calls add `4` (`_items` becomes `4`)[cite: 6, 7].
* `b.items = b.items + 1;` -> adds `1`, making `_items` equal to `5` -> prints `5`[cite: 6, 7].

**Commit #4 (before running the Part 5 code):**
```bash
git add .
git commit -m "Part 5: prediction"
git push
```[cite: 7, 8]

---

#### Step 5: Run Part 5, Complete `README.md`, and Finalize (Commit #5)
Run the Part 5 program, verify your prediction (`1` and `5`—yes, right!), and fill out all sections of `README.md`[cite: 6, 7, 8, 9]:

```markdown
# Dart OOP Assignment: Kigali Bus Card

**Name:** <Your Full Name>
**Student ID:** 26996

## My numbers
D = 96
L = 6
Starting balance = 1960 RWF
Bus fare = 296 RWF
Student discount = 16%

## Output of main.dart
Owner: Ama | Balance: 1000 RWF
Owner: <Your Full Name> | Balance: 1000 RWF
Error: top-up must be 500 to 50000 RWF
Topped up 2000 RWF
Paid 296 RWF
Paid 296 RWF
Owner: <Your Full Name> | Balance: 2408 RWF
Student discount: 47 RWF
Paid 249 RWF
Owner: <Your Full Name> | Balance: 1711 RWF | Student card: 16% off

## Part 1: Why no setter for balance?
Leaving out a public setter for _balance protects the card balance from being overwritten directly with invalid or arbitrary values. Instead, changes go through controlled methods like topUp and pay that enforce business rules.

## Part 2: What does ~/ do?
`~/` is integer division (truncating division): it divides two numbers and drops any decimal/fractional remainder, returning an `int`. For example, `237 * 17 / 100` gives `40.29` (a `double`), while `237 * 17 ~/ 100` gives `40` (an `int`).

## Part 4: Bug table
| Bug | The line | Why it is wrong (your words) | Your fix |
| --- | --- | --- | --- |
| 1 | `String _brand;` and `int _battery;` in `Phone` | Non-nullable fields are not initialized before the constructor runs. | Initialize them with default values (`String _brand = ''; int _battery = 0;`). |
| 2 | `SmartPhone(String brand, int battery, String system) {` | Subclass constructor does not call `super(brand, battery)` to initialize the parent `Phone`. | Add `: super(brand, battery)` to the constructor initializer list. |
| 3 | `String system = '';` and `_system = system;` | The field is named `system` without an underscore, so `_system` is undefined. | Declare `String _system = '';` with a leading underscore. |
| 4 | `@override` on `void restart()` in `SmartPhone` | `Phone` has no `restart()` method, so `@override` is invalid. | Remove `@override` from `restart()`. |
| 5 | `print(p.battery());` and missing `battery` setter | `battery` is a getter (not a method), and there is no setter for `p.battery = 100;`. | Change `p.battery()` to `p.battery` and add `set battery(int value)` allowing `0` to `100`. |
| Not a bug | `Phone p = new Phone('Tecno', 50);` | Dart allows `new` when instantiating a class, so calling the `Phone` constructor this way is valid. | (none) |

## Part 5
My prediction:
It will print `1` and then `5`. `a.add()` sets `_items` to `1`, `a.items = -5` is ignored because `-5` is not `>= 0`, so `print(a.items)` prints `1`. Then each `b.add()` calls `super.add()` twice (adding 2), so two calls add 4, and `b.items = b.items + 1` adds 1 more to make `5`.

Real output:
1
5

Was I right?
Yes, my prediction matched the real output.
```[cite: 1, 2, 3, 4, 5, 6, 7, 8, 9]

**Commit #5:**
```bash
git add .
git commit -m "Part 5: real output and README"
git push
```[cite: 8]

Finally, submit your GitHub repository link (`[https://github.com/](https://github.com/)<your-username>/dart-oop-26996`) on your class platform before the deadline (`19/11/2026 - 11:59`)[cite: 1, 7].