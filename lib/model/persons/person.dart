class Person {
  String _id;

  Person(String id) : _id = id;

  String get personId => _id;

  bool isMatch(String id) => personId == id;
}
