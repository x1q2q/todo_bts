import 'package:flutter/material.dart';
import 'package:todo_bts/src/utils/extensions.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton(
      {super.key,
      this.isLoading = false,
      this.onPressed,
      this.label,
      this.btnStyle});
  final Widget? label;
  final bool isLoading;
  final ButtonStyle? btnStyle;
  final VoidCallback? onPressed;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: widget.btnStyle,
        onPressed: widget.isLoading ? null : widget.onPressed,
        child: widget.isLoading
            ? const CircularProgressIndicator(color: Colors.white)
                .addPd(all: 10)
            : widget.label!);
  }
}
