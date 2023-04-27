// imports nativos
import 'dart:convert';

// import dos domain
import 'package:search_and_stay/domain/source/local/injection/injection.dart';

// import dos data
import 'package:search_and_stay/data/exceptions/exceptions.dart';
import 'package:search_and_stay/data/helpers/communication.dart';
import 'package:search_and_stay/data/models/house_model.dart';

// import dos pacotes
import 'package:http/http.dart' as http;

abstract class HouseRemoteDatasource {

  Future<List<HouseModel>> getHouses();
  Future<HouseModel> getDetail( String id );
  Future<HouseModel> createHouse( Map<String, dynamic> json );
  Future<HouseModel> updateHouse( Map<String, dynamic> json );
  Future<HouseModel> deleteHouse( String id );

}

class HouseRemoteDatasourceImpl implements HouseRemoteDatasource {
  final http.Client client;
  HouseRemoteDatasourceImpl( this.client );

  @override
  Future<List<HouseModel>> getHouses() async {

    final Uri url = Uri.https(apiUrl);
    final response = await client.get(
      url,
      headers: DefaultCommunication.defaultHeader,
    );

    if ( response.statusCode != 200 ) {
      throw ServerExceptions();
    }

    final body = jsonDecode(response.body);
    List<HouseModel> listHouse = [];

    if ( body["success"] == true ) {
      for ( final data in body["data"]["entities"] ) {
        print("data => $data");
        listHouse.add(HouseModel.fromJson(data));
      }
    }

    return listHouse;
  }

  @override
  Future<HouseModel> getDetail( String id ) async {

    final Uri url = Uri.https(apiUrl, id);
    final response = await client.get(
      url,
      headers: DefaultCommunication.defaultHeader,
    );

    if ( response.statusCode != 200 ) {
      throw ServerExceptions();
    }

    final body = jsonDecode(response.body);
    if ( body["success"] == false ) {
      throw ServerExceptions();
    }

    HouseModel houseModel = HouseModel.fromJson(body["data"]);
    return houseModel;
  }

  @override
  Future<HouseModel> createHouse( Map<String, dynamic> json ) async {
    final Uri url = Uri.https(apiUrl);
    final response = await client.post(
      url,
      headers: DefaultCommunication.defaultHeader,
      body: json,
    );

    if ( response.statusCode != 200 ) {
      throw ServerExceptions();
    }

    final body = jsonDecode(response.body);
    if ( body["success"] == false ) {
      throw ServerExceptions();
    }

    HouseModel houseModel = HouseModel.fromJson(body["data"]);
    return houseModel;
  }

  @override
  Future<HouseModel> updateHouse( Map<String, dynamic> json ) async {
    final Uri url = Uri.https(apiUrl);
    final response = await client.put(
      url,
      headers: DefaultCommunication.defaultHeader,
      body: json,
    );

    if ( response.statusCode != 200 ) {
      throw ServerExceptions();
    }

    final body = jsonDecode(response.body);
    if ( body["success"] == false ) {
      throw ServerExceptions();
    }

    HouseModel houseModel = HouseModel.fromJson(body["data"]);
    return houseModel;
  }

  @override
  Future<HouseModel> deleteHouse( String id ) async {
    final Uri url = Uri.https(apiUrl, id);
    final response = await client.delete(
      url,
      headers: DefaultCommunication.defaultHeader,
    );

    if ( response.statusCode != 200 ) {
      throw ServerExceptions();
    }

    final body = jsonDecode(response.body);
    if ( body["success"] == false ) {
      throw ServerExceptions();
    }

    HouseModel houseModel = HouseModel.fromJson(body["data"]);
    return houseModel;
  }
}