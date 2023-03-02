
import 'package:flutter/material.dart';
import 'package:phone_number_example/core/resource/app_color.dart';
import 'package:phone_number_example/core/utils/app_extension.dart';





typedef OnDateSelected = Function(DateTime dateSelected);
typedef OnClearDateCallback = Function();

class DatePickerButton extends StatefulWidget {
  final OnDateSelected onDateSelected;
  final OnClearDateCallback onClearDate;

  final TextEditingController? controller;
  final String? title;
  final String? initialValue;
  final Color? color;
  final double size;
  final DateTime? firstDate;

  const DatePickerButton({
    Key? key,
    this.title = "Date",
    this.initialValue = " ",
    required this.onDateSelected,
    required this.onClearDate,
    this.controller,
    this.size = 12,
    this.color = AppColors.txtHint,
    this.firstDate,
  }) : super(key: key);

  @override
  State<DatePickerButton> createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  // bool _isSetTime = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        InkWell(
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: widget.firstDate ?? DateTime(2022),
              lastDate: DateTime(2025),
            );
            if (picked != null) {
              setState(() {
                // _isSetTime = true;
              });

              widget.controller?.text = picked.yyyyMMdd();
              widget.onDateSelected(picked); // just do this
            }
          },
          child: TextFormField(
            controller: widget.controller,
            readOnly: true,
            enabled: false,
            style: const TextStyle(fontSize: 12),
            decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.grey),
                // border: InputBorder.none,
                border:  const OutlineInputBorder(
                    borderSide:  BorderSide(color: Colors.grey)
                ),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.grey)),
              label: Text(
                widget.title!,
                style: const TextStyle(color: AppColors.txtHint),
              ),
            ),
          ),
        ),
        widget.controller?.text == " " ||
                widget.controller?.text == "Anytime" ||
                widget.controller?.text == "anyTime"
            ? Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.grey.withOpacity(0.5),
                ),
            )
            : IconButton(
                onPressed: () {
                  setState(() {

                    widget.controller?.text = " ";

                    widget.onClearDate();
                  });
                },
                icon: const Icon(Icons.clear),
              ),
      ],
    );
  }
}
