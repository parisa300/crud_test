
import 'package:flutter/material.dart';

import '../../../../core/resource/app_color.dart';
import '../../../../core/utils/app_decoration.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool? isExpand;
  final Color? color;
  final String icons;
  final VoidCallback? onPressed;
  final bool isCloseKeyboardAfterClick;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isExpand = true,
    this.color,
    this.icons="",
    this.isCloseKeyboardAfterClick = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (isCloseKeyboardAfterClick) FocusScope.of(context).unfocus();
          onPressed!();
        },
        child: Container(
            padding: const EdgeInsets.all(8),
            decoration: _isHasColor()
                ? BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(36)))
                : AppDecoration.shapeGradiant(
                gradiant: AppColors.createSecondaryGradient(),

                radius: AppDecoration.radiusButton),
            child: Center(
              child: Text(title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
            )));
  }

  bool _isHasColor() {
    return color != null;
  }
}
