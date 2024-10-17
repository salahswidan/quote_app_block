import 'package:flutter/material.dart';
import 'package:quote_app_block/bloc/bloc.dart';
import 'package:quote_app_block/bloc/event.dart';
import 'home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<QuoteBloc>(
          create: (context) => QuoteBloc()..add(FetchQuote()),
          child: const MyHomePage()),
    );
  }
}
