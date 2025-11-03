
class RespLoginModel {
  final String code;
  final String message;
  final UserDataModel data;

  RespLoginModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory RespLoginModel.fromJson(Map<String, dynamic> json) {
    return RespLoginModel(
      code: json['code']?.toString() ?? '',
      message: json['message']?.toString() ?? '',
      data: UserDataModel.fromJson(json['data'] as Map<String, dynamic>? ?? <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'data': data.toJson(),
    };
  }

  @override
  String toString() {
    return 'RespLoginModel(code: $code, message: $message, data: ${data.toString()})';
  }
}

class UserDataModel {
  final String id;
  final int torre;
  final int apartamento;
  final String fullName;
  final String email;
  final String phone;
  final int roleId;
  final String roleName;

  UserDataModel({
    required this.id,
    required this.torre,
    required this.apartamento,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.roleId,
    required this.roleName,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id']?.toString() ?? '',
      torre: _parseInt(json['torre']),
      apartamento: _parseInt(json['apartamento']),
      fullName: json['fullName']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      roleId: _parseInt(json['roleId']),
      roleName: json['roleName']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'torre': torre,
      'apartamento': apartamento,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'roleId': roleId,
      'roleName': roleName,
    };
  }

  @override
  String toString() {
    return 'UserDataModel(fullName: $fullName, email: $email, role: $roleName)';
  }

  // Helper to parse ints that might come as String or int or null
  static int _parseInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    final parsed = int.tryParse(value.toString());
    return parsed ?? 0;
  }
}
