import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/gordi_colors.dart';

/// Labelled text field with optional hint below (uses the themed
/// InputDecoration for the field itself).
///
/// DS source: components/forms/Input.jsx + `.gds-field/.gds-input`.
class GordiInput extends StatelessWidget {
  const GordiInput({
    super.key,
    this.label,
    this.hint,
    this.placeholder,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.errorText,
    this.onChanged,
    this.textInputAction,
    this.autofillHints,
  });

  final String? label;

  /// Helper text shown under the field (`.gds-hint`).
  final String? hint;
  final String? placeholder;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: GoogleFonts.nunito(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: GordiColors.ink700,
            ),
          ),
          const SizedBox(height: 6),
        ],
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          onChanged: onChanged,
          textInputAction: textInputAction,
          autofillHints: autofillHints,
          style: GoogleFonts.nunito(
            fontSize: 16,
            color: GordiColors.ink900,
          ),
          decoration: InputDecoration(
            hintText: placeholder,
            errorText: errorText,
          ),
        ),
        if (hint != null) ...[
          const SizedBox(height: 6),
          Text(
            hint!,
            style: GoogleFonts.nunito(
              fontSize: 12,
              color: GordiColors.ink500,
            ),
          ),
        ],
      ],
    );
  }
}
