import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '/app/main_app.dart';
import '../utils/alert_widget.dart';

import '/model/user_accounts/user_account.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenStateful();
}

class _LoginScreenStateful extends State<LoginScreen> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MainAppState>();
    Function authenticate = appState.business.userAccountDirectory.authenticate;
    final formKey = GlobalKey<FormState>();

    void handleLogin() {
      UserAccount? loginUser = authenticate(username, password);
      if (loginUser != null) {
        // Form reset
        username = '';
        password = '';
        formKey.currentState!.reset();

        // Success message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Successful login!'),
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(40),
          behavior: SnackBarBehavior.floating,
        ));

        // Find user's work area and navigate there
        var userWorkArea = loginUser.workArea;
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => userWorkArea));
      }
    }

    var actionButtons = Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.login),
              onPressed: handleLogin,
              label: Text('Login'),
            ),
          ],
        ));

    var formElements = Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: username,
              decoration: InputDecoration(
                  labelText: 'Username', icon: Icon(Icons.person)),
              onChanged: (value) => username = value,
              autofocus: true,
            ),
            SizedBox(height: 20.0),
            TextFormField(
                decoration: InputDecoration(
                    labelText: 'Password', icon: Icon(Icons.password)),
                onChanged: (value) => password = value,
                obscureText: true),
            SizedBox(height: 20.0),
            actionButtons,
          ],
        ));

    GoogleFonts.config.allowRuntimeFetching = true;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ConstrainedBox(
              constraints: BoxConstraints.expand(width: 400.0),
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.0),
                    child: Image.asset('assets/nu-logo.png')),
                Text('Education Going Digital',
                    style:
                        GoogleFonts.getFont('Kalam').copyWith(fontSize: 25.0)),
                Padding(padding: EdgeInsets.all(40.0), child: formElements),
              ])),
        ));
  }
}
