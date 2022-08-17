import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:zerobalance/constants/size_config.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  User? user;
  var isloading = false;
  final auth = FirebaseAuth.instance;
  bool isLogin = true;
  String _userEmail = '';
  String _userPassword = '';
  final _formKey = GlobalKey<FormState>();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToggleSwitch(
          minWidth: 90.0,
          cornerRadius: 20.0,
          initialLabelIndex: index,
          activeFgColor: Colors.white,
          inactiveBgColor: Colors.transparent,
          inactiveFgColor: Colors.black,
          totalSwitches: 2,
          labels: ['Login', 'Sign Up'],
          activeBgColors: [
            [Colors.black],
            [Colors.black]
          ],
          onToggle: (ind) {
            index = ind!;
            isLogin = !isLogin;
            setState(() {});
          },
        ),
        Center(
            child: Card(
          elevation: 0,
          color: Colors.transparent,
          margin: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      cursorColor: Colors.black,
                      key: const ValueKey('email'),
                      onSaved: ((value) {
                        _userEmail = value!;
                      }),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please a valid email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          labelText: 'Email address',
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black)),
                    ),
                    
                    TextFormField(
                      key: const ValueKey('password'),
                      onSaved: (newValue) {
                        _userPassword = newValue!;
                      },
                      validator: (value) {
                        if (value!.isEmpty || value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Password',
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black)),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    isloading
                        ? const CircularProgressIndicator()
                        : Container(
                            width: SizeConfig.screenWidth * 0.9,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black),
                              child: Text(isLogin ? 'Login' : 'Sign Up'),
                              onPressed: () {
                                _trySubmit();
                              },
                            ),
                          ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.9,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white.withOpacity(0.4),
                            elevation: 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Image.asset('assets/images/googleLogo.png'),
                            ),
                            const Text(
                              'Continue with Google',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        onPressed: () async {
                          await signUp();

                        },
                      ),
                    ),
                  ],
                )),
          ),
        )),
      ],
    );
  }

  _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      submitForm( _userPassword, _userEmail.trim(), isLogin, context);
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

  void submitForm( String password, String email, bool isLogin,
      BuildContext ctx) async {
    try {
      setState(() {
        isloading = true;
      });
      if (isLogin) {
        var result = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        var user = result.user;
        print(user);
      } else {
        var result = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        var user = result.user;
        print(user);
      }
    } catch (e) {
      setState(() {
        isloading = false;
      });
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  Future<void> signUp() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      await googleSignIn.disconnect();
    } catch (e) {
      print(e);
    }
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      UserCredential result = await auth.signInWithCredential(authCredential);
      user = result.user;

      // Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
    }
  }
}
