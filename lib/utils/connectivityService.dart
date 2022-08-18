import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class ConnectivityService {
  Connectivity connectivity = Connectivity();
  bool hasConnection = false;
  ConnectivityResult? connectionMedium;
  StreamController<bool> connectionChangeController =
      StreamController.broadcast();
  Stream<bool> connectionChange() {
    return  connectionChangeController.stream;
  }

  ConnectivityService() {
    checkInternetConnection();
  }
  Future<bool> checkInternetConnection() async {
    bool previousConnection = hasConnection;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }
    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }
    return hasConnection;
  }
}
