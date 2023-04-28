// imports globais
import 'package:flutter/cupertino.dart';
import 'package:search_and_stay/session.dart';

// imports dos domain
import 'package:search_and_stay/domain/usecases/house_usecase.dart';
import 'package:search_and_stay/domain/failure/failure.dart';
import 'package:search_and_stay/domain/entity/house.dart';

// import dos pacotes
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  final HouseUseCase homeUseCase;
  HomeCubit({ required this.homeUseCase }) : super(const HomeInitial());

  Future<void> getHouses() async {
    emit(const HomeStateLoading());

    final failureOrList = await homeUseCase.getHouses();

    failureOrList.fold(
      (failure) => emit(HomeStateError(message: _mapFailureToMessage(failure))),
      (success) => emit(HomeStateLoaded(listHouses: success)),
    );
  }

  void goToDetail( HouseEntity? houseEntity, bool isRegister ) {
    Navigator.pushNamed(
      Session.globalContext.currentContext!,
      "/detail",
      arguments: {
        "house_entity": houseEntity,
        "is_register": isRegister,
      }
    );
  }

  String _mapFailureToMessage( Failure failure ) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return FlutterI18n.translate(Session.globalContext.currentContext!, "pages.home.home.errors.server_error");
      case CacheFailure:
        return FlutterI18n.translate(Session.globalContext.currentContext!, "pages.home.home.errors.cache_error");
      default:
        return FlutterI18n.translate(Session.globalContext.currentContext!, "pages.home.home.errors.general_error");
    }
  }
}