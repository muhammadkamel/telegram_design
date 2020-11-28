import 'package:flutter/material.dart';
import 'package:telegram_design/ui/shared/export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String myEmail = prefs.getString('email');
  if (myEmail != null) {
    print('I AM: $myEmail, DONE HERE.');
  }
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // fontFamily: 'GE',
          ),
      home: myEmail == null ? Authenticate() : ChatRoom(),
      // routes: {
      //   '/': (_) => ViewWeeks(),
      // },
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Masrofna',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      home: SignUpScreen(),
      // routes: {
      //   '/': (_) => ViewWeeks(),
      // },
    );
  }
}
