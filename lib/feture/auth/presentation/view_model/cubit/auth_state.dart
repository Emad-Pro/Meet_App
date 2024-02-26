import 'package:meet_app/feture/auth/data/model/AuthModel.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthSignInWithGoogleLoadingState extends AuthState {}

class AuthSignInWithGoogleLoadedState extends AuthState {
  final AuthModel loginAuthModel;

  AuthSignInWithGoogleLoadedState(this.loginAuthModel);
}

class AuthSignInWithGoogleErorrState extends AuthState {
  final String erorrMessage;

  AuthSignInWithGoogleErorrState(this.erorrMessage);
}
