// imports globais
import 'package:search_and_stay/session.dart';

class DefaultCommunication {

  static Future<Map<String, String>> get defaultHeader async {
    String token = await Session.localStorage.getCredential("token");
    return {
      "content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }

}