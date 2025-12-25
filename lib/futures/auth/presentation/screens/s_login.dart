
import 'package:clean_architecture_demo/futures/auth/presentation/controller/c_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (_, state) {
          if (state.user != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Welcome ${state.user!.name}")),
            );
          }
        },
        builder: (_, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<AuthCubit>().login("demo@mail.com", "1234");
              },
              child: const Text("Login"),
            ),
          );
        },
      ),
    );
  }
}