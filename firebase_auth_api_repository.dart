import 'package:appbussines/personal_user_info/repository/firebase_auth_api.dart';
import 'package:firebase_auth/firebase_auth.dart';



class FirebaseAuthApiRespository {

  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<FirebaseUser> signInFirebase() => _firebaseAuthAPI.signIn();
  signOut()=> _firebaseAuthAPI.signOut();


  Future<FirebaseUser> signInFacebook()  => _firebaseAuthAPI.signInFacebook();
  signOutFacebook()=> _firebaseAuthAPI.signOutFacebook();


}

