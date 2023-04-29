// import dos testes
import 'house_usecases_test.mocks.dart';

// import dos domain
import 'package:search_and_stay/domain/usecases/house_usecase.dart';
import 'package:search_and_stay/domain/failure/failure.dart';
import 'package:search_and_stay/domain/entity/house.dart';

// import dos data
import 'package:search_and_stay/data/repositories/house_repo_impl.dart';
import 'package:search_and_stay/data/models/house_model.dart';

// import dos pacotes
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([MockSpec<HouseRepoImpl>()])
void main() {

  group('HouseUseCase', () {

    final mockHouseRepoImpl = MockHouseRepoImpl();
    final houseUseCaseTest = HouseUseCase(mockHouseRepoImpl);

    Map<String, dynamic> map = {
      "house_rules": {
        "name": "Sítio no interior com casa no lago",
        "active": 1,
      }
    };

    group('should return HouseEntity', () {

      test('when HouseRepoImpl get houses return a List of HouseEntity', () async {

        List<HouseModel> list = [
          HouseModel(
            65,
            1,
            "Sítio no interior com casa no lago",
            0,
          ),
        ];

        when(
          mockHouseRepoImpl.getHouses(),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Right(list),
          ),
        );

        final result = await houseUseCaseTest.getHouses();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, List<HouseEntity>>(list));
        verify(mockHouseRepoImpl.getHouses()).called(1);

        verifyNoMoreInteractions(mockHouseRepoImpl);

      });

      test('when HouseRepoImpl get detail of a house return a HouseEntity', () async {

        HouseModel houseModel = HouseModel(
          600,
          1,
          "yasmin smmmmmm",
          0,
        );

        when(
          mockHouseRepoImpl.getDetail("600"),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Right(houseModel),
          ),
        );

        final result = await houseUseCaseTest.getDetail("600");

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, HouseEntity>(houseModel));
        verify(mockHouseRepoImpl.getDetail("600")).called(1);

        verifyNoMoreInteractions(mockHouseRepoImpl);

      });

      test('when HouseRepoImpl create a house return a HouseEntity', () async {

        HouseModel houseModel = HouseModel(
          614,
          map["house_rules"]["active"],
          map["house_rules"]["name"],
          0,
        );

        when(
          mockHouseRepoImpl.createHouse(map),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Right(houseModel),
          ),
        );

        final result = await houseUseCaseTest.createHouse(map);

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, HouseEntity>(houseModel));
        verify(mockHouseRepoImpl.createHouse(map)).called(1);

        verifyNoMoreInteractions(mockHouseRepoImpl);

      });

      test('when HouseRepoImpl update a house return a HouseEntity', () async {

        HouseModel houseModel = HouseModel(
          613,
          map["house_rules"]["active"],
          map["house_rules"]["name"],
          0,
        );

        when(
          mockHouseRepoImpl.updateHouse("613", map),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Right(houseModel),
          ),
        );

        final result = await houseUseCaseTest.updateHouse("613", map);

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, HouseEntity>(houseModel));
        verify(mockHouseRepoImpl.updateHouse("613", map)).called(1);

        verifyNoMoreInteractions(mockHouseRepoImpl);

      });

      test('when HouseRepoImpl delete a house return a bool value', () async {

        when(
          mockHouseRepoImpl.deleteHouse("613"),
        ).thenAnswer(
          (realInvocation) => Future.value(
            const Right(true),
          ),
        );

        final result = await houseUseCaseTest.deleteHouse("613");

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, const Right<Failure, bool>(true));
        verify(mockHouseRepoImpl.deleteHouse("613")).called(1);

        verifyNoMoreInteractions(mockHouseRepoImpl);

      });

    });

    group('should return left on getHouses with', () {

      test('a ServerFailure', () async {

        when(
          mockHouseRepoImpl.getHouses(),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(ServerFailure()),
          ),
        );

        final result = await houseUseCaseTest.getHouses();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, List<HouseEntity>>(ServerFailure()));
        verify(mockHouseRepoImpl.getHouses()).called(1);
        verifyNoMoreInteractions(mockHouseRepoImpl);

      });

      test('a GeneralFailure', () async {

        when(
          mockHouseRepoImpl.getHouses(),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(GeneralFailure()),
          ),
        );

        final result = await houseUseCaseTest.getHouses();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, List<HouseEntity>>(GeneralFailure()));
        verify(mockHouseRepoImpl.getHouses()).called(1);
        verifyNoMoreInteractions(mockHouseRepoImpl);

      });

    });

    group('should return left on get detail with', () {

      String id = "613";

      test('a ServerFailure', () async {

        when(
          mockHouseRepoImpl.getDetail(id),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(ServerFailure()),
          ),
        );

        final result = await houseUseCaseTest.getDetail(id);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, HouseEntity>(ServerFailure()));
        verify(mockHouseRepoImpl.getDetail(id)).called(1);
        verifyNoMoreInteractions(mockHouseRepoImpl);

      });

      test('a GeneralFailure', () async {

        when(
          mockHouseRepoImpl.getDetail(id),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(GeneralFailure()),
          ),
        );

        final result = await houseUseCaseTest.getDetail(id);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, HouseEntity>(GeneralFailure()));
        verify(mockHouseRepoImpl.getDetail(id)).called(1);
        verifyNoMoreInteractions(mockHouseRepoImpl);

      });

    });

    group('should return left on createHouse with', () {

      test('a ServerFailure', () async {

        when(
          mockHouseRepoImpl.createHouse(map),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(ServerFailure()),
          ),
        );

        final result = await houseUseCaseTest.createHouse(map);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, HouseEntity>(ServerFailure()));
        verify(mockHouseRepoImpl.createHouse(map)).called(1);
        verifyNoMoreInteractions(mockHouseRepoImpl);

      });

      test('a GeneralFailure', () async {

        when(
          mockHouseRepoImpl.createHouse(map),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(GeneralFailure()),
          ),
        );

        final result = await houseUseCaseTest.createHouse(map);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, HouseEntity>(GeneralFailure()));
        verify(mockHouseRepoImpl.createHouse(map)).called(1);
        verifyNoMoreInteractions(mockHouseRepoImpl);

      });

    });

    group('should return left on update house with', () {

      test('a ServerFailure', () async {

        when(
          mockHouseRepoImpl.updateHouse("613", map),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(ServerFailure()),
          ),
        );

        final result = await houseUseCaseTest.updateHouse("613", map);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, HouseEntity>(ServerFailure()));
        verify(mockHouseRepoImpl.updateHouse("613", map)).called(1);
        verifyNoMoreInteractions(mockHouseRepoImpl);

      });

      test('a GeneralFailure', () async {

        when(
          mockHouseRepoImpl.updateHouse("613", map),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(GeneralFailure()),
          ),
        );

        final result = await houseUseCaseTest.updateHouse("613", map);

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, HouseEntity>(GeneralFailure()));
        verify(mockHouseRepoImpl.updateHouse("613", map)).called(1);
        verifyNoMoreInteractions(mockHouseRepoImpl);

      });

    });

    group('should return left on delete a house with', () {

      test('a ServerFailure', () async {

        when(
          mockHouseRepoImpl.deleteHouse("613"),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(ServerFailure()),
          ),
        );

        final result = await houseUseCaseTest.deleteHouse("613");

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, bool>(ServerFailure()));
        verify(mockHouseRepoImpl.deleteHouse("613")).called(1);
        verifyNoMoreInteractions(mockHouseRepoImpl);

      });

      test('a GeneralFailure', () async {

        when(
          mockHouseRepoImpl.deleteHouse("613"),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(GeneralFailure()),
          ),
        );

        final result = await houseUseCaseTest.deleteHouse("613");

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, bool>(GeneralFailure()));
        verify(mockHouseRepoImpl.deleteHouse("613")).called(1);
        verifyNoMoreInteractions(mockHouseRepoImpl);

      });

    });

  });

}