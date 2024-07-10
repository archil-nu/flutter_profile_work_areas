import '/model/profiles/profile.dart';
import '/model/persons/person.dart';

class EmployeeProfile extends Profile {
  EmployeeProfile(Person person) : super(person);

  @override
  String get role => 'Admin';
}
