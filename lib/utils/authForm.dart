import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm({Key? key,})
      : super(key: key);


  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {

  
  var isloading = false;
  final _auth = FirebaseAuth.instance;

  bool _isLogin = true;
  String _userEmail = '';
  String _userPassword = '';
  String _userName = '';
  final _formKey = GlobalKey<FormState>();

  _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      submitForm(
          _userName, _userPassword, _userEmail.trim(), _isLogin,  context);
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  key: ValueKey('email'),
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
                  decoration: InputDecoration(labelText: 'Email address'),
                ),
                _isLogin == false
                    ? TextFormField(
                        key: ValueKey('username'),
                        onSaved: (newValue) {
                          _userName = newValue!;
                        },
                        validator: (value) {
                          if (value!.isEmpty || value.length < 6) {
                            return 'Username must be at least 6 characters';
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: 'Username'),
                      )
                    : Container(),
                TextFormField(
                  key: ValueKey('password'),
                  onSaved: (newValue) {
                    _userPassword = newValue!;
                  },
                  validator: (value) {
                    if (value!.isEmpty || value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(height: 16),
                isloading
                    ? CircularProgressIndicator()
                    : RaisedButton(
                        child: Text(_isLogin ? 'Sign In' : 'Sign Up'),
                        onPressed: () {
                          _trySubmit();
                        },
                      ),
                SizedBox(height: 16),
                FlatButton(
                  child: Text(_isLogin
                      ? 'Create an Account'
                      : 'Have an Account? Sign In'),
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  },
                ),
              ],
            )),
      ),
    ));
  }

    void submitForm(String username, String password, String email, bool isLogin,
       BuildContext ctx) async {
    try {
      setState(() {
        isloading = true;
      });
      if (isLogin) {
        var result = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        var user = result.user;
        print(user);
      } else {
        var result = await _auth.createUserWithEmailAndPassword(
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
}
