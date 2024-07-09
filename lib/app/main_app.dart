import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_lab_2/app/screens/navigation_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MainAppState(),
        child: MaterialApp(
          title: "Lab 2",
          theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
          home: LoginScreen(),
        ));
  }
}

class MainAppState extends ChangeNotifier {
  Business business = ConfigureBusiness.initialize();

  // void newAccount(String accountNumber, String bankName, String routingNumber,
  //     int balance) {
  //   accountDirectory.newAccount(
  //       accountNumber, bankName, routingNumber, balance);
  //   notifyListeners();
  // }

  // Account? getAccount(int index) {
  //   return accountDirectory.getAccount(index);
  // }

  // void updateAccount(int index, String accountNumber, String bankName,
  //     String routingNumber, int balance) {
  //   Account? selectedAccount = accountDirectory.getAccount(index);
  //   selectedAccount?.accountNumber = accountNumber;
  //   selectedAccount?.bankName = bankName;
  //   selectedAccount?.routingNumber = routingNumber;
  //   selectedAccount?.balance = balance;
  //   notifyListeners();
  // }

  // void deleteAccount(int index) {
  //   accountDirectory.deleteAccount(index);
  //   notifyListeners();
  // }
}
