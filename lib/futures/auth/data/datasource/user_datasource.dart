
import '../model/m_user.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
}