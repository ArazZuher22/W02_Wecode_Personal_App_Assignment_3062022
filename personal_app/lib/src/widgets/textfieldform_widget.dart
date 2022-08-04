import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatefulWidget {

  TextFormFieldWidget({
    Key? key,
    required this.labelTextField,
    required this.nameController,
    this.messageFlag,
    this.isPasswordFlag
  }) : super(key: key);

  String labelTextField;
  TextEditingController nameController = TextEditingController();
  bool? messageFlag = false;// message flag for multiline textfield
  bool? isPasswordFlag = false;// password flag used when your textfield should be password

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidget();
}

class _TextFormFieldWidget extends State<TextFormFieldWidget> {
  
  bool _isObscure = true;// used when our textfield isPasswordFlag = true 

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.nameController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Required";
        }else if (widget.isPasswordFlag ==true && value.length < 8) {
          return "Password length less than 8 ";
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

        // for passowrd icon 
        suffixIcon: widget.isPasswordFlag==true ? IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: Icon(_isObscure? Icons.visibility: Icons.visibility_off)
                      )
                      :null,

      ),
      
      // when using messageFlag 
      minLines: widget.messageFlag==true ? 4:null,
      maxLines: widget.messageFlag==true ? 6:1,
      keyboardType: widget.messageFlag==true ? TextInputType.multiline:TextInputType.none,
      textInputAction: widget.messageFlag==true ? TextInputAction.next:TextInputAction.none ,

      // when using isPassowrdFlag 
      obscureText: widget.isPasswordFlag==true ? _isObscure:false,
      enableSuggestions: widget.isPasswordFlag==true ? false:true,
      autocorrect: widget.isPasswordFlag==true ? false:true,
      
    );
  }
}
