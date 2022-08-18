import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zerobalance/firebase_options.dart';
import 'package:zerobalance/utils/initializer.dart';

import 'utils/connectivityService.dart';

final connectionProvider =
    StreamProvider.autoDispose((ref) => Connectivity().onConnectivityChanged);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await FlutterDisplayMode.setHighRefreshRate();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InitializerWidget(),
    );
  }
}
