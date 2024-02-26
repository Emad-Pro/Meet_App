import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meet_app/core/widget/custom_buttom.dart';
import 'package:meet_app/feture/auth/presentation/view_model/cubit/auth_cubit.dart';
import 'package:meet_app/feture/auth/presentation/view_model/cubit/auth_state.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Start or join a meeting',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 38.0),
              child: Image.asset('assets/images/onboarding.jpg'),
            ),
            CustomButtom(
                onPressed: () {
                  print("click");
                  BlocProvider.of<AuthCubit>(context).googleAuthApp();
                },
                text: "Google Sign In")
          ],
        );
      },
    );
  }
}
