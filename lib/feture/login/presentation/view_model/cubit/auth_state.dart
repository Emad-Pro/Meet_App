import 'package:meet_app/feture/login/data/model/loginAut.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthSignInWithGoogleLoadingState extends AuthState {}

class AuthSignInWithGoogleLoadedState extends AuthState {
  final LoginAuthModel loginAuthModel;

  AuthSignInWithGoogleLoadedState(this.loginAuthModel);
}

class AuthSignInWithGoogleErorrState extends AuthState {
  final String erorrMessage;

  AuthSignInWithGoogleErorrState(this.erorrMessage);
}
