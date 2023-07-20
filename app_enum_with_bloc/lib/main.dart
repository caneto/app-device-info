import 'package:app_enum_with_bloc/blocs/selected/item_bloc.dart';
import 'package:app_enum_with_bloc/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Exemplo de Flutter: usando novas enumerações de Flutter com Bloc
void main() 
   => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // adicionar bloc provider
    return BlocProvider(
      create: (context) => SelectedBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}