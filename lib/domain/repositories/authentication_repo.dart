// import dos pacotes
import 'package:dartz/dartz.dart';

// import dos domain
import 'package:search_and_stay/domain/failure/failure.dart';
import 'package:search_and_stay/domain/entity/user.dart';

abstract class AuthenticationRepo {
  Future<Either<Failure, bool>> verifyConnection();
  Future<Either<Failure, UserEntity>> registerWithEmail( Map<String, dynamic> params );
  Future<Either<Failure, UserEntity>> loginWithEmail( Map<String, dynamic> params );
  Future<Either<Failure, bool>> forgotPassword( String email );
}