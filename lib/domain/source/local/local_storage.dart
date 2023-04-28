// import dos pacotes
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  setCredential( String name, String credential ) async => await _storage.write(key: name, value: credential);

  getCredential( String credential ) async  => await _storage.read(key: credential);

  getAllCredentials() async => await _storage.readAll();

  void deleteOnlyOneCredential( String credential ) async => await _storage.delete(key: credential);

  void deleteAllCredentials() async => await _storage.deleteAll();

}