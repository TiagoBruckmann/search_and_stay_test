// import dos domain
import 'package:search_and_stay/domain/entity/house.dart';

// import dos pacotes
import 'package:equatable/equatable.dart';

class HouseModel extends HouseEntity with EquatableMixin {

  HouseModel( int id, int active, String name, int? order ) : super(id, active, name, order: null);

  factory HouseModel.fromJson( dynamic json ) {
    return HouseModel(
      json["id"],
      json["active"],
      json["name"],
      json["order"],
    );
  }

}