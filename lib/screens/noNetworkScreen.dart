import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zerobalance/constants/size_config.dart';

class NoNetworkScreen extends StatelessWidget {
  const NoNetworkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: 
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: SizeConfig.screenHeight,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/networkError.png',
                  )),
            ),
          ),
          Positioned(
            top: SizeConfig.screenHeight * 0.55,
            child: Text(
              'No Internet Connection!',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            top: SizeConfig.screenHeight * 0.78,
            child: Container(
              width: SizeConfig.screenWidth * 0.9,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                child: Text('Go Back'),
                onPressed: () {},
              ),
            ),
          ),
          Positioned(
            top: SizeConfig.screenHeight * 0.85,
            child: Container(
              width: SizeConfig.screenWidth * 0.9,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                child: Text('Visit out help center'),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
