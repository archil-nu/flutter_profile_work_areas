import 'package:flutter/material.dart';

import '/model/profiles/profile.dart';
import '/model/persons/person.dart';

import '/app/work_areas/student_role/student_main_work_area.dart';

class StudentProfile extends Profile {
  StudentProfile(Person person) : super(person);

  @override
  String get role => 'Student';

  @override
  bool isMatch(String id) => person.personId == id;

  @override
  StatelessWidget get workArea => StudentMainWorkArea();
}
