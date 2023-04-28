part of 'home_cubit.dart';

abstract class HomeCubitState extends Equatable {
  const HomeCubitState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeCubitState {
  const HomeInitial();
}

class HomeStateLoading extends HomeCubitState {
  const HomeStateLoading();
}

class HomeStateLoaded extends HomeCubitState {
  const HomeStateLoaded({ required this.listHouses });
  final List<HouseEntity> listHouses;

  @override
  List<Object?> get props => [listHouses];
}

class HomeStateError extends HomeCubitState {
  const HomeStateError({ required this.message });
  final String message;

  @override
  List<Object?> get props => [message];
}