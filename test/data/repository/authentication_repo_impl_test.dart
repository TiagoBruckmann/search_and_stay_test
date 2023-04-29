// imports nativos
import 'dart:io';

// import dos testes
import 'authentication_repo_impl_test.mocks.dart';

// import dos domain
import 'package:search_and_stay/domain/failure/failure.dart';

// import dos data
import 'package:search_and_stay/data/repositories/authentication_repo_impl.dart';
import 'package:search_and_stay/data/datasource/authentication_datasource.dart';
import 'package:search_and_stay/data/exceptions/exceptions.dart';
import 'package:search_and_stay/data/models/user_model.dart';

// import dos pacotes
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([MockSpec<AuthenticationRemoteSourceImpl>()])
void main() {

  group('AuthenticationRepoImpl', () {

    final mockAuthenticationRemoteSourceImpl = MockAuthenticationRemoteSourceImpl();
    final authenticationRepoImplTest = AuthenticationRepoImpl(mockAuthenticationRemoteSourceImpl);

    Map<String, dynamic> params = {
      "email": "tiagobruckmann@gmail.com",
      "password": "Abracadabra"
    };

    group('should return UserModel', () {

      test('when verify connection is called return a bool value', () async {

        when(
          mockAuthenticationRemoteSourceImpl.verifyConnection(),
        ).thenAnswer(
          (realInvocation) => Future.value(true),
        );

        final result = await authenticationRepoImplTest.verifyConnection();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, const Right<Failure, bool>(true));
        verify(mockAuthenticationRemoteSourceImpl.verifyConnection()).called(1);
        verifyNoMoreInteractions(mockAuthenticationRemoteSourceImpl);

      });

      test('when register is called return a UserModel', () async {

        params["name"] = "Tiago B";
        UserModel userModel = UserModel(
          "8ybaDsbAvyZDdsRahDBkzNiOee62",
          params["name"],
          params["email"],
        );

        when(
          mockAuthenticationRemoteSourceImpl.registerWithEmail(params),
        ).thenAnswer(
          (realInvocation) => Future.value(userModel),
        );

        final result = await authenticationRepoImplTest.registerWithEmail(params);

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, UserModel>(userModel));
        verify(mockAuthenticationRemoteSourceImpl.registerWithEmail(params)).called(1);
        verifyNoMoreInteractions(mockAuthenticationRemoteSourceImpl);

      });

      test('when login is called return a UserModel', () async {

        UserModel userModel = UserModel(
          "8ybaDsbAvyZDdsRahDBkzNiOee62",
          params["name"],
          params["email"],
        );

        when(
          mockAuthenticationRemoteSourceImpl.loginWithEmail(params),
        ).thenAnswer(
          (realInvocation) => Future.value(userModel),
        );

        final result = await authenticationRepoImplTest.loginWithEmail(params);

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, UserModel>(userModel));
        verify(mockAuthenticationRemoteSourceImpl.loginWithEmail(params)).called(1);
        verifyNoMoreInteractions(mockAuthenticationRemoteSourceImpl);

      });

      test('when forogot password is called return a bool value', () async {

        when(
          mockAuthenticationRemoteSourceImpl.forgotPassword(params["email"]),
        ).thenAnswer(
          (realInvocation) => Future.value(true),
        );

        final result = await authenticationRepoImplTest.forgotPassword(params["email"]);

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, const Right<Failure, bool>(true));
        verify(mockAuthenticationRemoteSourceImpl.forgotPassword(params["email"])).called(1);
        verifyNoMoreInteractions(mockAuthenticationRemoteSourceImpl);

      });

      test('when logout is called return a void', () async {

        void response;
        when(
          mockAuthenticationRemoteSourceImpl.logOut(),
        ).thenAnswer(
          (realInvocation) => Future.value(),
        );

        final result = await authenticationRepoImplTest.logOut();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, void>(response));
        verify(mockAuthenticationRemoteSourceImpl.logOut()).called(1);
        verifyNoMoreInteractions(mockAuthenticationRemoteSourceImpl);

      });
    });

    group('should return left with', () {

      // verify connection
      test('A serverFailure when a ServerException occurs on verify connection', () async {

        when(
          mockAuthenticationRemoteSourceImpl.verifyConnection(),
        ).thenThrow(ServerExceptions());

        final result = await authenticationRepoImplTest.verifyConnection();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, bool>(ServerFailure()));

      });

      test('A GeneralFailure on all another exceptions with getAuthentications', () async {

        when(
          mockAuthenticationRemoteSourceImpl.verifyConnection(),
        ).thenThrow(
          const SocketException("Test"),
        );

        final result = await authenticationRepoImplTest.verifyConnection();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, bool>(GeneralFailure()));

      });

      // register
      test('A serverFailure when a ServerException occurs on register', () async {

        params["name"] = "Tiago B";

        when(
          mockAuthenticationRemoteSourceImpl.registerWithEmail(params),
        ).thenThrow(ServerExceptions());

        final result = await authenticationRepoImplTest.registerWithEmail(params);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, UserModel>(ServerFailure()));

      });

      test('A GeneralFailure on all another exceptions with register', () async {

        params["name"] = "Tiago B";
        when(
          mockAuthenticationRemoteSourceImpl.registerWithEmail(params),
        ).thenThrow(
          const SocketException("Test"),
        );

        final result = await authenticationRepoImplTest.registerWithEmail(params);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, UserModel>(GeneralFailure()));

      });

      // login
      test('A serverFailure when a ServerException occurs on login', () async {

        when(
          mockAuthenticationRemoteSourceImpl.loginWithEmail(params),
        ).thenThrow(ServerExceptions());

        final result = await authenticationRepoImplTest.loginWithEmail(params);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, UserModel>(ServerFailure()));

      });

      test('A GeneralFailure on all another exceptions with login', () async {

        when(
          mockAuthenticationRemoteSourceImpl.loginWithEmail(params),
        ).thenThrow(
          const SocketException("Test"),
        );

        final result = await authenticationRepoImplTest.loginWithEmail(params);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, UserModel>(GeneralFailure()));

      });

      // forgot password
      test('A serverFailure when a ServerException occurs on forgot password', () async {

        when(
          mockAuthenticationRemoteSourceImpl.forgotPassword(params["email"]),
        ).thenThrow(ServerExceptions());

        final result = await authenticationRepoImplTest.forgotPassword(params["email"]);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, bool>(ServerFailure()));

      });

      test('A GeneralFailure on all another exceptions with forgot password', () async {

        when(
          mockAuthenticationRemoteSourceImpl.forgotPassword(params["email"]),
        ).thenThrow(
          const SocketException("Test"),
        );

        final result = await authenticationRepoImplTest.forgotPassword(params["email"]);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, bool>(GeneralFailure()));

      });

      // logout
      test('A serverFailure when a ServerException occurs on logOut', () async {

        when(
          mockAuthenticationRemoteSourceImpl.logOut(),
        ).thenThrow(ServerExceptions());

        final result = await authenticationRepoImplTest.logOut();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, void>(ServerFailure()));

      });

      test('A GeneralFailure on all another exceptions with logOut', () async {

        when(
          mockAuthenticationRemoteSourceImpl.logOut(),
        ).thenThrow(
          const SocketException("Test"),
        );

        final result = await authenticationRepoImplTest.logOut();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, void>(GeneralFailure()));

      });

    });

  });

}