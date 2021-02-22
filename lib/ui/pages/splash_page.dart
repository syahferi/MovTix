part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Tap to sign in page'),
          onPressed: () => context.read<PagesBloc>().add(
                PagesMoved(pages: Pages.Login),
              ),
        ),
      ),
    );
  }
}
