import 'package:flutter/material.dart';
import 'package:vistas_del_rio_1/ui/views/home_view/home_view.dart';
import 'package:vistas_del_rio_1/ui/views/login_view/login_view.dart';

Map<String, WidgetBuilder> appRoutes() => <String, WidgetBuilder> {
  'login': ( _ ) => const LoginView(),
  'home': ( _ ) => const HomeView(),
};