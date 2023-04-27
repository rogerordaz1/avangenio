import 'package:flutter/material.dart';

import '../../../../../../core/constantes/colors.dart';
import '../../../../../../core/utils/size_config.dart';


class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal! * 8),

      /// 27.0
      child: Container(
        alignment: Alignment.centerRight,
        child: Text(
          "¿Olvidaste la contraseña?",
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
