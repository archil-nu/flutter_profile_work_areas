import 'package:flutter_profile_work_areas/model/profiles/profile.dart';

class UserAccount {
  Profile _profile;
  String _username;
  String _password;

  UserAccount(Profile profile, String username, String password)
      : _profile = profile,
        _username = username,
        _password = password;

  String get personId => _profile.person.personId;
  String get userLoginName => _username;

  bool isMatch(String id) => _profile.person.personId == id;
  bool isValidUser(String username, String password) =>
      ((_username.toLowerCase() == username.toLowerCase()) &&
          (_password == password));

  String get role => _profile.role;
  Profile get associatedPersonProfile => _profile;

  set updatePassword(String newPassword) => _password = newPassword;
}
