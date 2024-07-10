import 'package:flutter/material.dart';

import '/model/profiles/profile.dart';
import '/model/persons/person.dart';

import '/app/work_areas/admin_role/admin_main_work_area.dart';

class EmployeeProfile extends Profile {
  EmployeeProfile(Person person) : super(person);

  @override
  String get role => 'Admin';

  @override
  StatelessWidget get workArea => AdminMainWorkArea();
}
