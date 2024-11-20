
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketly/ui/home/home_screen/widget/custom_bottom_navigation_bar.dart';

import 'cubit/home_screen_view_model.dart';
import 'cubit/home_states.dart';

class HomeScreenView extends StatefulWidget {
  static const String routeName="HomeScreenView";

  HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeStates>(
        bloc: viewModel,
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: buildCustomBottomNavigationBar(
              context: context,
              selectedIndex: viewModel.selectedIndex,
              onTapFunction: (index) {
                viewModel.changeSelectedIndex(index);
              },
            ),
            body: viewModel.tabs[viewModel.selectedIndex],
          );
        });
  }
}
