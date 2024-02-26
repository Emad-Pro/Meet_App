import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_app/core/colors.dart';
import 'package:meet_app/feture/meet/presentaition/viewModel/cubit/meet_cubit.dart';

class MeetScreen extends StatelessWidget {
  const MeetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeetCubit, MeetState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            title: const Text('Meet & Chat'),
            centerTitle: true,
          ),
          body: BlocProvider.of<MeetCubit>(context)
              .pages[BlocProvider.of<MeetCubit>(context).pageFooterBarNum],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: footerColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            onTap: (int index) {
              BlocProvider.of<MeetCubit>(context).onPageChanged(index);
            },
            currentIndex: BlocProvider.of<MeetCubit>(context).pageFooterBarNum,
            type: BottomNavigationBarType.fixed,
            unselectedFontSize: 14,
            items: BlocProvider.of<MeetCubit>(context).items,
          ),
        );
      },
    );
  }
}
