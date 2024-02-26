import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_app/feture/auth/presentation/view/auth_screen.dart';
import 'package:meet_app/feture/home/presentation/viewModel/cubit/home_cubit.dart';
import 'package:meet_app/feture/pagesView/presentaition/view/PagesView.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: BlocProvider.of<HomeCubit>(context).authChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return const PagesviewScreen();
          } else {
            return const AuthScreen();
          }
        },
      ),
    );
  }
}
