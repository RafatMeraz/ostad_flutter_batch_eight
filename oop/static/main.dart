import 'bank_account.dart';
import 'calculator.dart';

void main() {
  print(BankAccount.bankName);
  print(BankAccount.bankName);
  print(BankAccount.bankName);
  print(BankAccount.bankName);

  BankAccount.getMessageFromBank();

  BankAccount account = BankAccount();

  Calculator.subtract(1, 4);
  Calculator.add(1, 4);
}