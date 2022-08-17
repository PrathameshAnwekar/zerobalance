import 'package:flutter/material.dart';
import 'package:zerobalance/utils/authForm.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/images/loginScreen.png',
                    )),
              ),
            ),
            Column(children: [
              AuthForm()
            ],)
      ]),
    );
  }



}
