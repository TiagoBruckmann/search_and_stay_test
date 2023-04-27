// import dos domain
import 'package:search_and_stay/domain/repositories/authentication_repo.dart';
import 'package:search_and_stay/domain/failure/failure.dart';

// import dos data
import 'package:search_and_stay/data/datasource/authentication_datasource.dart';
import 'package:search_and_stay/data/exceptions/exceptions.dart';
import 'package:search_and_stay/data/models/user_model.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

class AuthenticationRepoImpl implements AuthenticationRepo {
  final AuthenticationRemoteDatasource authenticationRemoteDatasource;
  AuthenticationRepoImpl(this.authenticationRemoteDatasource);

  @override
  Future<Either<Failure, bool>> verifyConnection() async {
    try {
      final result = await authenticationRemoteDatasource.verifyConnection();
      return right(result);
    } on ServerExceptions {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> registerWithEmail(Map<String, dynamic> params) async {
    try {
      final result = await authenticationRemoteDatasource.registerWithEmail(params);
      return right(result);
    } on ServerExceptions {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> loginWithEmail(Map<String, dynamic> params) async {
    try {
      final result = await authenticationRemoteDatasource.loginWithEmail(params);
      return right(result);
    } on ServerExceptions {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> forgotPassword( String email ) async {
    try {
      final result = await authenticationRemoteDatasource.forgotPassword(email);
      return right(result);
    } on ServerExceptions {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }

}