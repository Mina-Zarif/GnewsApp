import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gnews/layout/search_Screen/SearchScreen.dart';
import 'package:gnews/shared/cubit/cubit.dart';
import 'package:gnews/shared/cubit/states.dart';

// ignore: camel_case_types
class News_Screen extends StatelessWidget {
  const News_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                  title: Text(
                'News App',
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: IconButton(
                        onPressed: (){

                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SearchScreen(),));

                        },
                        icon: Icon(Icons.search_sharp),
                      iconSize: 25,
                      // style: ButtonStyle(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: IconButton(
                      onPressed: (){
                        AppCubit.get(context).changeTheme();
                      },
                      icon: Icon(Icons.brightness_4_outlined),
                      iconSize: 25,
                      // style: ButtonStyle(),
                    ),
                  )
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: cubit.bottomsItems,
                currentIndex:cubit.currentIndex,
                onTap: (value) => cubit.changeIndex(value),
                elevation: 50,
              ),
              body: cubit.Screens[cubit.currentIndex],
            );
          }
    );
  }
}
