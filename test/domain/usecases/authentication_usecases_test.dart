// import dos testes
import 'authentication_usecases_test.mocks.dart';

// import dos domain
import 'package:search_and_stay/domain/usecases/authentication_usecase.dart';
import 'package:search_and_stay/domain/failure/failure.dart';
import 'package:search_and_stay/domain/entity/user.dart';

// import dos data
import 'package:search_and_stay/data/repositories/authentication_repo_impl.dart';
import 'package:search_and_stay/data/models/user_model.dart';

// import dos pacotes
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([MockSpec<AuthenticationRepoImpl>()])
void main() {

  group('AuthenticationUseCase', () {

    final mockAuthenticationRepoImpl = MockAuthenticationRepoImpl();
    final authenticationUseCaseTest = AuthenticationUseCase(mockAuthenticationRepoImpl);

    Map<String, dynamic> params = {
      "email": "tiagobruckmann@gmail.com",
      "password": "Abracadabra"
    };

    group('should return UserEntity', () {

      test('when AuthenticationRepoImpl verify connection return a bool value', () async {

        when(
          mockAuthenticationRepoImpl.verifyConnection(),
        ).thenAnswer(
          (realInvocation) => Future.value(
            const Right(true),
          ),
        );

        final result = await authenticationUseCaseTest.verifyConnection();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, const Right<Failure, bool>(true));
        verify(mockAuthenticationRepoImpl.verifyConnection()).called(1);

        verifyNoMoreInteractions(mockAuthenticationRepoImpl);

      });

      test('when AuthenticationRepoImpl register a new user return an UserEntity', () async {

        params["name"] = "Tiago B";

        UserModel userModel = UserModel(
          "8ybaDsbAvyZDdsRahDBkzNiOee62",
          params["name"],
          params["email"],
        );

        when(
          mockAuthenticationRepoImpl.registerWithEmail(params),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Right(userModel),
          ),
        );

        final result = await authenticationUseCaseTest.registerWithEmail(params);

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, UserEntity>(userModel));
        verify(mockAuthenticationRepoImpl.registerWithEmail(params)).called(1);

        verifyNoMoreInteractions(mockAuthenticationRepoImpl);

      });

      test('when AuthenticationRepoImpl login return an UserEntity', () async {

        UserModel userModel = UserModel(
          "8ybaDsbAvyZDdsRahDBkzNiOee62",
          params["name"],
          params["email"],
        );

        when(
          mockAuthenticationRepoImpl.loginWithEmail(params),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Right(userModel),
          ),
        );

        final result = await authenticationUseCaseTest.loginWithEmail(params);

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, UserEntity>(userModel));
        verify(mockAuthenticationRepoImpl.loginWithEmail(params)).called(1);

        verifyNoMoreInteractions(mockAuthenticationRepoImpl);

      });

      test('when AuthenticationRepoImpl forgot password return a bool value', () async {

        when(
          mockAuthenticationRepoImpl.forgotPassword(params["email"]),
        ).thenAnswer(
          (realInvocation) => Future.value(
            const Right(true),
          ),
        );

        final result = await authenticationUseCaseTest.forgotPassword(params["email"]);

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, const Right<Failure, bool>(true));
        verify(mockAuthenticationRepoImpl.forgotPassword(params["email"])).called(1);

        verifyNoMoreInteractions(mockAuthenticationRepoImpl);

      });

      test('when AuthenticationRepoImpl logOut return void', () async {

        void response;

        when(
          mockAuthenticationRepoImpl.logOut(),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Right(response),
          ),
        );

        final result = await authenticationUseCaseTest.logOut();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, void>(response));
        verify(mockAuthenticationRepoImpl.logOut()).called(1);

        verifyNoMoreInteractions(mockAuthenticationRepoImpl);

      });

    });

    group('should return left on verify connection with', () {

      test('a ServerFailure', () async {

        when(
          mockAuthenticationRepoImpl.verifyConnection(),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(ServerFailure()),
          ),
        );

        final result = await authenticationUseCaseTest.verifyConnection();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, bool>(ServerFailure()));
        verify(mockAuthenticationRepoImpl.verifyConnection()).called(1);
        verifyNoMoreInteractions(mockAuthenticationRepoImpl);

      });

      test('a GeneralFailure', () async {

        when(
          mockAuthenticationRepoImpl.verifyConnection(),
        ).thenAnswer(
              (realInvocation) => Future.value(
            Left(GeneralFailure()),
          ),
        );

        final result = await authenticationUseCaseTest.verifyConnection();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, bool>(GeneralFailure()));
        verify(mockAuthenticationRepoImpl.verifyConnection()).called(1);
        verifyNoMoreInteractions(mockAuthenticationRepoImpl);

      });

    });

    group('should return left on create account with', () {

      params["name"] = "Tiago B";

      test('a ServerFailure', () async {

        when(
          mockAuthenticationRepoImpl.registerWithEmail(params),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(ServerFailure()),
          ),
        );

        final result = await authenticationUseCaseTest.registerWithEmail(params);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, UserEntity>(ServerFailure()));
        verify(mockAuthenticationRepoImpl.registerWithEmail(params)).called(1);
        verifyNoMoreInteractions(mockAuthenticationRepoImpl);

      });

      test('a GeneralFailure', () async {

        when(
          mockAuthenticationRepoImpl.registerWithEmail(params),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(GeneralFailure()),
          ),
        );

        final result = await authenticationUseCaseTest.registerWithEmail(params);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, UserEntity>(GeneralFailure()));
        verify(mockAuthenticationRepoImpl.registerWithEmail(params)).called(1);
        verifyNoMoreInteractions(mockAuthenticationRepoImpl);

      });

    });

    group('should return left on login with', () {

      test('a ServerFailure', () async {

        when(
          mockAuthenticationRepoImpl.loginWithEmail(params),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(ServerFailure()),
          ),
        );

        final result = await authenticationUseCaseTest.loginWithEmail(params);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, UserEntity>(ServerFailure()));
        verify(mockAuthenticationRepoImpl.loginWithEmail(params)).called(1);
        verifyNoMoreInteractions(mockAuthenticationRepoImpl);

      });

      test('a GeneralFailure', () async {

        when(
          mockAuthenticationRepoImpl.loginWithEmail(params),
        ).thenAnswer(
              (realInvocation) => Future.value(
            Left(GeneralFailure()),
          ),
        );

        final result = await authenticationUseCaseTest.loginWithEmail(params);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, UserEntity>(GeneralFailure()));
        verify(mockAuthenticationRepoImpl.loginWithEmail(params)).called(1);
        verifyNoMoreInteractions(mockAuthenticationRepoImpl);

      });

    });

    group('should return left on forgot password with', () {

      test('a ServerFailure', () async {

        when(
          mockAuthenticationRepoImpl.forgotPassword(params["email"]),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(ServerFailure()),
          ),
        );

        final result = await authenticationUseCaseTest.forgotPassword(params["email"]);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, bool>(ServerFailure()));
        verify(mockAuthenticationRepoImpl.forgotPassword(params["email"])).called(1);
        verifyNoMoreInteractions(mockAuthenticationRepoImpl);

      });

      test('a GeneralFailure', () async {

        when(
          mockAuthenticationRepoImpl.forgotPassword(params["email"]),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(GeneralFailure()),
          ),
        );

        final result = await authenticationUseCaseTest.forgotPassword(params["email"]);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, bool>(GeneralFailure()));
        verify(mockAuthenticationRepoImpl.forgotPassword(params["email"])).called(1);
        verifyNoMoreInteractions(mockAuthenticationRepoImpl);

      });

    });

    group('should return left on logOut with', () {

      test('a ServerFailure', () async {

        when(
          mockAuthenticationRepoImpl.logOut(),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(ServerFailure()),
          ),
        );

        final result = await authenticationUseCaseTest.logOut();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, void>(ServerFailure()));
        verify(mockAuthenticationRepoImpl.logOut()).called(1);
        verifyNoMoreInteractions(mockAuthenticationRepoImpl);

      });

      test('a GeneralFailure', () async {

        when(
          mockAuthenticationRepoImpl.logOut(),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(GeneralFailure()),
          ),
        );

        final result = await authenticationUseCaseTest.logOut();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, void>(GeneralFailure()));
        verify(mockAuthenticationRepoImpl.logOut()).called(1);
        verifyNoMoreInteractions(mockAuthenticationRepoImpl);

      });

    });

  });

}