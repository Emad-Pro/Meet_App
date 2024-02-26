import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meet_app/feture/pagesView/pages/meeting/presentation/view/MeetingScreen.dart';

part 'meet_state.dart';

class PagesViewCubit extends Cubit<PagesViewState> {
  PagesViewCubit() : super(const PagesViewState());
  int pageFooterBarNum = 0;

  void onPageChanged(int page) {
    pageFooterBarNum = page;
    emit(PagesViewChangeFooterNumberState());
  }

  List<Widget> pages = [
    MeetingScreen(),
    const Text('Meetings'),
    const Text('Contacts'),
    const Text('Settings'),
  ];
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.comment_bank,
      ),
      label: 'Meet & Char',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.lock_clock,
      ),
      label: 'Meetings',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.person_outline,
      ),
      label: 'Contacts',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.settings_outlined,
      ),
      label: 'Settings',
    ),
  ];
}
