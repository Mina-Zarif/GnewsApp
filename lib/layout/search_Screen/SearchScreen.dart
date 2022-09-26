import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gnews/shared/cubit/cubit.dart';
import 'package:gnews/shared/cubit/states.dart';
import '../../shared/components/components.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class SearchScreen extends StatelessWidget {
  // const SearchScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {

        var list = AppCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.search_sharp),
            title: TextFormField(

              controller: searchController,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                AppCubit.get(context).getSearch(value);
              },
              decoration: InputDecoration(
                // prefix: Icon(Icons.search_sharp),
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
