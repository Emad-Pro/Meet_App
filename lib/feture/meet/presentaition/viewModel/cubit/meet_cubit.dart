import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'meet_state.dart';

class MeetCubit extends Cubit<MeetState> {
  MeetCubit() : super(const MeetState());
  int pageFooterBarNum = 0;

  void onPageChanged(int page) {
    pageFooterBarNum = page;
    emit(MeetChangeFooterNumberState());
  }

  List<Widget> pages = [
    const Text('Contacts'),
    const Text('Contacts'),
    const Text('Contacts'),
    const Text('Contacts'),
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
