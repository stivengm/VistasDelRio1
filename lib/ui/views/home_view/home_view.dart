import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vistas_del_rio_1/core/models/resp_login.model.dart';
import 'package:vistas_del_rio_1/core/services/preferences_service.dart';
import 'package:vistas_del_rio_1/ui/widgets/header_section.widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String firstName = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    setState(() => _isLoading = true);

    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user_data');

    if (userJson != null) {
      final Map<String, dynamic> data = jsonDecode(userJson);
      final user = RespLoginModel.fromJson(data);

      final fullName = user.data.fullName;
      final nameParts = fullName.split(' ');

      setState(() {
        firstName = nameParts.isNotEmpty ? nameParts.first : '';
        _isLoading = false;
      });
    } else {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _onRefresh() async {
    await _loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          firstName.isNotEmpty ? "Hola, $firstName 👋" : "Cargando...",
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menú principal',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Cerrar sesión'),
              onTap: () async {
                await PreferencesService().clearUserData();
                setState(() {
                  firstName = '';
                });

                Navigator.of(context).pushNamedAndRemoveUntil('login', (route) => false);
              },
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                children: const [
                  
                  HeaderSectionWidget(titleSection: "Próximos eventos"),
                  HeaderSectionWidget(titleSection: "Notificaciones sobre pisos y demás"),
                  HeaderSectionWidget(titleSection: "Estados de cuentas de mi apartamento"),
                  HeaderSectionWidget(titleSection: "Bienvenido al panel principal"),
                ],
              ),
      ),
    );
  }
}
