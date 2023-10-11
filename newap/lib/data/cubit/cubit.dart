import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newap/app/app_word.dart';
import 'package:newap/data/cubit/state.dart';
import 'package:newap/data/request/api_helper.dart';
import 'package:newap/presentions/screens/bussiness.dart';
import 'package:newap/presentions/screens/science.dart';
import 'package:newap/presentions/screens/sport.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(IntialState());
  static NewsCubit getDataFromCubit(context) => BlocProvider.of(context);
  int indexCurent = 0;

  List<BottomNavigationBarItem> bottomsNavItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: AppWord.business),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports), label: AppWord.sport),
    const BottomNavigationBarItem(
        icon: Icon(Icons.science), label: AppWord.science),
  ];
  List<Widget> screens = [
    const Business(),
    const Sport(),
    const Science(),
  ];
  void changBottomNavBar(int index) {
    indexCurent = index;
    emit(BottomNavState());
  }

  List<dynamic> businessData = [];
  void getBusinessData() {
    emit(BusinessLoadingState());
    ApiHelper.getData(query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'ab061c22234f4d74a8e2e3ec35cbfa36'
    }, path: 'v2/top-headlines')
        .then((value) {
      businessData = value.data['articles'];
      for (var article in businessData) {
        log(article['title'].toString(), name: 'title');
        log(article['publishedAt'].toString(), name: 'publishedAt');
      }
      emit(BusinessSucessState());
    }).catchError((erorr) {
      log(erorr.toString(), name: 'erorr');
      emit(BusinessErorrState(erorr));
    });
  }

  List<dynamic> sportData = [];
  void getSportData() {
    emit(SportLoadingState());
    ApiHelper.getData(query: {
      'country': 'eg',
      'category': 'sport',
      'apiKey': 'ab061c22234f4d74a8e2e3ec35cbfa36'
    }, path: 'v2/top-headlines')
        .then((value) {
      sportData = value.data['articles'];
      for (var article in sportData) {
        log(article['title'].toString(), name: 'title');
        log(article['publishedAt'].toString(), name: 'publishedAt');
      }
      emit(SportSucessState());
    }).catchError((erorr) {
      log(erorr.toString(), name: 'erorr');
      emit(SportErorrState(erorr));
    });
  }

  List<dynamic> scienceData = [];
  void getScienceData() {
    emit(ScienceLoadingState());
    ApiHelper.getData(query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'ab061c22234f4d74a8e2e3ec35cbfa36'
    }, path: 'v2/top-headlines')
        .then((value) {
      scienceData = value.data['articles'];
      for (var article in scienceData) {
        log(article['title'].toString(), name: 'title');
        log(article['publishedAt'].toString(), name: 'publishedAt');
      }
      emit(ScienceSucessState());
    }).catchError((erorr) {
      log(erorr.toString(), name: 'erorr');
      emit(ScienceErorrState(erorr));
    });
  }

  List<dynamic> searchData = [];
  void getSearchData(String value) {
    searchData = [];
    emit(SearchLoadingState());
    ApiHelper.getData(
            query: {'q': value, 'apiKey': 'ab061c22234f4d74a8e2e3ec35cbfa36'},
            path: 'v2/everything')
        .then((value) {
      searchData = value.data['articles'];

      emit(SearchSucessState());
    }).catchError((erorr) {
      log(erorr.toString(), name: 'erorr');
      emit(SearchErorrState(erorr));
    });
  }

  bool isDark = false;
  void changeMode() {
    isDark = !isDark;
    emit(ChangeModeState());
  }
}
