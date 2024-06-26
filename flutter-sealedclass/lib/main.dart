import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:union/src/cubit/cubit.dart';

import 'src/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BlocProvider(create: (c) => HomeCubit(), child: const HomePage()),
  ));
}
