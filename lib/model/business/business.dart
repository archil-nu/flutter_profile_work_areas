import 'package:flutter_profile_work_areas/model/user_accounts/user_account_directory.dart';
import 'package:flutter_profile_work_areas/model/persons/person_directory.dart';

class Business {
  String _name;
  PersonDirectory _personDirectory = PersonDirectory();
  // EmployeeDirectory _employeeDirectory;
  // StudentDirectory _studentDirectory;
  UserAccountDirectory _userAccountDirectory = UserAccountDirectory();

  Business(String name) : _name = name;

  String get name => _name;
  PersonDirectory get personDirectory => _personDirectory;
  UserAccountDirectory get userAccountDirectory => _userAccountDirectory;

  // public EmployeeDirectory getEmployeeDirectory() {
  //     return employeedirectory;
  // }

  // public StudentDirectory getStudentDirectory(){
  //     return studentdirectory;
  // }
}
