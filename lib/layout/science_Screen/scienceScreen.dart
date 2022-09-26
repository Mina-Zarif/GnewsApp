import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gnews/shared/components/components.dart';
import 'package:gnews/shared/cubit/cubit.dart';
import 'package:gnews/shared/cubit/states.dart';

// ignore: camel_case_types
class scienceScreen extends StatelessWidget {
  const scienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = AppCubit.get(context).science;

        return articleBuilder(list,Center(child: CircularProgressIndicator()));
      },
    );
  }
}
