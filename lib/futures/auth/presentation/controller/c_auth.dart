import 'package:bloc/bloc.dart';
import 'package:clean_architecture_demo/futures/auth/domain/entity/user_entity.dart';
import 'package:clean_architecture_demo/futures/auth/domain/usercase/login.dart';

class AuthState {
  final bool loading;
  final UserEntity? user;
  final String? error;

  AuthState({this.loading = false, this.user, this.error});
}

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;

  AuthCubit(this.loginUseCase) : super(AuthState());

  Future<void> login(String email, String pass) async {
    emit(AuthState(loading: true));

    try {
      final user = await loginUseCase(email, pass);
      emit(AuthState(user: user));
    } catch (e) {
      emit(AuthState(error: e.toString()));
    }
  }

  // for ui rebuild again.
  void update() {
    emit(state);
  }
}
