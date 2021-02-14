part of 'extension.dart';

extension SignUpExtension on User {
  UserData convertToUser({
    String name = 'no name',
    List<String> selectedGenre = const [],
    String selectedLanguage = 'english',
    int balance = 500,
  }) =>
      UserData(
        id: this.uid,
        email: this.email,
        name: name,
        selectedGenre: selectedGenre,
        selectedLanguage: selectedLanguage,
        balance: balance,
      );
}

extension SiginExtension on DocumentSnapshot {
  UserData fromFireStore(String uid, DocumentSnapshot doc) => UserData(
        id: uid,
        name: doc.get('name'),
        email: doc.get('email'),
        profilePicture: doc.get('profilePicture'),
        selectedLanguage: doc.get('selectedLanguage'),
        selectedGenre: (doc.get('selectedGenres') as List)
            .map((value) => value.toString())
            .toList(growable: false),
        balance: doc.get('balance'),
      );
}
