import 'package:flutter/material.dart';

import '../../../../../../../core/constantes/colors.dart';
import '../../../../../../../core/utils/size_config.dart';

class TextFieldPassword extends StatefulWidget {
  final String hintText;
  final String labelText;
  final Function(String value) onChange;
  final String? Function(String? value)? onValidator;
  final FocusNode? focusNode;
  final void Function(PointerDownEvent)? onTapOutside;
  const TextFieldPassword({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.onChange,
    this.onValidator,
    this.focusNode,
    this.onTapOutside,
  }) : super(key: key);

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool passwordObscure = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          SizeConfig.blockSizeHorizontal! * 5,
          SizeConfig.blockSizeVertical! * 2,
          SizeConfig.blockSizeHorizontal! * 5,
          SizeConfig.blockSizeVertical! * 2,
        ),
        child: TextFormField(
          focusNode: widget.focusNode,
          onTapOutside: widget.onTapOutside,
          validator: widget.onValidator,
          onChanged: widget.onChange,
          obscureText: passwordObscure,
          style: TextStyle(color: textColor),
          cursorColor: textColor,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.vpn_key),
              suffixIcon: IconButton(
                onPressed: () => setState(() {
                  passwordObscure = !passwordObscure;
                }),
                icon: Icon(
                    passwordObscure ? Icons.visibility_off : Icons.visibility),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(SizeConfig.blockSizeHorizontal! * 5)),
                borderSide: BorderSide(
                    width: SizeConfig.blockSizeHorizontal! * 0.30,
                    color: textColor),

                /// 2
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(SizeConfig.blockSizeHorizontal! * 1.5)),
                borderSide: BorderSide(width: 1, color: texthint),
              ),
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(SizeConfig.blockSizeHorizontal! * 5),
              ),
              hintText: widget.hintText,
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText: widget.labelText,
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))),
        ),
      ),
    );
  }
}
