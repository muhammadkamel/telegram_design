import 'package:flutter/material.dart';
import 'package:telegram_design/ui/shared/export.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({@required this.toggle});
  final Function toggle;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    Orientation _orientation = MediaQuery.of(context).orientation;
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfff0f0f0),
        body: Container(
          alignment: Alignment.center,
          color: Color(0xfff0f0f0),
          width: _screenSize.width,
          height: _screenSize.height,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(22.0),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                width: _orientation == Orientation.portrait
                    ? _screenSize.width * 0.90
                    : _screenSize.width * 0.55,
                // height: _orientation == Orientation.portrait
                //     ? _screenSize.height * 0.60
                //     : _screenSize.height * 0.90,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                  color: Color(0xfffafafa),
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      color: Color(0xffe0e0e0),
                    )
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          validator: (val) {
                            return val.isEmpty
                                ? 'Please enter your Email'
                                : null;
                          },
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: kInputDecoration.copyWith(
                            hintText: 'Email',
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          validator: (val) {
                            return val.isEmpty
                                ? 'Please enter your Password'
                                : null;
                          },
                          controller: _passwordController,
                          decoration: kInputDecoration.copyWith(
                            hintText: 'Password',
                          ),
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: 30),
                      _signInBottom(),
                      SizedBox(height: 20),
                      Container(
                        alignment: Alignment.center,
                        // width: 700,
                        decoration: BoxDecoration(
                          // color: Colors.lightGreenAccent,
                          // border: Border.all(
                          //   width: 3,
                          //   color: Color(0xffe7e8ff),
                          // ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(22),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _backToSignUp(context),
                            _forgetPassword(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Build Sign In button
  Widget _signInBottom() {
    return FlatButton(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(2200),
        ),
      ),
      onPressed: () async {
        _signIn();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        setState(() {
          prefs.setString('email', _emailController.text);
        });
      },
      color: Colors.blueAccent,
      child: Text(
        'Login'.toUpperCase(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  // Sign Up method
  void _signIn() {
    if (_formKey.currentState.validate()) {
      setState(() {});
      showDialog(
          context: context,
          child: Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xfff0f0f0),
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
            ),
          ));
      Future.delayed(
        Duration(milliseconds: 2000),
      ).then((value) => {
            // Go to home page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                // builder: (_) => ViewWeeks(),
                builder: (_) => ChatRoom(),
              ),
            ),
          });
    }
  }
}

// Back to Sign Up screen
Widget _backToSignUp(BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  return Container(
    alignment: Alignment.center,
    // color: Colors.redAccent,
    // width: screenSize.width * 0.35,

    child: OutlineButton(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10.0),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SignUpScreen(),
            ));
      },
      borderSide: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(2200),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.arrow_back),
          Text(
            'Sign Up',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ],
      ),
    ),
  );
}

_forgetPassword() {
  return OutlineButton(
    onPressed: () {},
    borderSide: BorderSide.none,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(22),
    ),
    child: Text(
      'Forget password?',
      style: TextStyle(
        color: Colors.blueAccent,
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
    ),
  );
}
