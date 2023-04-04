import 'package:bloc/bloc.dart';

class Counter extends Cubit{
  Counter({this.count = 0}) : super(count);
  int count;

  void increment(){
    emit(state+1);
  }

  void decrement(){
    emit(state-1);
  }

  @override
  void onChange(Change change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}
class NewCounterCubit extends Cubit<int>{
  NewCounterCubit({this.count = 0}) : super(count);
  int count;

  void tambah() => emit(state + 1);
  void kurang() => emit(state - 1);
}