import 'package:academia_centrals/MyTheme/theme_extension.dart';
import 'package:flutter/material.dart';

class CustomDropdownButtonFormField extends StatelessWidget {
  final List<DropdownMenuItem<int>> items;
  final int value;
  final Function(int?) onChanged;
  final String hintText;
  final String labelText;
  final Color? hintColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? fillColor;
  final Color? primaryColor;

  const CustomDropdownButtonFormField({
    Key? key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.hintText,
    this.hintColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.fillColor,
    this.primaryColor,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      value: value,
      onChanged: onChanged,
      items: items,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
            color: context.customTheme.textColor,
            fontSize: 14,
            fontWeight: FontWeight.w400),
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.5,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.5,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: fillColor,
        filled: true,
      ),
      dropdownColor: fillColor,
      icon: Icon(
        Icons.arrow_drop_down,
        color: primaryColor,
      ),
    );
  }
}
