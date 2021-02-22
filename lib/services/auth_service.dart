part of 'services.dart';

class AuthService {
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(
    String email,
    String password, {
    String name,
    List<String> selectedGenre,
    String selectedLanguage,
  }) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserData userData = userCredential.user.convertToUser(
        name: name,
        selectedGenre: selectedGenre,
        selectedLanguage: selectedLanguage,
      );

      await UserService.addUser(userData);

      return SignInSignUpResult(userData: userData);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      UserCredential userCredentialSignIn =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      DocumentSnapshot documentSnapshot =
          await UserService.getUser(userCredentialSignIn.user.uid);

      UserData userData = documentSnapshot.fromFireStore(
          userCredentialSignIn.user.uid, documentSnapshot);

      return SignInSignUpResult(userData: userData);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }

  static Future<void> signOut() async => await firebaseAuth.signOut();

  static Stream<User> get userStream => firebaseAuth.authStateChanges();
}

class SignInSignUpResult {
  final UserData userData;
  final String message;

  SignInSignUpResult({this.userData, this.message});
}
