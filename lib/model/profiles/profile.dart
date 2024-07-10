import '/model/persons/person.dart';

abstract class Profile {
  Person _person;
  Profile(Person person) : _person = person;

  String get role;

  Person get person => _person;

  bool isMatch(String id) => person.personId == id;
}
