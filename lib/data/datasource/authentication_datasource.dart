// imports globais
import 'package:search_and_stay/session.dart';

// import dos data
import 'package:search_and_stay/data/exceptions/exceptions.dart';
import 'package:search_and_stay/data/models/user_model.dart';

// import dos pacotess
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRemoteDatasource {

  Future<bool> verifyConnection();
  Future<UserModel> registerWithEmail( Map<String, dynamic> params );
  Future<UserModel> loginWithEmail( Map<String, dynamic> params );
  Future<bool> forgotPassword( String email );
  Future<void> logOut();

}

class AuthenticationRemoteSourceImpl implements AuthenticationRemoteDatasource {
  final FirebaseFirestore db;
  final FirebaseAuth auth;
  AuthenticationRemoteSourceImpl( this.db, this.auth );

  @override
  Future<bool> verifyConnection() async {

    bool connected = false;

    User? user = auth.currentUser;
    if ( user != null ) {
      await getToken();
      connected = true;
    }

    return connected;
  }

  @override
  Future<UserModel> registerWithEmail( Map<String, dynamic> params ) async {

    late UserModel userModel;

    await auth.createUserWithEmailAndPassword(
      email: params["email"],
      password: params["password"],
    )
    .then((firebaseUser) async {

      firebaseUser.user?.updateDisplayName(params["name"]);
      firebaseUser.user?.updatePhotoURL("https://ui-avatars.com/api/?name=${params["name"]}");
      userModel = UserModel(
        firebaseUser.user!.uid,
        params["name"],
        params["email"],
      );

      await db.collection("users").doc(userModel.id).set(userModel.toMap());
      await getToken();

    })
    .onError((error, stackTrace) {
      Session.crash.onError(error, stackTrace);
      throw ServerExceptions();
    })
    .catchError((onError) {
      Session.crash.log(onError);
      throw ServerExceptions();
    });

    return userModel;
  }

  @override
  Future<UserModel> loginWithEmail( Map<String, dynamic> params ) async {

    late UserModel userModel;

    await auth.signInWithEmailAndPassword(
      email: params["email"],
      password: params["password"],
    )
    .then((firebaseUser) async {

      userModel = UserModel(
        firebaseUser.user!.uid,
        firebaseUser.user!.displayName!,
        params["email"],
      );
      await getToken();

    })
    .onError((error, stackTrace) {
      Session.crash.onError(error, stackTrace);
      throw ServerExceptions();
    })
    .catchError((onError) {
      Session.crash.log(onError);
      throw ServerExceptions();
    });

    return userModel;
  }

  @override
  Future<bool> forgotPassword( String email ) async {

    bool success = false;

    await auth.sendPasswordResetEmail(
      email: email,
    )
    .then((value) {
      success = true;
    })
    .onError((error, stackTrace) {
      Session.crash.onError(error, stackTrace);
      throw ServerExceptions();
    })
    .catchError((onError) {
      Session.crash.log(onError);
      throw ServerExceptions();
    });

    return success;
  }

  @override
  Future<void> logOut() async {

    try {

      await auth.signOut()
        .then((value) => value)
        .catchError((onError) {
          Session.crash.log(onError);
          throw ServerExceptions();
        });
    } on Exception {
      throw ServerExceptions();
    }

  }

  Future<void> getToken() async {
    await db.collection("credentials")
      .doc("X7S0i9ULKIuNs6Uz1bL7")
      .get().then(
        (value)  {
          String token = value.data()!["token"];
          Session.localStorage.setCredential("token", token);
        },
      )
      .onError((error, stackTrace) {
        Session.crash.onError(error, stackTrace);
        throw ServerExceptions();
      })
      .catchError((onError) {
        Session.crash.log(onError);
        throw ServerExceptions();
      });
  }

}