import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vistas_del_rio_1/core/models/login_user.model.dart';
import 'package:vistas_del_rio_1/core/models/resp_login.model.dart';

class AuthService {
  final String baseUrl = 'http://10.0.2.2:3000';

  Future<RespLoginModel> login(LoginUserModel user) async {
    final url = Uri.parse('$baseUrl/login-user');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': user.email,
        'password': user.password,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return RespLoginModel.fromJson(data);
    } else {
      throw Exception('Error al iniciar sesión: ${response.body}');
    }
  }
}
