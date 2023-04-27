import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';
import '../../widgets/login_button.dart';
import '../../widgets/text_signup_or_singin.dart';
import '../login_page/login_page_view.dart';
import 'widgets/background_image.dart';
import 'widgets/text_field.dart';

class RegisterPageView extends StatelessWidget {
  const RegisterPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var registerBloc = BlocProvider.of<RegisterBloc>(context);
    // var authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    var formkey = GlobalKey<FormState>();

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                const BackgroundImage(),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 5,
                ),
                const RegisterTextField(),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 10,
                ),
                AuthButonColor(
                      buttonText: 'Iniciar Session',
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          // registerBloc.add(RegisterButtonPressed(
                          //     fullname: state.username,
                          //     email: state.email,
                          //     password: state.password));
                        }
                      },
                    ),
                TextSignUpOrSingIn(
                  phrase: 'Ya tines una cuenta! ',
                  singInOrSingUpText: 'Iniciar Sessión',
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPageView())),
                )
              ],
            ),
          ),
        ));

    // return BlocListener<RegisterBloc, RegisterState>(
    //   listener: (context, state) {
    //     if (state is RegisterSussess) {
    //       authenticationBloc
    //           .add(LoggedIn(user: state.user, token: state.token));
    //       Navigator.push(
    //           context, MaterialPageRoute(builder: (context) => MyHomePage()));
    //     }
    //     if (state is RegisterLoading) {
    //       showDialog(
    //           context: context,
    //           builder: ((context) {
    //             return const Center(
    //               child: CircularProgressIndicator(),
    //             );
    //           }));
    //     }
    //     if (state is RegisterError) {
    //       Navigator.pop(context);
    //       SnackBar snackBar = SnackBar(
    //           content: state.message == null
    //               ? const Text('Ha ocurrido algun error en el server')
    //               : Text(state.message!));

    //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //     }
    //   },
    //   child:
    // );
  }
}
