import 'package:flutter/material.dart';

import '../../../../core/constantes/colors.dart';
import '../../../../core/utils/size_config.dart';

class AuthButonColor extends StatelessWidget {
  final Widget buttonText;
  final VoidCallback onPressed;
  const AuthButonColor({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.blockSizeHorizontal! * 5,
        SizeConfig.blockSizeVertical! * 10,
        SizeConfig.blockSizeHorizontal! * 5,
        SizeConfig.blockSizeVertical! * 2,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
          ],
          borderRadius:
              BorderRadius.circular(SizeConfig.blockSizeHorizontal! * 8),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(buttonColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(SizeConfig.blockSizeHorizontal! * 8),
              ),
            ),
            minimumSize: MaterialStateProperty.all(
              Size(SizeConfig.blockSizeHorizontal! * 70,
                  SizeConfig.blockSizeVertical! * 7.5),
            ),
          ),
          onPressed: onPressed,
          child: buttonText,

          /// 16
        ),
      ),
    );
  }
}
