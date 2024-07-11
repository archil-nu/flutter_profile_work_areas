import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/app/main_app.dart';
import '/app/utils/app_bar_styled.dart';

import '/model/user_accounts/user_account.dart';

// import '/app/screens/update_account_screen.dart';

class ManageUserAccountsPage extends StatefulWidget {
  @override
  State<ManageUserAccountsPage> createState() =>
      _ManageUserAccountsPageStateful();
}

class _ManageUserAccountsPageStateful extends State<ManageUserAccountsPage> {
  int selectedRow = -1;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MainAppState>();

    void handleViewDetails() {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (BuildContext context) =>
      //               ViewUserAccountPage(selectedRow)));
    }

    void handleDelete() {
      //  appState.business.userAccountDirectory.(selectedRow);
      selectedRow = -1;
    }

    List<UserAccount> userAccounts =
        appState.business.userAccountDirectory.userAccounts;

    var columns = [
      DataColumn(label: Text('Full name')),
      DataColumn(label: Text('Username')),
      DataColumn(label: Text('Role')),
      DataColumn(label: Text('')),
    ];

    var rows = List<DataRow>.generate(
        userAccounts.length,
        (int index) => DataRow(
            selected: selectedRow == index,
            cells: [
              DataCell(Text(userAccounts.elementAt(index).fullname)),
              DataCell(Text(userAccounts.elementAt(index).userLoginName)),
              DataCell(Text(userAccounts.elementAt(index).role)),
              DataCell(Text('')),
            ],
            onSelectChanged: (selected) =>
                setState(() => selectedRow = (selected ?? false) ? index : -1)),
        growable: true);

    var dataTable = ConstrainedBox(
        constraints: const BoxConstraints(minWidth: double.infinity),
        child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20.0),
            child: DataTable(
              columns: columns,
              rows: rows,
              showCheckboxColumn: false,
              border: TableBorder.all(borderRadius: BorderRadius.circular(5.0)),
            )));

    var actionButtons = Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.list),
              onPressed: (selectedRow == -1) ? null : handleViewDetails,
              label: Text('View details'),
            ),
            SizedBox(width: 10.0),
            ElevatedButton.icon(
              icon: Icon(Icons.delete),
              onPressed: (selectedRow == -1) ? null : handleDelete,
              label: Text('Delete'),
            ),
          ],
        ));

    var spacer = SizedBox(height: 10.0);

    return Scaffold(
      appBar: AppBarStyled('List of User Accounts'),
      body: Center(child: Column(children: [dataTable, spacer, actionButtons])),
    );
  }
}
