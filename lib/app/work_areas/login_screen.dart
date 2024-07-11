import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '/app/main_app.dart';

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
      // Form reset
      username = '';
      password = '';
      formKey.currentState!.reset();

      if (loginUser != null) {
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
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Login error! Check you credentials and try again.'),
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(40),
          behavior: SnackBarBehavior.floating,
        ));
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

    var form = Padding(
        padding: EdgeInsets.all(40.0),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: username,
                  decoration: InputDecoration(
                      labelText: 'Username',
                      icon: Icon(Icons.person),
                      labelStyle: TextStyle(color: Colors.black),
                      iconColor: Colors.black),
                  onChanged: (value) => username = value,
                  autofocus: true,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Password',
                        icon: Icon(Icons.password),
                        labelStyle: TextStyle(color: Colors.black),
                        iconColor: Colors.black),
                    onChanged: (value) => password = value,
                    obscureText: true),
                SizedBox(height: 20.0),
              ],
            )));

    var logo = Padding(
        padding: EdgeInsets.symmetric(vertical: 40.0),
        child: Image.asset('assets/nu-logo-black.png'));

    var slogan = Text.rich(
        TextSpan(
          text: 'Education going ', // default text style
          children: <TextSpan>[
            TextSpan(
                text: 'digital', style: TextStyle(color: Colors.blue.shade800)),
          ],
        ),
        style: GoogleFonts.getFont('Kalam').copyWith(fontSize: 25.0));

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 153, 153),
        body: Center(
          child: ConstrainedBox(
              constraints: BoxConstraints.expand(width: 400.0),
              child: Column(children: [
                logo,
                slogan,
                form,
                actionButtons,
              ])),
        ));
  }
}
