import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_app/core/colors.dart';

import 'package:meet_app/feture/pagesView/presentaition/viewModel/cubit/meet_cubit.dart';

class PagesviewScreen extends StatelessWidget {
  const PagesviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PagesViewCubit, PagesViewState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            title: const Text('Meet & Chat'),
            centerTitle: true,
          ),
          body: BlocProvider.of<PagesViewCubit>(context)
              .pages[BlocProvider.of<PagesViewCubit>(context).pageFooterBarNum],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: footerColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            onTap: (int index) {
              BlocProvider.of<PagesViewCubit>(context).onPageChanged(index);
            },
            currentIndex:
                BlocProvider.of<PagesViewCubit>(context).pageFooterBarNum,
            type: BottomNavigationBarType.fixed,
            unselectedFontSize: 14,
            items: BlocProvider.of<PagesViewCubit>(context).items,
          ),
        );
      },
    );
  }
}
