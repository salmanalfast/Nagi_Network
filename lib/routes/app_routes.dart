import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nagi_network/appModule/ui/counter_saver.dart';
import 'package:nagi_network/appModule/ui/home_page.dart';
import 'package:nagi_network/cubit/cubit_class.dart';
import 'package:nagi_network/routes/404.dart';

class AllRoutes {
  final Counter counter = Counter();

  Route pageRouter(RouteSettings router) {
    switch (router.name) {
      case "home/":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: counter,
            child: HomeBloc(),
          ),
        );
      case "viewer/":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: counter,
            child: const CountViewer(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFound(),
        );
    }
  }
}
