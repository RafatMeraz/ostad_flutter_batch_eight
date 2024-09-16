
import 'human.dart';

void main() {
  Human rahim = Human();

  Human karim = Student();
  Human galib = SoftwareEngineer();

  galib.moving();

  if (galib is SoftwareEngineer) {
    galib.coding();
  }
  if (karim is Student) {
    karim.joiningClasses();
  }

}