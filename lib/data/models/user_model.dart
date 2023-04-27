// import dos entity
import 'package:search_and_stay/domain/entity/user.dart';

// import dos pacotes
import 'package:equatable/equatable.dart';

class UserModel extends UserEntity with EquatableMixin {

  UserModel( String id, String name, String email ) : super(id, name, email);

  factory UserModel.fromJson( dynamic json ) {
    return UserModel(
      json["uid"],
      json["name"],
      json["mail"],
    );
  }

}