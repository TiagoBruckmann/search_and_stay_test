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
String pathUrl = "api/admin/house_rules";

int totalItems = 0;
int scrollSize = 170;
int currentPage = 1;
int? nextPage;
int lastPage = 1;

@InjectableInit()
void configureDependencies() {

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

Future<void> paginationSettings(Map<String, dynamic> json) async {
  totalItems = json["total"];
  currentPage = json["current_page"];
  if ( json["links"]["next"] != null ) {
    nextPage = int.parse(json["links"]["next"].toString().split("page=")[1]);
  }
  lastPage = json["total_pages"];
}

void clearPagination() {
  totalItems = 0;
  scrollSize = 170;
  currentPage = 1;
  nextPage = null;
  lastPage = 1;
}