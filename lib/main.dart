import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gnews/shared/cubit/BlocObserver.dart';
import 'package:gnews/shared/cubit/cubit.dart';
import 'package:gnews/shared/cubit/states.dart';
import 'package:gnews/shared/network/remot/dio_helper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'layout/Home_Screen/News_Screen.dart';

void main() {

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppState>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppCubit.get(context).isDark?
                  AppCubit.get(context).themeDarkMode():
                  AppCubit.get(context).themeLightMode(),
          // darkTheme:
          // themeMode: AppCubit.get(context).themeMode(),
          home: News_Screen(),
        ),

      ),
    );
  }
}
