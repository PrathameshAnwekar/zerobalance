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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: Stack(children: [
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
              Expanded(flex: 10,child: Container()),
              Expanded(flex: 9, child: AuthForm()),
              Expanded(flex: 1,
                child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Text('Powered By  '),
                  Image.asset('assets/images/yesBank.png'),
                  Text('  &   '),
                  Image.asset('assets/images/RuPay.png'),
                ],),
              )
            ],
          )
        ]),
      ),
    );
  }
}
