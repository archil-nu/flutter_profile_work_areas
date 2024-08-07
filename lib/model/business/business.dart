import '/model/user_accounts/user_account_directory.dart';
import '/model/persons/person_directory.dart';
import '/model/profiles/employee_directory.dart';
import '/model/profiles/student_directory.dart';

class Business {
  String _name;
  PersonDirectory _personDirectory = PersonDirectory();
  EmployeeDirectory _employeeDirectory = EmployeeDirectory();
  StudentDirectory _studentDirectory = StudentDirectory();
  UserAccountDirectory _userAccountDirectory = UserAccountDirectory();

  Business(String name) : _name = name;

  String get name => _name;
  PersonDirectory get personDirectory => _personDirectory;
  UserAccountDirectory get userAccountDirectory => _userAccountDirectory;
  EmployeeDirectory get employeeDirectory => _employeeDirectory;
  StudentDirectory get studentDirectory => _studentDirectory;
}
