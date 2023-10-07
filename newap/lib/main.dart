import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newap/data/cubit/bloc_observ.dart';
import 'package:newap/data/cubit/cubit.dart';
import 'package:newap/data/request/api_helper.dart';

import 'presentions/screens/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  ApiHelper.intia();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => NewsCubit()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
