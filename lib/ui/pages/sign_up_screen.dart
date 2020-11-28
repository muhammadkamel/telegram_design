import 'package:flutter/material.dart';
import 'package:telegram_design/ui/shared/export.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({this.toggle});
  final Function toggle;
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    Orientation _orientation = MediaQuery.of(context).orientation;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF3F2EF),
        body: SingleChildScrollView(
          child: Container(
            // color: Colors.greenAccent,
            width: _screenSize.width,
            height: _orientation == Orientation.portrait
                ? _screenSize.height
                : _screenSize.height * 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // color: Colors.red,
                  child: Text(
                    'Create a Masrof Account!',
                    style: TextStyle(fontSize: 22, fontFamily: 'Montserrat'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  color: Color(0xffF3F2EF),
                  // color: Colors.redAccent,
                  width: _screenSize.width,
                  // height: _orientation == Orientation.portrait
                  //     ? _screenSize.height * 0.61
                  //     : _screenSize.height,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      width: _orientation == Orientation.portrait
                          ? _screenSize.width * 0.90
                          : _screenSize.width * 0.55,
                      // height: _orientation == Orientation.portrait
                      //     ? _screenSize.height * 0.70
                      //     : _screenSize.height * 0.90,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      decoration: BoxDecoration(
                        color: Color(0xfffafafa),
                        // color: Colors.teal,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(22)),
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
                            SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: TextFormField(
                                validator: (val) {
                                  return val.isEmpty
                                      ? 'Please enter your name'
                                      : null;
                                },
                                controller: _fullNameController,
                                decoration: kInputDecoration.copyWith(
                                  hintText: 'Full Name',
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
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
                            _signUpBottom(),
                            SizedBox(height: 10),
                            _haveAccount(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Build Sign Up button
  Widget _signUpBottom() {
    return FlatButton(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(2200),
        ),
      ),
      onPressed: () async {
        _signUp();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        setState(() {
          prefs.setString('email', _emailController.text);
        });
      },
      color: Colors.blueAccent,
      child: Text(
        'Sign Up'.toUpperCase(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  // Sign Up method
  void _signUp() async {
    if (_formKey.currentState.validate()) {
      setState(() {});
    }
  }

  // Have an Account?
  Widget _haveAccount() {
    return OutlineButton(
      borderSide: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Authenticate(),
          ),
        );
      },
      child: Text(
        'Have an account? Login',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
