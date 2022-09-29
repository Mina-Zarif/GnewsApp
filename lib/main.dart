import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gnews/shared/cubit/BlocObserver.dart';
import 'package:gnews/shared/cubit/cubit.dart';
import 'package:gnews/shared/cubit/states.dart';
import 'package:gnews/shared/network/local/cacheHelper.dart';
import 'package:gnews/shared/network/remot/dio_helper.dart';
import 'package:gnews/shared/styles/themes.dart';
import 'package:hexcolor/hexcolor.dart';
import 'layout/Home_Screen/News_Screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');

  runApp(MyApp(isDark: isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  const MyApp({Key? key, this.isDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getBusiness()
        ..getSports()
        ..getScience()
        ..changeTheme(fromShared: isDark),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightMode ,
          darkTheme: darkMode,
          themeMode:
              AppCubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark,
          home: News_Screen(),
        ),
      ),
    );
  }
}
