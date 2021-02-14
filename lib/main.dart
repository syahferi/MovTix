import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movtix/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            RaisedButton(
              child: Text('Sign Up'),
              onPressed: () async {
                var result = await AuthService.signUp(
                    'rose@blackpink.com', '123456',
                    name: 'rose manoban',
                    selectedGenre: ['kpop', 'rock'],
                    selectedLanguage: 'korean');

                if (result.message == null) {
                  print('add user success');
                } else {
                  print(result.message);
                }
              },
            ),
            const SizedBox(
              height: 5.0,
            ),
            RaisedButton(
              child: Text('Sign In'),
              onPressed: () async {
                var result = await AuthService.signIn(
                  'rose@blackpink.com',
                  '123456',
                );
                if (result.message == null) {
                  print('sign in success');
                } else {
                  print(result.message);
                }
              },
            ),
            const SizedBox(
              height: 5.0,
            ),
            RaisedButton(
              child: Text('Sign Out'),
              onPressed: () async => await AuthService.signOut(),
            ),
          ],
        ),
      ),
    );
  }
}
