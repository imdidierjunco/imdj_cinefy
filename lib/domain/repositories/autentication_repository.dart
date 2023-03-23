import '../entities/user.dart';

abstract class AutenticationRepository {
  Future<bool> get isSignedIn;

  Future<User?> getUserData();
}
