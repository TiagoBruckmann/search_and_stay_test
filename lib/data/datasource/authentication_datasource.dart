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
    .then((firebaseUser) {

      userModel = UserModel(
        firebaseUser.user!.uid,
        firebaseUser.user!.displayName!,
        params["email"],
      );
      print("userModel => $userModel");

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

}