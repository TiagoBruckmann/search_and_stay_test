// import dos domain
import 'package:search_and_stay/domain/repositories/house_repo.dart';
import 'package:search_and_stay/domain/failure/failure.dart';
import 'package:search_and_stay/domain/entity/house.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

class HouseUseCase {
  final HouseRepo houseRepo;
  HouseUseCase(this.houseRepo);

  Future<Either<Failure, List<HouseEntity>>> getHouses() {
    return houseRepo.getHouses();
  }

  Future<Either<Failure, HouseEntity>> getDetail( String id ) {
    return houseRepo.getDetail(id);
  }

  Future<Either<Failure, HouseEntity>> createHouse( Map<String, dynamic> json ) {
    return houseRepo.createHouse(json);
  }

  Future<Either<Failure, HouseEntity>> updateHouse( String id, Map<String, dynamic> json ) {
    return houseRepo.updateHouse(id, json);
  }

  Future<Either<Failure, HouseEntity>> deleteHouse( String id ) {
    return houseRepo.deleteHouse(id);
  }
}