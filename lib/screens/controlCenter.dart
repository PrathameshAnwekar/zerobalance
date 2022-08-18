import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zerobalance/constants/size_config.dart';
import 'package:zerobalance/screens/loginScreen.dart';

class ControlCenterScreen extends StatelessWidget {
  const ControlCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0.5,
          backgroundColor: Colors.white,
          title: Text(
            'Control Center',
            style: TextStyle(color: Colors.black),
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                ))
          ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: StaggeredGrid.count(
                axisDirection: AxisDirection.down,
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                children: const [
                  SettingsCard(
                    value: 1,
                    title: 'Notifications',
                    icon: Icons.notifications, hm: 0.15,
                  ),
                  SettingsCard(
                      value: 0,
                      title: 'Bank Account',
                      icon: Icons.account_balance, hm: 0.12,),
                  SettingsCard(
                    hm: 0.20,
                    value: 0,
                    title: 'Password',
                    icon: Icons.security,
                  ),
                  SettingsCard(
                    hm: 0.18,
                    value: 0,
                    title: 'Refer & Earn',
                    icon: Icons.emoji_people_outlined,
                  ),
                  SettingsCard(
                    hm: 0.16,
                    value: 0,
                    title: 'Privacy policy',
                    icon: Icons.lock,
                  ),
                  SettingsCard(
                    hm: 0.17,
                    value: 0,
                    title: 'Log out',
                    icon: Icons.logout,
                  ),
                  SettingsCard(
                    hm: 0.12,
                      value: 0,
                      title: 'Terms and Conditions',
                      icon: Icons.settings),
                      Text('Randomised sizes for demo (Log out is functional)')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    Key? key,
    required this.value,
    required this.title,
    required this.icon,required this.hm,
  }) : super(key: key);
  final value;
  final title;
  final icon;
  final hm;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ///TODO: implement onTap properly later
        if (title == 'Log out') {
          FirebaseAuth.instance.signOut();
          GoogleSignIn().signOut();

          Navigator.of(context).pop();

          ///temp measure, can cause bugs
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: SizeConfig.screenWidth * 0.4,
        height: (SizeConfig.screenHeight * hm) ,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(flex: 3,
                child: Icon(
                      icon,
                      size: 40,
                ),
              ),
              title == 'Notifications' ? Expanded(flex: 1, child: Text('2 new')) :Container(),
              Expanded(flex: 1, child: Text(title, style: TextStyle(fontWeight: FontWeight.bold),))
            ]),
        ),
      ),
    );
  }
}
