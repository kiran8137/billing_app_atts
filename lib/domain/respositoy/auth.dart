

abstract class AuthRepository{

  Future<void> sigInUser({
    required String userName,
    required String email,
    required String password,

  });

   Future<void> logInUser({
    required String email,
    required String password,
  });

  Future<void> signOutUser();
}