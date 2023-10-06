import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user.dart' as user;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<user.User?> signInWithGoogle() async {
    GoogleSignInAccount? account = await GoogleSignIn().signIn();
    GoogleSignInAuthentication authentication = await account!.authentication;
    OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken);

    return _auth.signInWithCredential(credential).then(
          (result) => user.User(
              email: result.user!.email!,
              displayName: result.user!.displayName!),
        );
  }

  Future signOut() async {
    return _auth.signOut();
  }
}
