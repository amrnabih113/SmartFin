abstract interface class AuthRepository {
  Future signInWithEmailAndPassword(String email, String password);

  Future googleSignIn();

  // Future facebookSignin()

  Future signOut();

  Future signupWithEmailAndPassword(String fName, String lName, String userName,
      String email, String password);

  Future resetPassword(String email);

  //Future deleteAccount(String id)
}
