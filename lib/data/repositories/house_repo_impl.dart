// import dos domain
import 'package:search_and_stay/domain/repositories/house_repo.dart';
import 'package:search_and_stay/domain/failure/failure.dart';

// import dos data
import 'package:search_and_stay/data/datasource/house_datasource.dart';
import 'package:search_and_stay/data/exceptions/exceptions.dart';
import 'package:search_and_stay/data/models/house_model.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

class HouseRepoImpl implements HouseRepo {
  final HouseRemoteDatasource houseRemoteDatasource;
  HouseRepoImpl(this.houseRemoteDatasource);

  @override
  Future<Either<Failure, List<HouseModel>>> getHouses() async {
    try {
      final result = await houseRemoteDatasource.getHouses();
      return right(result);
    } on ServerExceptions {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, HouseModel>> getDetail( String id ) async {
    try {
      final result = await houseRemoteDatasource.getDetail(id);
      return right(result);
    } on ServerExceptions {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, HouseModel>> createHouse( Map<String, dynamic> json ) async {
    try {
      final result = await houseRemoteDatasource.createHouse( json );
      return right(result);
    } on ServerExceptions {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, HouseModel>> updateHouse( String id, Map<String, dynamic> json ) async {
    try {
      final result = await houseRemoteDatasource.updateHouse(id, json);
      return right(result);
    } on ServerExceptions {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, HouseModel>> deleteHouse( String id ) async {
    try {
      final result = await houseRemoteDatasource.deleteHouse(id);
      return right(result);
    } on ServerExceptions {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }

}