import 'abstract-class.dart';
import 'interface.dart';

// abstraction vs interface vs implementation
void main() {
  Student rafi = Student();
  rafi.goingToAttendClass(); // interface

  Father father = Father();
  father.dressUp();

  Mother mother = Mother();
  mother.dressUp();
}