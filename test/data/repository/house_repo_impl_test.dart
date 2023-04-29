// imports nativos
import 'dart:io';

// import dos testes
import 'house_repo_impl_test.mocks.dart';

// import dos domain
import 'package:search_and_stay/domain/failure/failure.dart';

// import dos data
import 'package:search_and_stay/data/repositories/house_repo_impl.dart';
import 'package:search_and_stay/data/datasource/house_datasource.dart';
import 'package:search_and_stay/data/exceptions/exceptions.dart';
import 'package:search_and_stay/data/models/house_model.dart';

// import dos pacotes
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([MockSpec<HouseRemoteDatasourceImpl>()])
void main() {

  group('HouseRepoImpl', () {

    final mockHouseRemoteDatasource = MockHouseRemoteDatasourceImpl();
    final houseRepoImplTest = HouseRepoImpl(mockHouseRemoteDatasource);

    Map<String, dynamic> map = {
      "house_rules": {
        "name": "Sítio no interior com casa no lago",
        "active": 1,
      }
    };

    group('should return HouseModel', () {

      test('when getHouse is called return a List of HouseModel', () async {

        List<HouseModel> list = [
          HouseModel(
            65,
            1,
            "Sítio no interior com casa no lago",
            0,
          ),
        ];

        when(
          mockHouseRemoteDatasource.getHouses(),
        ).thenAnswer(
          (realInvocation) => Future.value(list),
        );

        final result = await houseRepoImplTest.getHouses();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, List<HouseModel>>(list));
        verify(mockHouseRemoteDatasource.getHouses()).called(1);
        verifyNoMoreInteractions(mockHouseRemoteDatasource);

      });

      test('when getDetail is called return a HouseModel', () async {

        HouseModel houseModel = HouseModel(
          600,
          1,
          "yasmin smmmmmm",
          0,
        );

        when(
          mockHouseRemoteDatasource.getDetail("600"),
        ).thenAnswer(
          (realInvocation) => Future.value(houseModel),
        );

        final result = await houseRepoImplTest.getDetail("600");

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, HouseModel>(houseModel));
        verify(mockHouseRemoteDatasource.getDetail("600")).called(1);
        verifyNoMoreInteractions(mockHouseRemoteDatasource);

      });

      test('when create a house is called return a HouseModel', () async {

        HouseModel houseModel = HouseModel(
          614,
          map["house_rules"]["active"],
          map["house_rules"]["name"],
          0,
        );

        when(
          mockHouseRemoteDatasource.createHouse(map),
        ).thenAnswer(
          (realInvocation) => Future.value(houseModel),
        );

        final result = await houseRepoImplTest.createHouse(map);

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, HouseModel>(houseModel));
        verify(mockHouseRemoteDatasource.createHouse(map)).called(1);
        verifyNoMoreInteractions(mockHouseRemoteDatasource);

      });

      test('when update a house is called return a HouseModel', () async {

        HouseModel houseModel = HouseModel(
          613,
          map["house_rules"]["active"],
          map["house_rules"]["name"],
          0,
        );

        when(
          mockHouseRemoteDatasource.updateHouse("613", map),
        ).thenAnswer(
          (realInvocation) => Future.value(houseModel),
        );

        final result = await houseRepoImplTest.updateHouse("613", map);

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, HouseModel>(houseModel));
        verify(mockHouseRemoteDatasource.updateHouse("613", map)).called(1);
        verifyNoMoreInteractions(mockHouseRemoteDatasource);

      });

      test('when delete is called return a bool value', () async {

        when(
          mockHouseRemoteDatasource.deleteHouse("613"),
        ).thenAnswer(
          (realInvocation) => Future.value(true),
        );

        final result = await houseRepoImplTest.deleteHouse("613");

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, const Right<Failure, bool>(true));
        verify(mockHouseRemoteDatasource.deleteHouse("613")).called(1);
        verifyNoMoreInteractions(mockHouseRemoteDatasource);

      });
    });

    group('should return left with', () {

      // get houses
      test('A serverFailure when a ServerException occurs on getHouses', () async {

        when(
          mockHouseRemoteDatasource.getHouses(),
        ).thenThrow(ServerExceptions());

        final result = await houseRepoImplTest.getHouses();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, List<HouseModel>>(ServerFailure()));

      });

      test('A GeneralFailure on all another exceptions with getHouses', () async {

        when(
          mockHouseRemoteDatasource.getHouses(),
        ).thenThrow(
          const SocketException("Test"),
        );

        final result = await houseRepoImplTest.getHouses();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, List<HouseModel>>(GeneralFailure()));

      });

      // get Detail
      test('A serverFailure when a ServerException occurs on getDetail', () async {

        when(
          mockHouseRemoteDatasource.getDetail("614"),
        ).thenThrow(ServerExceptions());

        final result = await houseRepoImplTest.getDetail("614");

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, HouseModel>(ServerFailure()));

      });

      test('A GeneralFailure on all another exceptions with getDetail', () async {

        when(
          mockHouseRemoteDatasource.getDetail("614"),
        ).thenThrow(
          const SocketException("Test"),
        );

        final result = await houseRepoImplTest.getDetail("614");

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, HouseModel>(GeneralFailure()));

      });

      // create a house
      test('A serverFailure when a ServerException occurs on create a house', () async {

        when(
          mockHouseRemoteDatasource.createHouse(map),
        ).thenThrow(ServerExceptions());

        final result = await houseRepoImplTest.createHouse(map);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, HouseModel>(ServerFailure()));

      });

      test('A GeneralFailure on all another exceptions with create a house', () async {

        when(
          mockHouseRemoteDatasource.createHouse(map),
        ).thenThrow(
          const SocketException("Test"),
        );

        final result = await houseRepoImplTest.createHouse(map);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, HouseModel>(GeneralFailure()));

      });

      // update a house
      test('A serverFailure when a ServerException occurs on update a house', () async {

        when(
          mockHouseRemoteDatasource.updateHouse("613", map),
        ).thenThrow(ServerExceptions());

        final result = await houseRepoImplTest.updateHouse("613", map);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, HouseModel>(ServerFailure()));

      });

      test('A GeneralFailure on all another exceptions with update a house', () async {

        when(
          mockHouseRemoteDatasource.updateHouse("613", map),
        ).thenThrow(
          const SocketException("Test"),
        );

        final result = await houseRepoImplTest.updateHouse("613", map);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, HouseModel>(GeneralFailure()));

      });

      // delete a house
      test('A serverFailure when a ServerException occurs on delete a house', () async {

        when(
          mockHouseRemoteDatasource.deleteHouse("613"),
        ).thenThrow(ServerExceptions());

        final result = await houseRepoImplTest.deleteHouse("613");

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, bool>(ServerFailure()));

      });

      test('A GeneralFailure on all another exceptions with delete a house', () async {

        when(
          mockHouseRemoteDatasource.deleteHouse("613"),
        ).thenThrow(
          const SocketException("Test"),
        );

        final result = await houseRepoImplTest.deleteHouse("613");

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, bool>(GeneralFailure()));

      });

    });

  });

}