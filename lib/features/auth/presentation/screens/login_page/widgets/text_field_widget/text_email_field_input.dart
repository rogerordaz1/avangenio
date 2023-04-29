import 'package:flutter/material.dart';

import '../../../../../../../core/constantes/colors.dart';
import '../../../../../../../core/utils/size_config.dart';

class TextFieldInput extends StatelessWidget {
  final String text;
  final IconData iconName;
  final String ltext;
  final Function(String value) onChange;
  final String? Function(String?)? onValidator;
  final FocusNode? focusNode;
  final void Function(PointerDownEvent)? onTapOutside;

  const TextFieldInput({
    Key? key,
    required this.text,
    required this.iconName,
    required this.ltext,
    required this.onChange,
    this.onValidator,
    this.focusNode,
    this.onTapOutside,
  }) : super(key: key);

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
          focusNode: focusNode,
          onTapOutside: onTapOutside,
          validator: onValidator,
          onChanged: onChange,
          style: TextStyle(color: textColor),
          cursorColor: textColor,
          decoration: InputDecoration(
              prefixIcon: Icon(iconName),
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
              hintText: text,
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText: ltext,
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))),
        ),
      ),
    );
  }
}
