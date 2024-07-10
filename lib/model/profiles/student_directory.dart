import '/model/profiles/student_profile.dart';
import '/model/persons/person.dart';

class StudentDirectory {
  final List<StudentProfile> _students =
      List<StudentProfile>.empty(growable: true);

  StudentProfile newStudentProfile(Person person) {
    StudentProfile newStudent = StudentProfile(person);
    _students.add(newStudent);
    return newStudent;
  }

  StudentProfile? findStudent(String id) {
    for (StudentProfile studentProfile in _students) {
      if (studentProfile.isMatch(id)) return studentProfile;
    }
    return null;
  }

  List<StudentProfile> get students => _students.toList(growable: false);
}
