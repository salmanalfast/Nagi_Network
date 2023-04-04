import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nagi_network/appModule/ui/counter_saver.dart';
import 'package:nagi_network/cubit/cubit_class.dart';
import 'package:nagi_network/cubit/theme.dart';

class HomeBloc extends StatelessWidget {
  HomeBloc({super.key});
  final Counter counter = Counter();
  // final ThemeCubit themeCubit = ThemeCubit();
  @override
  Widget build(BuildContext context) {
    // Counter counter = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BlocBuilder<ThemeCubit, bool>(
          // Definisikan bloc yang sama
          bloc: BlocProvider.of<ThemeCubit>(context),
          builder: (context, state) {
            return IconButton(
                onPressed: () {
                  // debugPrint(state.toString());
                  // themeCubit.changeTheme();
                  BlocProvider.of<ThemeCubit>(context).changeTheme();
                },
                icon: Icon(Icons.format_paint_rounded));
          },
        ),
      ),
      floatingActionButton: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                  value: counter,
                  child: CountViewer(),
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: () => counter.decrement(),
                  borderRadius: BorderRadius.circular(20),
                  child: const SizedBox(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.remove_outlined),
                  ),
                ),
              ),
              Material(
                color: Colors.amberAccent,
                child: SizedBox(
                    height: 50,
                    width: 100,
                    child: BlocConsumer<Counter, dynamic>(
                      bloc: counter,
                      builder: (context, state) {
                        return Text(
                          "$state",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        );
                      },
                      listener: (context, state) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text("Even Number")));
                      },
                      listenWhen: (previous, current) {
                        if (current % 2 == 0) {
                          return true;
                        } else {
                          return false;
                        }
                      },
                    )),
              ),
              Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: () => counter.increment(),
                  borderRadius: BorderRadius.circular(20),
                  child: const SizedBox(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.add_outlined),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
