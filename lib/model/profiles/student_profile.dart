import 'package:flutter_profile_work_areas/model/profiles/profile.dart';
import 'package:flutter_profile_work_areas/model/persons/person.dart';

class StudentProfile extends Profile {
  StudentProfile(Person person) : super(person);

  @override
  String get role => 'Student';

  @override
  bool isMatch(String id) => person.personId == id;
}
