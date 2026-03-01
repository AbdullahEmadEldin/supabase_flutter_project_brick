import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final Color? backgroundColor;
  final Color? borderColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final bool? obscureText;
  final TextEditingController? controller;
  final int? maxLines;
  final double? borderWidth;
  final bool readOnly;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool? autofocus;
  final String? initialValue;
  final bool unfocusOnTapUpOutside;
  final double? maxHeight;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final TextDirection? textDirection;
  final double? borderRadius;

  const InputField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.textStyle,
    this.contentPadding,
    this.readOnly = false,
    this.validator,
    this.backgroundColor,
    this.borderColor,
    this.suffixIcon,
    this.prefixIcon,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.obscureText,
    this.controller,
    this.maxLines,
    this.borderWidth,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.autofocus = false,
    this.initialValue,
    this.unfocusOnTapUpOutside = true,
    this.maxHeight,
    this.keyboardType,
    this.decoration,
    this.textDirection,
    this.borderRadius,
  });

  static InputDecoration defaultDecoration(
    BuildContext context, {
    required String hintText,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? backgroundColor,
    Color? borderColor,
    double? borderWidth,
    EdgeInsetsGeometry? contentPadding,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    double? borderRadius,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.surfaceDim,
          ),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      filled: true,
      fillColor: backgroundColor ?? Colors.transparent,
      isDense: true,
      errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 13.0),
      enabledBorder: enabledBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
            borderSide: BorderSide(
              width: borderWidth ?? 0.9,
              color: borderColor ?? Colors.white,
            ),
          ),
      focusedBorder: focusedBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
            borderSide: BorderSide(
              width: borderWidth ?? 0.9,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
      errorBorder: errorBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
            borderSide: const BorderSide(width: 0.9, color: Colors.red),
          ),
      focusedErrorBorder: errorBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
            borderSide: const BorderSide(width: 0.9, color: Colors.red),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget field = TextFormField(
      initialValue: initialValue,
      keyboardType: keyboardType,
      onTapUpOutside: (event) => unfocusOnTapUpOutside
          ? FocusManager.instance.primaryFocus?.unfocus()
          : null,
      readOnly: readOnly,
      focusNode: focusNode,
      autofocus: autofocus ?? false,
      textInputAction: textInputAction,
      textCapitalization: TextCapitalization.sentences,
      textDirection: textDirection,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      obscuringCharacter: '*',
      style: textStyle ??
          Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
      maxLines: maxHeight != null ? null : maxLines,
      decoration: decoration ??
          defaultDecoration(
            context,
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            backgroundColor: backgroundColor,
            borderColor: borderColor,
            borderWidth: borderWidth,
            contentPadding: contentPadding,
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
            errorBorder: errorBorder,
            borderRadius: borderRadius,
          ),
    );

    if (maxHeight != null) {
      return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight!),
        child: field,
      );
    }

    return field;
  }
}
