import 'dart:math';
import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lister/variables.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    // My arguments
    this.generalColor,
    // Common arguments TextField
    this.controller,
    this.focusNode,
    this.decoration = const InputDecoration(),
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.showCursor,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforced = true,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.selectionHeightStyle = ui.BoxHeightStyle.tight,
    this.selectionWidthStyle = ui.BoxWidthStyle.tight,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.onTap,
    this.mouseCursor,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints,
    this.restorationId,
    // Common arguments InputDecoration
    this.icon,
    this.labelText,
    this.labelStyle,
    this.helperText,
    this.helperStyle,
    this.helperMaxLines,
    this.hintText,
    this.hintStyle,
    this.hintTextDirection,
    this.hintMaxLines,
    this.errorText,
    this.errorStyle,
    this.errorMaxLines,
    this.hasFloatingPlaceholder = true,
    this.floatingLabelBehavior,
    this.isCollapsed = false,
    this.isDense,
    this.contentPadding,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.prefix,
    this.prefixText,
    this.prefixStyle,
    this.suffixIcon,
    this.suffix,
    this.suffixText,
    this.suffixStyle,
    this.suffixIconConstraints,
    this.counter,
    this.counterText,
    this.counterStyle,
    this.filled,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.enabledBorder,
    this.border,
    this.semanticCounterText,
    this.alignLabelWithHint,
  }) : super(key: key);

  final Color? generalColor;

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool? autofocus;
  final String? obscuringCharacter;
  final bool? obscureText;
  final bool? autocorrect;
  final bool? enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final bool readOnly;
  final bool? showCursor;
  static const int noMaxLength = -1;
  final int? maxLength;
  final bool maxLengthEnforced;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final ui.BoxHeightStyle selectionHeightStyle;
  final ui.BoxWidthStyle selectionWidthStyle;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final DragStartBehavior dragStartBehavior;
  bool get selectionEnabled => enableInteractiveSelection;
  final GestureTapCallback? onTap;
  final MouseCursor? mouseCursor;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  final Iterable<String>? autofillHints;
  final String? restorationId;

  final Widget? icon;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? helperText;
  final TextStyle? helperStyle;
  final int? helperMaxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextDirection? hintTextDirection;
  final int? hintMaxLines;
  final String? errorText;
  final TextStyle? errorStyle;
  final int? errorMaxLines;
  final bool hasFloatingPlaceholder;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool? isDense;
  final EdgeInsetsGeometry? contentPadding;
  final bool isCollapsed;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final Widget? prefix;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final BoxConstraints? suffixIconConstraints;
  final String? counterText;
  final Widget? counter;
  final TextStyle? counterStyle;
  final bool? filled;
  final Color? fillColor;
  final Color? focusColor;
  final Color? hoverColor;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final String? semanticCounterText;
  final bool? alignLabelWithHint;

  @override
  Widget build(BuildContext context) {
    final borderSide = BorderSide(
      style: BorderStyle.solid,
      width: 0,
      color: generalColor ??
          (currentThemeLight ? defaultLightColors[2]! : defaultDarkColors[2]!),
    );
    return TextField(
      controller: this.controller,
      focusNode: this.focusNode,
      decoration: InputDecoration(
        alignLabelWithHint: this.alignLabelWithHint,
        border: this.border ?? OutlineInputBorder(borderSide: borderSide),
        contentPadding: this.contentPadding,
        counter: this.counter,
        counterStyle: this.counterStyle,
        counterText: this.counterText,
        disabledBorder: this.disabledBorder,
        enabled: this.enabled ?? true,
        enabledBorder:
            this.enabledBorder ?? OutlineInputBorder(borderSide: borderSide),
        errorBorder: this.errorBorder,
        errorMaxLines: this.errorMaxLines,
        errorStyle: this.errorStyle,
        errorText: this.errorText,
        fillColor: this.fillColor,
        filled: this.filled,
        floatingLabelBehavior: this.floatingLabelBehavior,
        focusColor: this.focusColor,
        focusedBorder:
            this.focusedBorder ?? OutlineInputBorder(borderSide: borderSide),
        focusedErrorBorder: this.focusedErrorBorder,
        helperMaxLines: this.helperMaxLines,
        helperStyle: this.helperStyle,
        helperText: this.helperText,
        hintMaxLines: this.hintMaxLines,
        hintStyle: this.hintStyle ?? TextStyle(fontSize: fontSize2),
        hintText: this.hintText ?? allHints[Random().nextInt(allHints.length)],
        hintTextDirection: this.hintTextDirection,
        hoverColor: this.hoverColor,
        icon: this.icon,
        isCollapsed: this.isCollapsed,
        isDense: this.isDense,
        labelStyle: this.labelStyle ??
            TextStyle(
              color: generalColor ??
                  (currentThemeLight
                      ? defaultLightColors[2]!
                      : defaultDarkColors[2]!),
              fontSize: fontSize2,
            ),
        labelText: this.labelText,
        prefix: this.prefix,
        prefixIcon: this.prefixIcon,
        prefixIconConstraints: this.prefixIconConstraints,
        prefixStyle: this.prefixStyle,
        prefixText: this.prefixText,
        semanticCounterText: this.semanticCounterText,
        suffix: this.suffix,
        suffixIcon: this.suffixIcon,
        suffixIconConstraints: this.suffixIconConstraints,
        suffixStyle: this.suffixStyle,
        suffixText: this.suffixText,
      ),
      textInputAction: this.textInputAction,
      textCapitalization: this.textCapitalization,
      style: this.style ??
          TextStyle(
            color: generalColor ??
                (currentThemeLight
                    ? defaultLightColors[2]!
                    : defaultDarkColors[2]!),
            fontSize: fontSize2,
          ),
      strutStyle: this.strutStyle,
      textAlign: this.textAlign ?? TextAlign.center,
      textAlignVertical: this.textAlignVertical ?? TextAlignVertical.center,
      textDirection: this.textDirection,
      readOnly: this.readOnly,
      showCursor: this.showCursor,
      autofocus: this.autofocus ?? true,
      obscuringCharacter: this.obscuringCharacter ?? '•',
      obscureText: this.obscureText ?? false,
      autocorrect: this.autocorrect ?? true,
      enableSuggestions: this.enableSuggestions ?? true,
      maxLines: this.maxLines,
      minLines: this.minLines,
      expands: this.expands,
      maxLength: this.maxLength,
      onChanged: this.onChanged,
      onEditingComplete: this.onEditingComplete,
      onSubmitted: this.onSubmitted,
      onAppPrivateCommand: this.onAppPrivateCommand,
      inputFormatters: this.inputFormatters,
      enabled: this.enabled,
      cursorWidth: this.cursorWidth,
      cursorHeight: this.cursorHeight,
      cursorRadius: this.cursorRadius,
      cursorColor: this.cursorColor ??
          generalColor ??
          (currentThemeLight ? defaultLightColors[2]! : defaultDarkColors[2]!),
      selectionHeightStyle: this.selectionHeightStyle,
      selectionWidthStyle: this.selectionWidthStyle,
      keyboardAppearance: this.keyboardAppearance,
      scrollPadding: this.scrollPadding,
      dragStartBehavior: this.dragStartBehavior,
      enableInteractiveSelection: enableInteractiveSelection,
      selectionControls: this.selectionControls,
      onTap: this.onTap,
      mouseCursor: this.mouseCursor,
      buildCounter: this.buildCounter,
      scrollController: this.scrollController,
      scrollPhysics: this.scrollPhysics,
      autofillHints: this.autofillHints,
      restorationId: this.restorationId,
    );
  }
}

List allHints = [
  'Помыть посуду',
  'Сходить в магазин',
  'Сделать отчёт',
  'Выполнить план',
  'Прочитать книгу',
  'Купить оливки',
  'Попить воды',
  'Попрактиковаться',
  'Позаниматься спортом',
  '╰(*°▽°*)╯',
];
