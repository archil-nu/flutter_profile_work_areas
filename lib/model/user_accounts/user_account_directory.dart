import 'package:flutter_profile_work_areas/model/user_accounts/user_account.dart';
import 'package:flutter_profile_work_areas/model/profiles/profile.dart';

class UserAccountDirectory {
  final List<UserAccount> _userAccounts =
      List<UserAccount>.empty(growable: true);

  UserAccount newUserAccount(
      Profile profile, String username, String password) {
    UserAccount newUserAccount = UserAccount(profile, username, password);
    _userAccounts.add(newUserAccount);
    return newUserAccount;
  }

  UserAccount? findUserAccount(String id) {
    for (UserAccount userAccount in _userAccounts) {
      if (userAccount.isMatch(id)) return userAccount;
    }
    return null;
  }

  UserAccount? authenticate(String username, String password) {
    for (UserAccount userAccount in _userAccounts) {
      if (userAccount.isValidUser(username, password)) {
        return userAccount;
      }
    }
    return null;
  }

  List<UserAccount> get userAccounts => _userAccounts.toList(growable: false);
}
