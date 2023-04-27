import 'package:avangenio/features/auth/presentation/blocs/register/register_provider.dart';
import 'package:avangenio/features/auth/presentation/blocs/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/size_config.dart';
import '../../cubit/login_text_fields_helper_cubit.dart';
import '../../widgets/login_button.dart';
import '../../widgets/text_signup_or_singin.dart';
import '../home_page.dart';
import '../login_page/login_page_view.dart';
import 'widgets/background_image.dart';
import 'widgets/text_field.dart';

class RegisterPageView extends StatelessWidget {
  const RegisterPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerProvider = context.read<RegisterProvider>();
    var formkey = GlobalKey<FormState>();

    return Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<RegisterProvider>(
          builder: (context, provider, _) {
            () {
              if (provider.state is RegisterError) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  SnackBar snackBar =
                      const SnackBar(content: Text('Erroororro'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                });
              }

              if (provider.state is RegisterSussess) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  var route = MaterialPageRoute(
                    builder: (context) {
                      return const HomePage();
                    },
                  );
                  Navigator.of(context).pushReplacement(route);
                });
              }
            }();

            return SingleChildScrollView(
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
                    Builder(builder: (context) {
                      final state =
                          context.watch<LoginTextFieldsHelperCubit>().state;
                      return AuthButonColor(
                        buttonText: 'Iniciar Session',
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            registerProvider.registerWithEmailAndPassword(
                              email: state.email,
                              password: state.password,
                              fullName: state.username,
                            );
                          }
                        },
                      );
                    }),
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
            );
          },
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
