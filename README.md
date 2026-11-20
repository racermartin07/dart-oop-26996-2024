# Dart OOP Assignment: Kigali Bus Card
**Name:** 
**Student ID:** 26996

## My numbers

D = 96
L = 6
Starting balance = 1960 RWF
Bus fare = 296 RWF
Student discount = 16%

## Output of main.dart

Owner: Ama | Balance: 1000 RWF
Owner:  | Balance: 1000 RWF
Error: top-up must be 500 to 50000 RWF
Topped up 2000 RWF
Paid 296 RWF
Paid 296 RWF
Owner:  | Balance: 2408 RWF
Student discount: 47 RWF
Paid 249 RWF
Owner:  | Balance: 1711 RWF | Student card: 16% off

## Part 1: Why no setter for balance?

Leaving out a public setter for `_balance` protects the card balance from being overwritten directly with arbitrary or negative numbers. Instead, changes must go through controlled methods like `topUp` and `pay` that enforce the bus card's rules.

## Part 2: What does \~/ do?

`~/` is integer (truncating) division: it divides two numbers and drops any decimal remainder, returning an `int`. For example, `237 * 17 / 100` evaluates to `40.29` (a `double`), while `237 * 17 ~/ 100` evaluates to `40` (an `int`).

## Part 4: Bug table

| Bug | The line | Why it is wrong (your words) | Your fix | 
| ----- | ----- | ----- | ----- | 
| 1 | `String _brand;` and `int _battery;` in `Phone` | Non-nullable fields must be initialized before the constructor body runs. | Give both fields initial values (`String _brand = ''; int _battery = 0;`). | 
| 2 | `SmartPhone(String brand, int battery, String system) {` | The child constructor does not pass `brand` and `battery` to the parent `Phone` constructor. | Add `: super(brand, battery)` to the constructor initializer list. | 
| 3 | `String system = '';` and `_system = system;` | The field is declared without an underscore (`system`), so `_system` does not exist. | Rename the field to `String _system = '';`. | 
| 4 | `@override` above `void restart()` in `SmartPhone` | `Phone` has no `restart()` method to override. | Remove the `@override` annotation. | 
| 5 | `print(p.battery());` and missing `battery` setter | `battery` is a getter, not a method, and `p.battery = 100;` requires a setter. | Change `p.battery()` to `p.battery` and add `set battery(int value)` accepting `0` to `100`. | 
| Not a bug | `Phone p = new Phone('Tecno', 50);` | In Dart, using the `new` keyword when instantiating a class is optional but completely valid. | (none) | 

## Part 5

My prediction:
It will print `1` and then `5`. `a.add()` sets `_items` to `1`, and `a.items = -5` is ignored because `-5` is less than `0`, so `print(a.items)` outputs `1`. For `b`, each `b.add()` calls `super.add()` twice (adding `2`), so two calls add `4`, and `b.items = b.items + 1` adds `1` more to print `5`.

Real output:
1
5

Was I right?
Yes, my prediction matched the real output.
