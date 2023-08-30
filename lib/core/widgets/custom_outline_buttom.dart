import 'package:flutter/material.dart';
import 'package:seyamy/core/utils/app_colors.dart';
import 'package:seyamy/core/utils/helper.dart';

class CustomOutlineButton extends StatefulWidget {
  final Color? color;
  final String text;
  final double? borderRadius;
  final double? width;
  final double? width2;
  final VoidCallback onTap;
  final Widget? icon;

  const CustomOutlineButton({
    super.key,
    required this.text,
    this.color,
    required this.onTap,
    this.borderRadius,
    this.width,
    this.width2,
    this.icon,
  });

  @override
  State<CustomOutlineButton> createState() => _CustomOutlineButtonState();
}

class _CustomOutlineButtonState extends State<CustomOutlineButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? context.width * .6,
      height: context.height * .06,
      child: Column(
        children: [
          GestureDetector(
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
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.75,
                    color: widget.color ?? AppColors.bottomColor,
                  ),
                  borderRadius: BorderRadius.circular(10.05),
                ),
              ),
              width: _isPressed
                  ? widget.width2 ?? context.width * .5
                  : widget.width ?? context.width * .6,
              height: _isPressed ? context.height * .05 : context.height * .06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.icon == null
                    ? [
                        Text(
                          widget.text,
                          style: context.button().copyWith(
                                color: widget.color ?? AppColors.bottomColor,
                              ),
                        ),
                      ]
                    : [
                        widget.icon!,
                        8.width,
                        Text(
                          widget.text,
                          style: context.button().copyWith(
                                color: widget.color ?? AppColors.bottomColor,
                              ),
                        ),
                      ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
