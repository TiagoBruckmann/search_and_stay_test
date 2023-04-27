// import dos pacotes
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {

  final String id, name, email;

  const UserEntity( this.id, this.name, this.email );

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "uid": id,
      "name" : name,
      "mail" : email,
    };

    return map;
  }

  @override
  List<Object?> get props => [id, name, email];

}