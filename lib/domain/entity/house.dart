// import dos pacotes
import 'package:equatable/equatable.dart';

class HouseEntity {

  final int id, active;
  final String name;
  final int? order;

  const HouseEntity( this.id, this.active, this.name, { this.order } );

  Map<String, dynamic> toMapCreate() {
    Map<String, dynamic> map = {
      "name": name,
      "active": active,
    };

    return map;
  }

  @override
  List<Object?> get props => [id, active, name, order];

  @override
  String toString() => name;
}