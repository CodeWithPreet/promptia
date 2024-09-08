import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promptia/core/core.dart';

class PromptField extends ConsumerWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final ValiatorCallback onValidate;
  final bool isPromptField;
  const PromptField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.onValidate,
    this.isPromptField = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      // write text field size increase
      maxLines: isPromptField ? 10 : 1,

      minLines: isPromptField ? 6 : 1,
      maxLength: isPromptField ? 500 : 50,

      validator: onValidate,
      controller: controller,
      decoration: InputDecoration(
        label: Text(
          label,
        ),
        hintText: hintText,
      ),
    );
  }
}
