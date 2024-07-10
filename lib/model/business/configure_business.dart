import 'package:flutter_profile_work_areas/model/business/business.dart';
import 'package:flutter_profile_work_areas/model/persons/person.dart';
import 'package:flutter_profile_work_areas/model/persons/person_directory.dart';
import 'package:flutter_profile_work_areas/model/profiles/employee_profile.dart';
import 'package:flutter_profile_work_areas/model/profiles/employee_directory.dart';
import 'package:flutter_profile_work_areas/model/profiles/student_profile.dart';
import 'package:flutter_profile_work_areas/model/profiles/student_directory.dart';
import 'package:flutter_profile_work_areas/model/user_accounts/user_account.dart';
import 'package:flutter_profile_work_areas/model/user_accounts/user_account_directory.dart';

class ConfigureBusiness {
  static Business initialize() {
    Business business = new Business("Information Systems");

// Create Persons
    PersonDirectory personDirectory = business.personDirectory;
// person representing sales organization
    Person person001 = personDirectory.newPerson("John Smith");
    Person person002 = personDirectory.newPerson("Gina Montana");
    Person person003 = personDirectory.newPerson("Adam Rollen");

    Person person005 = personDirectory.newPerson("Jim Dellon");
    Person person006 = personDirectory.newPerson("Anna Shnider");
    Person person007 = personDirectory.newPerson("Laura Brown");
    Person person008 = personDirectory.newPerson("Jack While");
    Person person009 =
        personDirectory.newPerson("Fidelity"); //we use this as customer

// Create Admins to manage the business
    EmployeeDirectory employeedirectory = business.employeeDirectory;
    EmployeeProfile employeeprofile0 = employeedirectory.newEmployee(person001);

    StudentDirectory studentDirectory = business.studentDirectory;
    StudentProfile studentprofile0 =
        studentDirectory.newStudentProfile(person003);

// Create User accounts that link to specific profiles
    UserAccountDirectory uadirectory = business.userAccountDirectory;
    UserAccount ua3 =
        uadirectory.newUserAccount(employeeprofile0, "admin", "1234");

    /// order products for one of the customers and performed by a sales person
    UserAccount ua4 =
        uadirectory.newUserAccount(studentprofile0, "adam", "adam");

    /// order products for one of the customers and performed by a sales person

    return business;
  }
}
