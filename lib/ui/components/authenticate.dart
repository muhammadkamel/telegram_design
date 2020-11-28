import 'package:flutter/material.dart';
import 'package:telegram_design/ui/shared/export.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool _showSignIn = true;
  _toggleView() {
    setState(() {
      // _showSignIn = !_showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showSignIn) {
      return LoginScreen(toggle: _toggleView());
    } else {
      return SignUpScreen(toggle: _toggleView());
    }
  }
}
