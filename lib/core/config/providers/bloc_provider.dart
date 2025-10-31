import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vistas_del_rio_1/core/blocs/home/home_bloc.dart';
import 'package:vistas_del_rio_1/core/blocs/login/login_bloc.dart';

final List<BlocProvider> blocProvider = [
  BlocProvider<LoginBloc>(create: ( _ ) => LoginBloc()),
  BlocProvider<HomeBloc>(create: ( _ ) => HomeBloc()),
];