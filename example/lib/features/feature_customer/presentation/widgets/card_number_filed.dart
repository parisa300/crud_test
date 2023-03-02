
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_number_example/core/resource/app_color.dart';




class CardNumberFiled extends StatefulWidget {


  final TextEditingController? controller;
  final String? initialValue;
  final Color? color;
  const CardNumberFiled({
    Key? key,
    this.initialValue = " ",
    this.controller,
    this.color = AppColors.txtHint,

  }) : super(key: key);

  @override
  State<CardNumberFiled> createState() => _CardNumberFiledState();
}

class _CardNumberFiledState extends State<CardNumberFiled> {
  // bool _isSetTime = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CardNumberFormatter(),
      ],
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: 'XXXX XXXX XXXX XXXX',
        border:  OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.grey)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.grey)),
        hintStyle:   TextStyle(color: Colors.grey),
        contentPadding:  EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),

        labelText: 'Card Number',
      ),
      maxLength: 19,
      onChanged: (value) {},
    );

  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue previousValue,
      TextEditingValue nextValue,
      ) {
    var inputText = nextValue.text;

    if (nextValue.selection.baseOffset == 0) {
      return nextValue;
    }

    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return nextValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}
