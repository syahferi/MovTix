part of 'services.dart';

class UserService {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> addUser(UserData userData) async {
    return _userCollection.doc(userData.id).set({
      'email': userData.email,
      'name': userData.name,
      'balance': userData.balance,
      'selectedGenres': userData.selectedGenre,
      'selectedLanguage': userData.selectedLanguage,
      'profilePicture': userData.profilePicture ?? '',
    });
  }

  static Future<DocumentSnapshot> getUser(String uid) async {
    DocumentSnapshot doc;
    await _userCollection.doc(uid).get().then((value) {
      if (value.exists) {
        doc = value;
      }
    });
    return doc;
  }
}
