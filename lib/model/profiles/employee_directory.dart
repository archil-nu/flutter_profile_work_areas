import 'package:flutter_profile_work_areas/model/profiles/employee_profile.dart';
import 'package:flutter_profile_work_areas/model/persons/person.dart';

class EmployeeDirectory {
  final List<EmployeeProfile> _employees =
      List<EmployeeProfile>.empty(growable: true);

  EmployeeProfile newEmployee(Person person) {
    EmployeeProfile newEmployee = EmployeeProfile(person);
    _employees.add(newEmployee);
    return newEmployee;
  }

  EmployeeProfile? findEmployee(String id) {
    for (EmployeeProfile employeeProfile in _employees) {
      if (employeeProfile.isMatch(id)) return employeeProfile;
    }
    return null;
  }

  List<EmployeeProfile> get employees => _employees.toList(growable: false);
}
