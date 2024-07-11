import 'package:flutter/material.dart';
import '/app/utils/app_bar_styled.dart';

class NotImplemented extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyled('Not implemented'),
        body: Center(
          child: Text('This page is not yet implemented!'),
        ));
  }
}
