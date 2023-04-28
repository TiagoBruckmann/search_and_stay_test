// import dos pacotes
import 'package:equatable/equatable.dart';

class HouseEntity extends Equatable  {

  final int id, active;
  final String name;
  final int? order;

  const HouseEntity( this.id, this.active, this.name, { this.order } );

  @override
  String toString() => name;

  @override
  List<Object?> get props => [id, active, name, order];

}