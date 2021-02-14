part of 'models.dart';

class UserData extends Equatable {
  final String id;
  final String email;
  final String profilePicture;
  final List<String> selectedGenre;
  final String selectedLanguage;
  final String name;
  final int balance;

  UserData({
    this.id,
    this.email,
    this.profilePicture,
    this.name,
    this.balance,
    this.selectedGenre,
    this.selectedLanguage,
  });

  @override
  List<Object> get props => [
        id,
        email,
        profilePicture,
        name,
        balance,
        selectedGenre,
        selectedLanguage,
      ];
}
