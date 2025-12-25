import 'package:clean_architecture_demo/futures/auth/data/datasource/user_datasource_impl.dart';
import 'package:clean_architecture_demo/futures/auth/data/repository/auth_repository_impl.dart';
import 'package:clean_architecture_demo/futures/auth/domain/usercase/login.dart';
import 'package:clean_architecture_demo/futures/auth/presentation/controller/c_auth.dart';
import 'package:clean_architecture_demo/futures/auth/presentation/screens/s_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // DI setup
    final remote = AuthRemoteDataSourceImpl();
    final repo = AuthRepositoryImpl(remote);
    final loginUseCase = LoginUseCase(repo);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit(loginUseCase)),
      ],
      child: MaterialApp(
        home: const LoginPage(),
      ),
    );
  }
}
