import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gnews/shared/cubit/cubit.dart';
import 'package:gnews/shared/cubit/states.dart';
import '../../shared/components/components.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class SearchScreen extends StatelessWidget {
  // const SearchScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var list = AppCubit.get(context).search;

    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.search_sharp),
            title: TextFormField(
              style: TextStyle(color: Colors.grey),
              controller: AppCubit.get(context).searchController,

              keyboardType: TextInputType.text,
              onChanged: (value) {
                AppCubit.get(context).getSearch(value);
                print(value);
                print('text ${AppCubit.get(context).searchController.text}');
                },
              decoration: InputDecoration(

              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.grey),
                ),
              ),

            ),

          body: Column(
            children: [
              Expanded(child: articleBuilder(
                list,
                Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search, color: Colors.grey,size: 60,),
                    Text('Search...',style: TextStyle(color: Colors.grey,fontSize: 25),)
                  ],
                ),
                    ),
                  )
                )

            ],
          )
        );
      },
    );
  }
}
