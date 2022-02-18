import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String labelText;
  final bool isPassword;
  final FocusNode focusNode;
  const CustomTextFormField(
      {Key? key,
      required this.controller,
      required this.textInputType,
      required this.labelText,
      this.isPassword = false,
      required this.focusNode})
      : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool passVis;

  @override
  void initState() {
    super.initState();
    passVis = widget.isPassword == true ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey.shade400)),
      child: Container(
        decoration: BoxDecoration(
            border: widget.focusNode.hasFocus
                ? Border(
                    left:
                        BorderSide(width: 4, color: Colors.lightBlue.shade600),
                  )
                : null),
        child: Padding(
          padding: context.paddingLow,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "This field can not be empty";
              }
              if (value.length < 6) {
                return "This field can not be less than 6";
              }
              if (value.length > 20) {
                return "This field can not be greater than 20";
              }
            },
            focusNode: widget.focusNode,
            controller: widget.controller,
            keyboardType: widget.textInputType,
            obscureText: passVis,
            decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: Theme.of(context).textTheme.headline6,
              border: InputBorder.none,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          passVis = !passVis;
                        });
                      },
                      icon: passVis == true
                          ? const Icon(Icons.visibility_off)
                          : const Icon(
                              Icons.visibility,
                            ))
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
