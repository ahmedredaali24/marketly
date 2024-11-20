import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../taps/fav_tap/favorite_tab.dart';
import '../taps/home_tap/home_tab_view.dart';
import '../taps/prod_tap/product_list_tab_view.dart';
import '../taps/profile_tap/profile_tab.dart';
import 'home_states.dart';

class HomeScreenViewModel extends Cubit<HomeStates> {
  HomeScreenViewModel() : super(HomeInitialState());

  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTapView(),
    ProductListTabView(),
    FavoriteTab(),
    ProfileTab()
  ];

  void changeSelectedIndex(int newSelectedIndex) {
    emit(HomeInitialState());
    selectedIndex = newSelectedIndex;
    emit(ChangeBottomNavigationBarStates());
  }
}
