import '../model/m_user.dart';
import 'user_datasource.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(String email, String password) async {
    // mock API example
    await Future.delayed(const Duration(milliseconds: 300));

    return UserModel(
      id: "1",
      name: "Demo User",
      email: email,
    );
  }
}

