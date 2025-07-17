import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Account'), backgroundColor: Colors.green),
      body: Center(child: Text("Account Information Page")),
    );
  }
}
