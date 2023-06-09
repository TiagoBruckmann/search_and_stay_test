// Mocks generated by Mockito 5.4.0 from annotations
// in search_and_stay/test/domain/usecases/authentication_usecases_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:search_and_stay/data/datasource/authentication_datasource.dart'
    as _i2;
import 'package:search_and_stay/data/models/user_model.dart' as _i7;
import 'package:search_and_stay/data/repositories/authentication_repo_impl.dart'
    as _i4;
import 'package:search_and_stay/domain/failure/failure.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAuthenticationRemoteDatasource_0 extends _i1.SmartFake
    implements _i2.AuthenticationRemoteDatasource {
  _FakeAuthenticationRemoteDatasource_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthenticationRepoImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationRepoImpl extends _i1.Mock
    implements _i4.AuthenticationRepoImpl {
  @override
  _i2.AuthenticationRemoteDatasource get authenticationRemoteDatasource =>
      (super.noSuchMethod(
        Invocation.getter(#authenticationRemoteDatasource),
        returnValue: _FakeAuthenticationRemoteDatasource_0(
          this,
          Invocation.getter(#authenticationRemoteDatasource),
        ),
        returnValueForMissingStub: _FakeAuthenticationRemoteDatasource_0(
          this,
          Invocation.getter(#authenticationRemoteDatasource),
        ),
      ) as _i2.AuthenticationRemoteDatasource);
  @override
  _i5.Future<_i3.Either<_i6.Failure, bool>> verifyConnection() =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyConnection,
          [],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
            _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #verifyConnection,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
                _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #verifyConnection,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, bool>>);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.UserModel>> registerWithEmail(
          Map<String, dynamic>? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #registerWithEmail,
          [params],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, _i7.UserModel>>.value(
            _FakeEither_1<_i6.Failure, _i7.UserModel>(
          this,
          Invocation.method(
            #registerWithEmail,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, _i7.UserModel>>.value(
                _FakeEither_1<_i6.Failure, _i7.UserModel>(
          this,
          Invocation.method(
            #registerWithEmail,
            [params],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i7.UserModel>>);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.UserModel>> loginWithEmail(
          Map<String, dynamic>? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #loginWithEmail,
          [params],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, _i7.UserModel>>.value(
            _FakeEither_1<_i6.Failure, _i7.UserModel>(
          this,
          Invocation.method(
            #loginWithEmail,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, _i7.UserModel>>.value(
                _FakeEither_1<_i6.Failure, _i7.UserModel>(
          this,
          Invocation.method(
            #loginWithEmail,
            [params],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i7.UserModel>>);
  @override
  _i5.Future<_i3.Either<_i6.Failure, bool>> forgotPassword(String? email) =>
      (super.noSuchMethod(
        Invocation.method(
          #forgotPassword,
          [email],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
            _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #forgotPassword,
            [email],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
                _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #forgotPassword,
            [email],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, bool>>);
  @override
  _i5.Future<_i3.Either<_i6.Failure, void>> logOut() => (super.noSuchMethod(
        Invocation.method(
          #logOut,
          [],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, void>>.value(
            _FakeEither_1<_i6.Failure, void>(
          this,
          Invocation.method(
            #logOut,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, void>>.value(
                _FakeEither_1<_i6.Failure, void>(
          this,
          Invocation.method(
            #logOut,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, void>>);
}
