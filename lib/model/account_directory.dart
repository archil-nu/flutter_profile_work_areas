import 'package:flutter_profile_work_areas/model/account.dart';

class AccountDirectory {
  final List<Account> _accounts = List<Account>.empty(growable: true);

  Account newAccount(String accountNumber, String bankName,
      String routingNumber, int balance) {
    Account newAccount =
        Account(accountNumber, bankName, routingNumber, balance);
    _accounts.add(newAccount);
    return newAccount;
  }

  void deleteAccount(int index) {
    if ((index >= 0) && (index < accounts.length)) {
      _accounts.removeAt(index);
    }
  }

  Account? getAccount(int index) {
    if ((index >= 0) && (index < accounts.length)) {
      return _accounts.elementAt(index);
    }
    return null;
  }

  List<Account> get accounts => _accounts.toList(growable: false);
}
