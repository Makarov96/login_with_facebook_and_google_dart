import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FacebookLogin facebookSignIn = FacebookLogin();
  

  Future<FirebaseUser> signInFacebook() async {
    final fabookSignInAuthentication =  await facebookSignIn.logIn(['email']);
    if(fabookSignInAuthentication .status != FacebookLoginStatus.loggedIn){
      return null;
    }
    final AuthCredential credential = FacebookAuthProvider.getCredential(
        accessToken: fabookSignInAuthentication.accessToken.token);
    final user = (await _auth.signInWithCredential(credential));
    return user.user;
  }



  Future<FirebaseUser> signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    final user = (await _auth.signInWithCredential(credential));

    return user.user;
  }

  signOut() async {
    await _auth.signOut().then((onValue) => print("Sesion cerrada"));
    googleSignIn.signOut();
    print("Sesiones cerradas");
  }

  signOutFacebook() async {
    await _auth.signOut().then((onValue) => print("Sesion cerrada"));
    facebookSignIn .logOut();
  }
}
