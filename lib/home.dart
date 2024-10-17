import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app_block/bloc/bloc.dart';
import 'package:quote_app_block/bloc/event.dart';
import 'package:quote_app_block/bloc/state.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Today's Quote",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      (context).read<QuoteBloc>().add(FetchQuote());
                    },
                    icon: const Icon(Icons.refresh))
              ],
            ),
            BlocBuilder<QuoteBloc, QuoteState>(builder: (context, state) {
              if (state is Success) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.red)),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.randomQuote.content,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          state.randomQuote.author,
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      )
                    ],
                  ),
                );
              } else if (state is Error) {
                return Text(
                  (state).message,
                  style: TextStyle(color: Colors.red),
                );
              } else {
                return const CircularProgressIndicator();
              }
            })
          ]),
        ),
      ),
    );
  }
}
