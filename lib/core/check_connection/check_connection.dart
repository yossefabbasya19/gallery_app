import 'package:connectivity_plus/connectivity_plus.dart';

class CheckConnection {
  Future<bool> checkNetwork() async {
    List<ConnectivityResult> connectivity = await Connectivity()
        .checkConnectivity();
    if (connectivity.contains(ConnectivityResult.none)) {
      return false;
    } else {
      return true;
    }
  }
}