// import dos domain
import 'package:search_and_stay/domain/repositories/authentication_repo.dart';
import 'package:search_and_stay/domain/failure/failure.dart';
import 'package:search_and_stay/domain/entity/user.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

class AuthenticationUseCase {
  final AuthenticationRepo authenticationRepo;
  AuthenticationUseCase(this.authenticationRepo);

  Future<Either<Failure, bool>> verifyConnection() {
    return authenticationRepo.verifyConnection();
  }

  Future<Either<Failure, UserEntity>> registerWithEmail( Map<String, dynamic> params ) async {
    return authenticationRepo.registerWithEmail(params);
  }

  Future<Either<Failure, UserEntity>> loginWithEmail( Map<String, dynamic> params ) async {
    return authenticationRepo.loginWithEmail(params);
  }

  Future<Either<Failure, bool>> forgotPassword( String email ) async {
    return authenticationRepo.forgotPassword(email);
  }

}