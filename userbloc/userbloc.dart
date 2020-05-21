import 'package:appbussines/personal_user_info/model/user.dart';
import 'package:appbussines/personal_user_info/repository/firebase_auth_api_repository.dart';
import 'package:appbussines/personal_user_info/repository/cloud_firestore_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc {
   final _auth_repository = FirebaseAuthApiRespository();

  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get auhtStatus => streamFirebase;

  Future<FirebaseUser> signIn() => _auth_repository.signInFirebase();
  signOut() {
    _auth_repository.signOut();
  }

  Future<FirebaseUser> signInFacebook() => _auth_repository.signInFacebook();
  signOutFacebook(){
    _auth_repository.signOutFacebook();
  }


   final _cloudFirestoreRepository = CloudFireStoreRepository();
    void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);


  @override

  get initialState => null;

  @override
  Stream mapEventToState(event) {

    return null;
  }
}
