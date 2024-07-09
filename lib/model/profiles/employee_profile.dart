import 'package:flutter_profile_work_areas/model/profiles/profile.dart';
import 'package:flutter_profile_work_areas/model/persons/person.dart';

class EmployeeProfile extends Profile {
  EmployeeProfile(Person person) : super(person);

  @override
  String get role => 'Admin';
}
