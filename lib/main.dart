import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movtix/blocs/pages_bloc/pages_bloc.dart';
import 'package:movtix/services/services.dart';
import 'package:provider/provider.dart';

import 'ui/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService.userStream,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PagesBloc()),
        ],
        child: MaterialApp(
          home: Wrapper(),
        ),
      ),
    );
  }
}
