import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zerobalance/constants/size_config.dart';

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
      body: Column(
        children: [
          SizedBox(height: 30,),
          Wrap(
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: const [
              
              SettingsCard(
                value: 1,
                title: 'Notifications',
                icon: Icons.notifications,
              ),
              SettingsCard(
                value: 0,
                title: 'Bank Account',
                icon: Icons.account_balance
              ),
              SettingsCard(
                value: 0,
                title: 'Password',
                icon: Icons.security,
              ),
              SettingsCard(
                value: 0,
                title: 'Refer & Earn',
                icon: Icons.emoji_people_outlined,
              ),
              SettingsCard(
                value: 0,
                title: 'Privacy policy',
                icon: Icons.lock,
              ),
                        SettingsCard(
                value: 0,
                title: 'Log out',
                icon: Icons.logout,
              ),
                        SettingsCard(
                value: 0,
                title: 'Terms and Conditions',
                icon: Icons.settings
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    Key? key,
    required this.value,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final value;
  final title;
  final icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: SizeConfig.screenWidth * 0.45,
      height: (SizeConfig.screenHeight * 0.15) + (value > 0 ? 20 : 0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(
           icon,
            size: 40,
          ),
          value > 0 ? Text('\n' + value.toString() + ' new') : Text('\n'),
          Text(title)
        ]),
      ),
    );
  }
}
