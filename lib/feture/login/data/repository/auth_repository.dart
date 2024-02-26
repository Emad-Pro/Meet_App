import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:meet_app/core/erorr/failure.dart';
import 'package:meet_app/feture/login/data/model/loginAut.dart';

abstract class AuthRepository {
  Future<Either<Faliure, LoginAuthModel>> authSignInWithGoogle();
}

class AuthRepositoryImp extends AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authChanges => _auth.authStateChanges();
  User get user => _auth.currentUser!;
  @override
  Future<Either<Faliure, LoginAuthModel>> authSignInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      User? user = userCredential.user;

      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
          });
        }
      }
      return Right(LoginAuthModel.fromJson({
        'username': user!.displayName,
        'uid': user.uid,
        'profilePhoto': user.photoURL,
      }));
    } on Exception catch (e) {
      return Left(ServerFaliure(e.toString()));
    }
  }
}
