import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/modules/home/home_screen.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/modules/setting/setting_screen.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit()
      : super(
          NewsInitialState(),
        );

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.search,
      ),
      label: 'Search',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'Settings',
    ),
  ];

  List<Widget> screens = [
    const HomeScreen(),
    SearchScreen(),
    const SettingScreen(),
  ];

  // ignore: non_constant_identifier_names
  void ChangeBottomNavBar(int index) {
    currentindex = index;
    emit(NewsChangeBottomNavState());
  }

  List<dynamic> dataItem = [];
  String clicCategory = 'Business';
  String clicCountry = 'us';

  void getData() {
    dataItem = [];
    emit(GetDataLoadingStates());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': clicCountry,
        'category': clicCategory,
        'apiKey': '5d9b02d51b0446f3b5095e818afbdb1e',
      },
    ).then((value) {
      dataItem = value?.data['articles'];
      emit(
        GetDataSuccessStates(),
      );
    }).catchError((error) {
      emit(
        GetDataErrorStates(
          error.toString(),
        ),
      );
    });
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingStates());
    search = [];

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': value,
        'apiKey': '5d9b02d51b0446f3b5095e818afbdb1e',
      },
    ).then((value) {
      search = value?.data['articles'];
      emit(
        NewsGetSearchSuccessStates(),
      );
    }).catchError((error) {
      emit(
        NewsGetSearchErrorStates(
          error.toString(),
        ),
      );
    });
  }
}
