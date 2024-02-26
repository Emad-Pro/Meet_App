import 'package:bloc/bloc.dart';
import 'package:meet_app/feture/auth/data/repository/auth_repository.dart';
import 'package:meet_app/feture/auth/presentation/view_model/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthInitial());
  final AuthRepository authRepository;
  Future googleAuthApp() async {
    emit(AuthSignInWithGoogleLoadingState());
    print("Loading");
    final response = await authRepository.authSignInWithGoogle();
    response.fold((l) {
      print(
          "${l.erorrMessage}aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      (emit(AuthSignInWithGoogleErorrState(l.erorrMessage)));
    }, (r) {
      print("Auth Is Success");
      emit(AuthSignInWithGoogleLoadedState(r));
    });
  }
}
