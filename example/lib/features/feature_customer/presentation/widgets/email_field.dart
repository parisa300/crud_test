
import 'package:flutter/material.dart';
import 'package:phone_number_example/core/utils/app_extension.dart';
import 'package:phone_number_example/format_field.dart';



class EmailField extends StatefulWidget {
  final String label;
  final String? hint;

  final Widget? suffixIcon;
  final bool autoFocus;
  final String? initialValue;
  final bool? enabled;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final bool isVisibleStar;

  const EmailField({
    Key? key,
    this.label = "Email",
    this.hint,
    this.textInputAction,
    this.onChanged,
    this.suffixIcon,
    this.initialValue,
    this.autoFocus = false,
    this.isVisibleStar = false,
    this.enabled,
    this.contentPadding,
    required this.controller,
    this.maxLength,
  }) : super(key: key);

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      keyboardType: TextInputType.emailAddress,
      autofocus: widget.autoFocus,
      onChanged: (String text) {
        setState(() {});
        if (widget.onChanged != null) widget.onChanged!(text);
      },
      inputFormatters: [
        FormatField.emailRegex,
      ],
      validator: (String? text) {
        if (text!.isEmpty) {
          return "Email empty";
        } else {
          bool isValid = widget.controller.text.isValidEmail();
          return isValid ? null : "Email not valid";
        }
      },
      enabled: widget.enabled,
      maxLength: widget.maxLength,
      decoration:  InputDecoration(
        hintText: widget.hint,
        border:  const OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.grey)
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.grey)),
        hintStyle:  const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
      ),
    );
  }


}
