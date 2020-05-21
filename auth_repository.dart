import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_auth_api.dart';



class AuthRespository {
    final _firebaseAuthAPI =  FirebaseAuthAPI();
    Future<FirebaseUser> signInFirebase() => _firebaseAuthAPI.signIn();

  signOut()=> _firebaseAuthAPI.signOut();

}


