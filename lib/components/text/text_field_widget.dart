import 'package:flutter/material.dart';
import 'package:hw2/components/text/text_widget.dart';
import 'package:hw2/constants/constants.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {super.key,
      required this.preIcon,
      required this.hint,
      required this.lable, this.maxLines = 1, this.controller});

  final String lable;
  final Icon preIcon;
  final String hint;
  final int maxLines;
  final TextEditingController? controller;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.orange,
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextWidget(
            text: widget.lable,
            size: 20,
            isBold: true,
          ),
          height8,
          TextFormField(
            controller: widget.controller ,
            cursorColor: Colors.orange,
            decoration: InputDecoration(
              hintText: widget.hint,
              enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),borderSide: const BorderSide(color: Colors.orange)),
              focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
              prefixIcon: widget.preIcon,
              prefixIconColor: Colors.orange,
              suffixIconColor: Colors.orange,
              suffixIcon: (widget.lable.toLowerCase().compareTo("password") == 0) ? GestureDetector( onTap: () => setState(() {
                            isVisible = !isVisible;
                          }),
                          child: isVisible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),)
                          : null,
                          
            ),
            maxLines: widget.maxLines,
            minLines: 1,
            obscureText: widget.lable.toLowerCase().compareTo("password") == 0 && !isVisible,
          ),
        ],
      ),
    );
  }
}
