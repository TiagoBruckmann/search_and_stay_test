// import das telas
import 'package:search_and_stay/app/pages/home/cubit/home_cubit.dart';

// import do domain
import 'package:search_and_stay/domain/repositories/authentication_repo.dart';
import 'package:search_and_stay/domain/usecases/authentication_usecase.dart';
import 'package:search_and_stay/domain/repositories/house_repo.dart';
import 'package:search_and_stay/domain/usecases/house_usecase.dart';

// import do data
import 'package:search_and_stay/data/repositories/authentication_repo_impl.dart';
import 'package:search_and_stay/data/datasource/authentication_datasource.dart';
import 'package:search_and_stay/data/repositories/house_repo_impl.dart';
import 'package:search_and_stay/data/datasource/house_datasource.dart';

// import dos pacotes
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

String apiUrl = "sys-dev.searchandstay.com";
String pathUrl = "api/admin/house_rules/";

@InjectableInit()
void configureDependencies() {

  // app
  getIt.registerFactory(() => HomeCubit(homeUseCase: getIt()));

  // domain
  getIt.registerFactory(() => HouseUseCase(getIt()));
  getIt.registerFactory(() => AuthenticationUseCase(getIt()));

  // data
  getIt.registerFactory<AuthenticationRemoteDatasource>(() => AuthenticationRemoteSourceImpl(getIt(), getIt()));
  getIt.registerFactory<HouseRemoteDatasource>(() => HouseRemoteDatasourceImpl(getIt()));
  getIt.registerFactory<AuthenticationRepo>(() => AuthenticationRepoImpl(getIt()));
  getIt.registerFactory<HouseRepo>(() => HouseRepoImpl(getIt()));

  // extern
  getIt.registerFactory(() => FirebaseFirestore.instance);
  getIt.registerFactory(() => FirebaseAuth.instance);
  getIt.registerFactory(() => http.Client());

}