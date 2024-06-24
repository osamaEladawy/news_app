import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  String newsType = 'Business';

  Widget newsTypeCloud() => Text(
        newsType,
        style: const TextStyle(color: Colors.orange),
      );

  // Widget newsCategory({categoryName , categoryIcon , context})=>Column(
  //   children: [
  //     CircleAvatar(
  //       radius: 32,
  //       // backgroundColor: NewsCubit.get(context).colorCategory(category.categoryName),
  //       child: Icon(categoryIcon,
  //         color: const Color(0xFF43658b),
  //         size: 40,
  //       ),
  //     ),
  //
  //     Text(
  //       categoryName,
  //       style: TextStyle(
  //         color: NewsCubit.get(context).clicCategory == categoryName ? NewsCubit.get(context).color : Colors.white ,
  //         fontWeight: NewsCubit.get(context).clicCategory == categoryName ? FontWeight.w900 : FontWeight.normal ,
  //       ),
  //     ),
  //   ],
  // );

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }
  //getBusiness()
}
