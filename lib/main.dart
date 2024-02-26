import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_app/core/services/getIT.dart';
import 'package:meet_app/feture/login/presentation/view/login_screen.dart';
import 'package:meet_app/core/colors.dart';
import 'package:meet_app/feture/login/presentation/view_model/cubit/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ServiceLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AuthCubit(getIt()))],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ea Meet',
        routes: {
          '/login': (context) => const LoginScreen(),
        },
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
        home: const LoginScreen(),
      ),
    );
  }
}
