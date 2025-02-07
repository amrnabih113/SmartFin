abstract interface class AuthRepository {

  Future signInWithEmailAndPassword(String email, String password) async {}

  Future googleSignIn()async {}

 // Future facebookSignin() async {}

  Future signOut()async {}

  Future signupWithEmailAndPassword(String fName,String lName,String userName,String email,String password)async{}

  Future resetPassword(String email)async{}

  //Future deleteAccount(String id)async{}
}
