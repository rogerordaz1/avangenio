import 'package:avangenio/features/auth/presentation/blocs/authentication/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constantes/colors.dart';
import '../../../../core/utils/size_config.dart';
import '../../../auth/presentation/blocs/authentication/autentication_state.dart';
import 'CustomShape.dart';


class TopCustomShape extends StatelessWidget {
  const TopCustomShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.blockSizeVertical! * 32,
      child: Stack(
        children: [
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: SizeConfig.blockSizeVertical! * 22,

              /// 150.0
              color: buttonColor,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: SizeConfig.blockSizeVertical! * 22,
                  width: SizeConfig.blockSizeHorizontal! * 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: SizeConfig.blockSizeHorizontal! * 1,
                      ),
                      color: Colors.white,
                      image: const DecorationImage(
                          image: AssetImage("assets/main/avatar.png"))),
                ),
                Builder(builder: (context) {
                  final state = context.watch<AutheticationProvider>().state;
                  if (state is AuthenticationAuthenticated) {
                    return Text(
                      state.user.fullName!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.black45),
                    );
                  }
                  if (state is AuthenticationUnauthenticated) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal! * 6.0),
                        child: Text(
                          'Debe iniciar session para modificar el perfil',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal! * 6.0),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
                SizedBox(
                  height: SizeConfig.screenHeight! / 136.6,
                ),

                /// 5.0
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
