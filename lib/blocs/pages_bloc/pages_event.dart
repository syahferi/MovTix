part of 'pages_bloc.dart';

@immutable
abstract class PagesEvent {}

class PagesMoved extends PagesEvent {
  final Pages pages;

  PagesMoved({this.pages});

  @override
  String toString() {
    return 'PagesMoved{pages: $pages}';
  }
}

enum Pages {
  Splash,
  Login,
  Home,
}
