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

**Commit #1:**
```bash
git add .
git commit -m "Part 1: BusCard"
git push -u origin main


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
  card.owner = '<Martin mbita>';
  card.showInfo();

  // TODO 6: top up 100 RWF (must be refused), then top up 2000 RWF
  card.topUp(100);
  card.topUp(2000);

  // TODO 7: pay your bus fare 2 times, then call showInfo()
  card.pay(296);
  card.pay(296);
  card.showInfo();

  // TODO 8: create a StudentCard with your name, starting balance and discount
  StudentCard studentCard = StudentCard('<Martin mbita>', 1960, 16);

  // TODO 9: pay your bus fare with the student card, then call showInfo()
  studentCard.pay(296);
  studentCard.showInfo();
}



