import 'package:flutter/material.dart';
import 'package:zerobalance/constants/size_config.dart';
import 'package:zerobalance/screens/controlCenter.dart';

AppBar customAppBar(BuildContext context) {
  return AppBar(
      toolbarHeight: SizeConfig.screenHeight * 0.1,
      backgroundColor: Colors.white,
      actions: [
        IconButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ControlCenterScreen())),
            icon: const Icon(
              Icons.grid_view_outlined,
              color: Colors.black,
              size: 30,
            )), SizedBox(width: 20,)
      ],
      leading:  Container(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/randomProfilePic.png'),
        ),
      ),
      elevation: 0.5,
      title: const Text.rich(TextSpan(
          text: 'Welcome back,\n',
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 15),
          children: [
            TextSpan(
                text: 'Ankur',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ])));
}
