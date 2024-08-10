import 'package:flutter/material.dart';
import 'package:flutter_basics/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  final counterCubit = CounterBloc();
  final TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: editingController,
            decoration: const InputDecoration(hintText: "Label"),
          ),
          FloatingActionButton(
            onPressed: () {
              counterCubit.addList(editingController.text.trim());
            },
            child: const Icon(Icons.add),
          ),
          BlocListener<CounterBloc, List<Data>>(
            bloc: counterCubit,
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                  content: Text(state.toString()),
                ),
              );
            },
            child: Text(""),
          ),

        ],
      ),
    );
  }
}
