import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Cubit<List<Data>> {
  CounterBloc() : super([]);

  void addList(String title){
    state.add(Data.getData(title));
    emit([...state]);
  }

}

class Data{
  final String title;
  final String date;

  Data(this.title, this.date);
  factory Data.getData(String tt){
    return Data(tt, DateTime.now().toString());
  }
}