import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promptia/core/core.dart';

class AuthField extends ConsumerStatefulWidget {
  final bool isPasswordField;
  final String label, hintText;
  final ValiatorCallback onValidate;
  final TextEditingController controller;
  const AuthField({
    super.key,
    required this.label,
    required this.hintText,
    this.isPasswordField = false,
    required this.onValidate,
    required this.controller,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthFieldState();
}

class _AuthFieldState extends ConsumerState<AuthField> {
  final double n10 = NumberConstants.n10;
  bool ishide = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.onValidate,
      obscureText: widget.isPasswordField ? ishide : false,
      controller: widget.controller,
      decoration: InputDecoration(
        label: Text(widget.label),
        hintText: widget.hintText,
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: Icon(
                  color: AppColor.blackColor,
                  ishide ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    ishide = !ishide;
                  });
                },
              )
            : null,
      ),
    );
  }
}
