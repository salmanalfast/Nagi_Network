import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nagi_network/cubit/cubit_class.dart';

class CountViewer extends StatelessWidget {
  const CountViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<Counter, dynamic>(
              builder: (context, state) {
                return Text("$state");
              },
            ),
            BlocBuilder<NewCounterCubit, int>(
              builder: (context, state) {
                return Text(
                  "$state",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
