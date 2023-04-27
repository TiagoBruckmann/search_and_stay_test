import 'package:search_and_stay/domain/source/local/injection/injection.dart';

class DefaultCommunication {

  static Map<String, String> get defaultHeader {
    return {
      "content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }

}