import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnection {
  static Future<void> check({
    required Function isAvailable,
    required Function noConnection,
  }) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      await isAvailable();
    } else {
      await noConnection();
    }
  }
}
