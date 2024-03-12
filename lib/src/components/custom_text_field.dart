import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:greengroocer/src/config/custom_colors.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final String? isFilled;
  final bool isEdditable;
  final List<TextInputFormatter>? inputFormatters;
  final Color newBackgroundColor;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.label,
    this.isSecret = false,
    this.inputFormatters,
    this.isFilled,
    this.isEdditable = true,
    required this.newBackgroundColor,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();

    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        style: TextStyle(color: widget.newBackgroundColor),
        enabled: widget.isEdditable ? true : false,
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        initialValue: widget.isFilled,
        decoration: InputDecoration(
          filled: true, // Define que o campo deve ser preenchid
          fillColor: widget.newBackgroundColor, // Cor de preenchimento
          prefixIcon: Icon(color: CustomColors.customWhitechColor, widget.icon),
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(
                    isObscure ? Icons.visibility_off : Icons.visibility,
                    color: CustomColors.customWhitechColor,
                  ),
                )
              : null,
          labelText: widget.label,
          labelStyle: TextStyle(
            color: Colors.white,
            decorationColor: CustomColors.customWhitechColor,
            backgroundColor: widget.newBackgroundColor,
          ),
          isDense: true,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide:
                BorderSide(width: 1, color: CustomColors.customWhitechColor),
          ),
        ),
      ),
    );
  }
}
