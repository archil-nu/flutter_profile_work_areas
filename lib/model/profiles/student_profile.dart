import '/model/profiles/profile.dart';
import '/model/persons/person.dart';

class StudentProfile extends Profile {
  StudentProfile(Person person) : super(person);

  @override
  String get role => 'Student';

  @override
  bool isMatch(String id) => person.personId == id;
}
