import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class CategoriessectionItemWidget extends StatelessWidget {
  const CategoriessectionItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38.h,
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: 38.h,
          child: Text(
            "Films",
            style: theme.textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}