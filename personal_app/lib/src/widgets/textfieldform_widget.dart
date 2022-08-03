import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatefulWidget {

  TextFormFieldWidget({
    Key? key,
    required this.labelTextField,
    required this.nameController,
    this.messageFlag,
  }) : super(key: key);

  String labelTextField;
  TextEditingController nameController = TextEditingController();
  bool? messageFlag = false;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidget();
}

class _TextFormFieldWidget extends State<TextFormFieldWidget> {
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.nameController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Required";
        } else {
          return null;
        }
      },
      style: const TextStyle(fontSize: 14.0),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xfff6f6f6),
        labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        alignLabelWithHint: true,
        labelText: widget.labelTextField,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: Color(0xfff6f6f6), width: 2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Color(0xff12bf42), width: 2),
        ),
      ),
      minLines: widget.messageFlag==true ? 4:null,
      maxLines: widget.messageFlag==true ? 6:null,
      keyboardType: widget.messageFlag==true ? TextInputType.multiline:TextInputType.name,
      textInputAction: widget.messageFlag==true ? TextInputAction.next:TextInputAction.none ,

    );
  }
}
