import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nagi_network/appModule/ui/home_page.dart';
import 'package:nagi_network/cubit/theme.dart';
import 'package:nagi_network/routes/app_routes.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'cubit/cubit_class.dart';
import 'appModule/ui/app_nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final theRoute = AllRoutes();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (BuildContext context) => ThemeCubit(),
      ),
      BlocProvider(
        create: (BuildContext context) => Counter(),
      ),
      BlocProvider(
        create: (BuildContext context) => NewCounterCubit(),
      )
    ], child: Landing());
  }
}

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      bloc: BlocProvider.of<ThemeCubit>(context),
      // bloc: ThemeCubit(),
      builder: (context, state) {
        debugPrint(state.toString());
        return MaterialApp(
          // theme: ThemeData.dark(),
          // theme: ThemeData.light(),
          // darkTheme: ThemeData.dark(),
          theme: state == true ? ThemeData.dark() : ThemeData.light(),
          home: HomeBloc(),
        );
      },
      // buildWhen: (previous, current) {
      //   if (current != previous) {
      //     // ThemeData.dark();
      //     return true;
      //   }
      //   else{
      //     // ThemeData.light();
      //     return false;
      //   }
      // },
    );
  }
}
