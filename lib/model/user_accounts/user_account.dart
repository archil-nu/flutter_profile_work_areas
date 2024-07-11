import 'package:flutter/material.dart';

import '/model/profiles/profile.dart';

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
  StatelessWidget get workArea => _profile.workArea;
  Profile get associatedPersonProfile => _profile;
  String get fullname => _profile.person.personId;

  set updatePassword(String newPassword) => _password = newPassword;
}
