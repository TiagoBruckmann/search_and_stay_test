// import dos domains
import 'package:search_and_stay/domain/source/local/mobx/connection/connection.dart';

// import dos pacotes
import 'package:connectivity_plus/connectivity_plus.dart';

class SharedServices {

  bool validateConnection( ConnectionMobx connectionMobx ) {
    if ( connectionMobx.connectionStatus == ConnectivityResult.wifi || connectionMobx.connectionStatus == ConnectivityResult.mobile ) {
      return true;
    }
    return false;
  }

}