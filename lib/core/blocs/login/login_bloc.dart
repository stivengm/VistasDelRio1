import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vistas_del_rio_1/core/models/login_user.model.dart';
import 'package:vistas_del_rio_1/core/models/resp_login.model.dart';
import 'package:vistas_del_rio_1/core/services/auth_service.dart';
import 'package:vistas_del_rio_1/core/services/preferences_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService _authService = AuthService();
  final PreferencesService _prefs = PreferencesService();
  
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  Future<RespLoginModel> login(LoginUserModel user) async {
    try {
      final result = await _authService.login(user);
      await _prefs.saveUserData(result);
      return result;
    } catch (e) {
      throw Exception('Error al hacer login: $e');
    }
  }

}
