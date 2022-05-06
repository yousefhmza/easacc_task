import 'package:easacc_task/view/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login_states.dart';

class LoginViewModel extends Cubit<LoginStates> {
  LoginViewModel() : super(LoginInitialState());

  Future<void> facebookLogin(BuildContext context) async {
    emit(LoginLoadingState());
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final facebookData = await FacebookAuth.instance.getUserData();
        if (kDebugMode) {
          print(facebookData);
        }
        // Here we send the access token to the backend server but i used firebase for simplicity here

        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(accessToken.token);

        await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
      } else {
        throw Exception("Authentication using facebook isn't completed !!");
      }
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginFailureState(e.toString()));
    }
  }

  Future<void> googleLogin(BuildContext context) async {
    emit(LoginLoadingState());
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;
      if (kDebugMode) {
        print(googleSignInAccount?.email);
        print(googleSignInAccount?.displayName);
      }

      if (googleSignInAuthentication?.idToken != null) {
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication?.accessToken,
          idToken: googleSignInAuthentication?.idToken,
        );

        // Here we send the access token to the backend server but i used firebase for simplicity here

        await FirebaseAuth.instance.signInWithCredential(credential);
      } else {
        throw Exception("Authentication using facebook isn't completed !!");
      }
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginFailureState(e.toString()));
    }
  }

  Future<void> logout(BuildContext context) async {
    emit(LogoutLoadingState());
    try {
      await GoogleSignIn().signOut();
      await FacebookAuth.instance.logOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false,
      );
      emit(LogoutSuccessState());
    } catch (e) {
      emit(LogoutFailureState(e.toString()));
    }
  }
}
