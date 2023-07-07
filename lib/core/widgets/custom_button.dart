import 'package:flutter/material.dart';
import 'package:seyamy/core/utils/app_colors.dart';
import 'package:seyamy/core/utils/helper.dart';

class CustomButton extends StatefulWidget {
  final Color? color;
  final String text;
  final double? borderRadius;
  final double? width;
  final double? width2;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.text,
    this.color,
    required this.onTap,
    this.borderRadius,
    this.width,
    this.width2,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
          color: widget.color ?? AppColors.bottomColor,
          boxShadow: [
            BoxShadow(
              color: widget.color?.withOpacity(.5) ??
                  AppColors.bottomColor.withOpacity(.5),
              offset: const Offset(0, 4),
              blurRadius: 20,
            )
          ],
        ),
        width: _isPressed
            ? widget.width2 ?? context.width * .5
            : widget.width ?? context.width * .6,
        height: _isPressed ? context.height * .05 : context.height * .06,
        child: Center(
          child: Text(
            widget.text,
            style: context.button(),
          ),
        ),
      ),
    );
  }
}
