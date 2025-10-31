import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vistas_del_rio_1/core/config/providers/bloc_provider.dart';
import 'package:vistas_del_rio_1/core/config/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProvider,
      child: mateApp()
    );
  }

  Widget mateApp() => MaterialApp(
      title: 'Vistas Del Rio 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      
      routes: appRoutes(),
      initialRoute: 'login',
    );
}
