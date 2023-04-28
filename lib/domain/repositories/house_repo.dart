// import dos pacotes
import 'package:dartz/dartz.dart';

// import dos domain
import 'package:search_and_stay/domain/failure/failure.dart';
import 'package:search_and_stay/domain/entity/house.dart';

abstract class HouseRepo {
  Future<Either<Failure, List<HouseEntity>>> getHouses();
  Future<Either<Failure, HouseEntity>> getDetail( String id );
  Future<Either<Failure, HouseEntity>> createHouse( Map<String, dynamic> json );
  Future<Either<Failure, HouseEntity>> updateHouse( String id, Map<String, dynamic> json );
  Future<Either<Failure, HouseEntity>> deleteHouse( String id );
}