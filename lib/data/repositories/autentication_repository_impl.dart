import '../../domain/entities/user.dart';
import '../../domain/repositories/autentication_repository.dart';

class AutenticationRepositoryImpl implements AutenticationRepository {
  @override
  Future<User?> getUserData() {
    return Future.value(User());
  }

  @override
  Future<bool> get isSignedIn {
    return Future.value(true);
  }
}
