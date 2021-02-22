part of 'pages_bloc.dart';

@immutable
abstract class PagesState {}

class PagesInitial extends PagesState {}

class PagesOnMove extends PagesState {
  final Pages pages;

  PagesOnMove({this.pages});

  @override
  String toString() {
    return 'PagesOnMove{pages: $pages}';
  }
}
