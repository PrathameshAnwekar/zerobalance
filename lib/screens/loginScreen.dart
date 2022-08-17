import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:zerobalance/constants/size_config.dart';
import 'package:zerobalance/utils/authForm.dart';
import 'package:zerobalance/constants/size_config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            height: SizeConfig.screenHeight,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/loginScreen.png',
                  )),
            ),
          ),
          Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.5),
              
              AuthForm(),
              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                Text('Powered By  '),
                Image.asset('assets/images/yesBank.png'),
                Text('  &   '),
                Image.asset('assets/images/RuPay.png'),
              ],)
            ],
          )
        ]),
      ),
    );
  }
}
