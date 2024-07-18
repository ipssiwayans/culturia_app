import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    this.alignment,
    this.width,
    this.boxDecoration,
    this.focusNode,
    this.icon,
    this.autofocus = false,
    this.textStyle,
    this.hintText,
    this.hintStyle,
    this.items,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
});

  final Alignment? alignment;

  final double? width;

  final BoxDecoration? boxDecoration;

  final FocusNode? focusNode;

  final Widget? icon;

  final bool? autofocus;

  final TextStyle? textStyle;

  final String? hintText;

  final TextStyle? hintStyle;

  final List<String>? items;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(alignment: alignment ?? Alignment.center, child: dropDownWidget)
        : dropDownWidget;
  }

  Widget get dropDownWidget => Container(
    width: width ?? double.maxFinite,
    decoration: boxDecoration,
    child: DropdownButtonFormField(
      focusNode: focusNode,
      icon: icon,
      autofocus: autofocus!,
      style: textStyle ?? theme.textTheme.bodyMedium,
      hint: Text(
        hintText ?? '',
        style: hintStyle ?? theme.textTheme.bodyMedium,
      ),
      items: items?.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: hintStyle ?? theme.textTheme.bodyMedium,
          ),
        );
      }).toList(),
      decoration: decoration,
      validator: validator,
      onChanged: (value) {
        onChanged!(value.toString());
      },
    ),
  );
  InputDecoration get decoration => InputDecoration(
    prefixIcon: prefix,
    prefixIconConstraints: prefixConstraints,
    suffixIcon: suffix,
    suffixIconConstraints: suffixConstraints,
    isDense: true,
    contentPadding: contentPadding ?? EdgeInsets.all(14.h),
    fillColor: fillColor ?? appTheme.gray400.withOpacity(0.15),
    filled: filled,
    border: borderDecoration ??
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.h),
        borderSide: BorderSide.none,
      ),
      enabledBorder: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
          borderSide: BorderSide.none,
        ),
        focusedBorder: borderDecoration ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.h),
            borderSide: BorderSide.none,
          ),
  );
}