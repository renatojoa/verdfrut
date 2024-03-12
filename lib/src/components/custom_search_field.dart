import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSearchField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;

  const CustomSearchField({
    super.key,
    required this.icon,
    required this.label,
    this.isSecret = false,
    this.inputFormatters,
  });

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
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
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon:
                      Icon(isObscure ? Icons.visibility_off : Icons.visibility),
                )
              : null,
          labelText: widget.label,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
