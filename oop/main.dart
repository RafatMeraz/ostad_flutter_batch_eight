import 'abstraction.dart';
import 'encapsulation.dart';

void main() {
  Student rahim = Student(university: 'DU', username: 'Rahim Khan');
  print(rahim.username);
  print(rahim.showResult());

  BankAccount myAccount = BankAccount(
    userName: 'Rahman Mia',
    address: 'Banani, Dhaka',
  );

  myAccount.deposit(3400000);
  myAccount.deposit(3400000);
  myAccount.deposit(3400000);
  myAccount.deposit(3400000);
  print(myAccount.getBalance());
  myAccount.credit(230);
  print(myAccount.getBalance());
  myAccount.credit(230034093403490);
  print(myAccount.getBalance());
  print(myAccount.getTax());
}
