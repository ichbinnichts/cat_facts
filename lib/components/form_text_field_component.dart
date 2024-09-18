import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? textController;
  final bool? obscureText;
  final TextInputType? inputType;
  final String? Function(String?)? inputValidator;
  final Icon? iconInput;
  final double? horizontalPadding;
  final void Function()? onTap;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;

  const FormTextField(
      {super.key,
      this.labelText,
      this.hintText,
      this.textController,
      this.obscureText,
      this.inputType,
      this.inputValidator,
      this.iconInput,
      this.horizontalPadding,
      this.onTap,
      this.textInputAction,
      this.onFieldSubmitted,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            horizontalPadding ?? 0,
        vertical: 10,
      ),
      child: TextFormField(
        controller: textController,
        onTap: onTap,
        keyboardType: inputType,
        decoration: InputDecoration(
          prefixIcon: iconInput,
          labelText: labelText,
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        obscureText: obscureText ?? false,
        validator: inputValidator,
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
