import '/model/persons/person.dart';

class PersonDirectory {
  final List<Person> _persons = List<Person>.empty(growable: true);

  Person newPerson(String id) {
    Person newPerson = Person(id);
    _persons.add(newPerson);
    return newPerson;
  }

  Person? findPerson(String id) {
    for (Person person in _persons) {
      if (person.isMatch(id)) return person;
    }
    return null;
  }

  List<Person> get persons => _persons.toList(growable: false);
}
