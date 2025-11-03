import 'package:flutter/material.dart';
import 'package:vistas_del_rio_1/ui/utils/app_colors.dart';

class LoaderAppWidget extends StatelessWidget {
  const LoaderAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      color: Colors.black87,
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
