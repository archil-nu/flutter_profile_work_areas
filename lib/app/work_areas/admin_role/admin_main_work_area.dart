import 'package:flutter/material.dart';
import '/app/work_areas/admin_role/manage_user_accounts_panel.dart';
import '/app/utils/not_implemented.dart';

class AdminMainWorkArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    var welcomeMessage =
        Expanded(child: Center(child: Text('Welcome to Admin Work Area')));

    var navigation = NavigationRail(
      extended: true,
      destinations: [
        //0
        NavigationRailDestination(
            icon: Icon(Icons.supervised_user_circle_rounded),
            label: Text('Administer User Accounts')),
        //1
        NavigationRailDestination(
            icon: Icon(Icons.people), label: Text('Register Persons')),
        //2
        NavigationRailDestination(
            icon: Icon(Icons.emoji_people), label: Text('Manage Faculty')),
        //3
        NavigationRailDestination(
            icon: Icon(Icons.school), label: Text('Manage Students')),
        //4
        NavigationRailDestination(
            icon: Icon(Icons.verified_user), label: Text('My Profile')),
        //5
        NavigationRailDestination(
            icon: Icon(Icons.logout), label: Text('Sign Out'))
      ],
      selectedIndex: null,
      onDestinationSelected: (newIndex) {
        switch (newIndex) {
          case 0:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ManageUserAccountsPage()));
          case 1:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => NotImplemented()));
          case 5:
            Navigator.pop(context);
          default:
        }
      },
      backgroundColor: colorScheme.surfaceContainerHigh,
    );

    return Scaffold(body: Row(children: [navigation, welcomeMessage]));
  }
}
