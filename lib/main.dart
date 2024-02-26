import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_app/core/services/getIT.dart';
import 'package:meet_app/feture/home/presentation/view/Home.dart';
import 'package:meet_app/feture/auth/presentation/view/auth_screen.dart';
import 'package:meet_app/core/colors.dart';
import 'package:meet_app/feture/auth/presentation/view_model/cubit/auth_cubit.dart';
import 'package:meet_app/feture/home/presentation/viewModel/cubit/home_cubit.dart';
import 'package:meet_app/feture/meet/presentaition/view/MeetScreen.dart';
import 'package:meet_app/feture/meet/presentaition/viewModel/cubit/meet_cubit.dart';

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
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            getIt(),
          ),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => MeetCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ea Meet',
        routes: {
          '/homeScreen': (context) => const HomeScreen(),
          '/authScreen': (context) => const AuthScreen(),
          '/meetScreen': (context) => const MeetScreen(),
        },
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
        home: const HomeScreen(),
      ),
    );
  }
}
