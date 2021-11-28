import 'package:bumper_demo/shared/app_text_style.dart';
import 'package:flutter/material.dart';

InputDecoration getInputOutlineDecoration(String label,
    {bool showHint = true, bool showLabel = true}) {
  const _defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: Colors.white, width: 1.0),
  );

  const _focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: Colors.blue, width: 1.0),
  );

  const _errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: Colors.red, width: 1.0),
  );
  return InputDecoration(
    labelText: showLabel ? label.toString() : null,
    labelStyle: AppTextStyle.normalRegular14,
    enabledBorder: _defaultBorder,
    disabledBorder: _defaultBorder,
    focusedBorder: _focusedBorder,
    errorBorder: _errorBorder,
    focusedErrorBorder: _errorBorder,
  );
}
