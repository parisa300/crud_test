
import 'package:flutter/material.dart';

import '../../../../format_field.dart';




class UsernameField extends StatefulWidget {
  final String? initialValue;
  final String? hint;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const UsernameField({
    Key? key,
    this.initialValue,
    this.hint,
    this.controller,
    this.textInputAction,
    this.onChanged,
  }) : super(key: key);
  @override
  State<UsernameField> createState() => _UserNameFieldState();
}
  class _UserNameFieldState extends State<UsernameField> {
  @override
  void initState() {
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.textInputAction,
      controller: widget.controller,
      onChanged: (String text) {
        setState(() {});
        if (widget.onChanged != null) widget.onChanged!(text);
      },
      initialValue: widget.initialValue,
      keyboardType: TextInputType.emailAddress,
      validator: (String? text) {
        return text!.isNotEmpty ? null : "username is required";
      },
      inputFormatters: [
        FormatField.emailRegex,
      ],
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
