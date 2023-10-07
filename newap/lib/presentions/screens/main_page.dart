import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newap/app/app_word.dart';
import 'package:newap/data/cubit/cubit.dart';
import 'package:newap/data/cubit/state.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusinessData()..getSportData()..getScienceData(),
      child: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            NewsCubit newsCubit = NewsCubit.getDataFromCubit(context);

            return Scaffold(
              appBar: AppBar(
                title: const Text(AppWord.newsApp),
              ),
            
              body: newsCubit.screens[newsCubit.indexCurent],
              bottomNavigationBar: BottomNavigationBar(
                  currentIndex: newsCubit.indexCurent,
                  onTap: (index) {
                    newsCubit.changBottomNavBar(index);
                  },
                  items: newsCubit.bottomsNavItems),
            );
          }),
    );
  }
}
