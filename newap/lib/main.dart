import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:newap/data/cubit/bloc_observ.dart';
import 'package:newap/data/cubit/cubit.dart';
import 'package:newap/data/cubit/state.dart';
import 'package:newap/data/request/api_helper.dart';

import 'presentions/screens/main_page.dart';
import 'presentions/widgets/themdata.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  ApiHelper.intia();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsCubit()
            ..getBusinessData()
            ..getSportData()
            ..getScienceData(),
        ),
        // BlocProvider(create: (context)=>NewsCubit()..changeMode())
      ],
      child: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            NewsCubit newsCubit = NewsCubit.getDataFromCubit(context);
            return MaterialApp(
              themeMode: newsCubit.isDark ? ThemeMode.dark : ThemeMode.light,
              darkTheme: darkThemm(),
              theme: lightThemm(),
              debugShowCheckedModeBanner: false,
              home: const MainPage(),
            );
          }),
    );
  }
}
