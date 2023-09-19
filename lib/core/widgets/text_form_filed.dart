import 'package:flutter/material.dart';
import 'package:seyamy/core/utils/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    this.hint,
    this.onSave,
    this.maxLines = 1,
    this.suffix,
    this.suffixPressed,
    this.maxLength,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.minLines,
    this.validation,
    this.suffixIcon,
    this.isPassword = false,
    this.readOnly = false,
    this.prefix,
    this.prefixIcon,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? hint;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final String? Function(String?)? validation;
  final String? Function(String?)? onSave;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final bool isPassword;
  final bool readOnly;
  final VoidCallback? suffixPressed;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChange;
  final GestureTapCallback? onTap;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      autofocus: false,
      cursorColor: AppColors.primaryColor,
      validator: widget.validation,
      obscureText: widget.isPassword ? _obsecureText : false,
      readOnly: widget.readOnly,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      maxLength: widget.maxLength,
      minLines: widget.minLines,
      onTap: widget.onTap,
      onSaved: widget.onSave,
      onFieldSubmitted: widget.onSubmit,
      onChanged: widget.onChange,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      autofillHints: const [
        AutofillHints.email,
        AutofillHints.password,
        AutofillHints.name,
        AutofillHints.addressCity,
      ],
      style: Theme.of(context).textTheme.labelSmall,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      // style: context.bodyText2(),
      decoration: InputDecoration(
        hintText: widget.hint,
        prefix: widget.prefix,
        prefixIcon: widget.prefixIcon,
        suffix: widget.suffix,
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  setState(() {
                    _obsecureText = !_obsecureText;
                  });
                },
                child: Icon(
                  _obsecureText ? Icons.remove_red_eye : Icons.visibility_off,
                  color: AppColors.primaryColor,
                  size: 18,
                ),
              )
            : widget.suffixIcon,
      ),
    );
  }
}
