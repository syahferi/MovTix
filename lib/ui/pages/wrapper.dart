part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User firebaseUser = Provider.of<User>(context);

    if (firebaseUser == null) {
      
      context.read<PagesBloc>().add(PagesMoved(pages: Pages.Splash));
    } else {
      context.read<PagesBloc>().add(PagesMoved(pages: Pages.Home));
    }

    return BlocBuilder<PagesBloc, PagesState>(
      builder: (_, state) {
        if (state is PagesOnMove) {
          switch (state.pages) {
            case Pages.Splash:
              return SplashPage();
              break;
            case Pages.Login:
              return SignInPage();
              break;
            default:
              return MainPage();
              break;
          }
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
