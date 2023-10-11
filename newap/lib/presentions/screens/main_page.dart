import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newap/app/app_word.dart';
import 'package:newap/data/cubit/cubit.dart';
import 'package:newap/data/cubit/state.dart';
import 'package:newap/presentions/screens/search.dart';
import 'package:newap/presentions/widgets/navigation.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit newsCubit = NewsCubit.getDataFromCubit(context);

          return Scaffold(
            appBar: AppBar(
              title: const Text(AppWord.newsApp),
              actions: [
                IconButton(
                    onPressed: () {
                      context.navigatTo( Search());
                    },
                    icon: const Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      newsCubit.changeMode();
                    },
                    icon: const Icon(Icons.brightness_4_outlined)),
              ],
            ),
            body: newsCubit.screens[newsCubit.indexCurent],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: newsCubit.indexCurent,
                onTap: (index) {
                  newsCubit.changBottomNavBar(index);
                },
                items: newsCubit.bottomsNavItems),
          );
        });
  }
}


