import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'work_areas/login_screen.dart';
import '/model/business/business.dart';
import '/model/business/configure_business.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MainAppState(),
        child: MaterialApp(
          title: "Profile Work Area",
          theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Color.fromARGB(255, 0, 153, 153),
                  primaryContainer: Color.fromARGB(255, 0, 153, 153))),
          home: LoginScreen(),
        ));
  }
}

class MainAppState extends ChangeNotifier {
  Business business = ConfigureBusiness.initialize();

  void notifyStateChanges() => notifyListeners();
}
