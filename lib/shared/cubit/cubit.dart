import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gnews/shared/cubit/states.dart';
import 'package:gnews/shared/network/remot/dio_helper.dart';
import '../../layout/business_Screen/businessScreen.dart';
import '../../layout/science_Screen/scienceScreen.dart';
import '../../layout/sports_Screen/sportScreen.dart';
import '../network/local/cacheHelper.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  String apiKey =
      'd322d941f7614a09b34e5ae57da321a1';    // mine
    //  '65f7f556ec76449fa7dc7c0069f040ca';    
  var searchController = TextEditingController();
  List<BottomNavigationBarItem> bottomsItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: 'sports'),
    BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: 'science'),
    // BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'setting'),
  ];

  // ignore: non_constant_identifier_names
  List<Widget> Screens = [
    businessScreen(),
    sportsScreen(),
    scienceScreen(),
    // SettingScreen(),
  ];

  void changeIndex(value) {
    currentIndex = value;
    emit(AppChangeIndexState());
  }

  bool isDark = true;
  void changeTheme({fromShared}){
     if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;

    }
    CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
      emit(AppChangeThemeStateLight());
    });

  }
  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': apiKey,
      },
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      // print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }
  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': apiKey,
        },
      ).then((value) {
        //print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        // print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }
  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': apiKey,
        },
      ).then((value) {
        science = value.data['articles'];
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {

        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  List<dynamic> search = [];
  // ignore: non_constant_identifier_names
  late String Value ;
  void getSearch(String value)
  {

    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query:
      {
        'q': value,
        'apiKey': apiKey,
      },
    ).then((value)
    {
      search = (value.data['articles']) ;
      Value = value.toString();
      emit(NewsGetSearchSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });

  }
}
