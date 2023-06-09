import 'package:avangenio/features/auth/presentation/blocs/register/register_provider.dart';
import 'package:avangenio/features/auth/presentation/blocs/register/register_state.dart';
import 'package:avangenio/features/home/presentation/pages/profile_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/size_config.dart';
import '../../blocs/authentication/authentication_provider.dart';
import '../../cubit/login_text_fields_helper_cubit.dart';
import '../../widgets/login_button.dart';
import '../../widgets/text_signup_or_singin.dart';
import '../login_page/login_page_view.dart';
import 'widgets/background_image.dart';
import 'widgets/text_field.dart';

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({Key? key}) : super(key: key);

  @override
  State<RegisterPageView> createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView> {
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerProvider = context.read<RegisterProvider>();
    final authProv = context.read<AutheticationProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<RegisterProvider>(
        builder: (context, provider, _) {
          var state = provider.state;

          if (state is RegisterError) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              SnackBar snackBar =
                  const SnackBar(content: Text('Ha ocurrido algun error'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });
          }

          if (state is RegisterSussess) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              authProv.loggedInUser(state.user);
              var route = MaterialPageRoute(
                  builder: (context) => const ProfilePageView());
              Navigator.of(context).pushReplacement(route);
            });
          }

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
                  Builder(
                    builder: (context) {
                      final state =
                          context.watch<LoginTextFieldsHelperCubit>().state;
                      return AuthButonColor(
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            await registerProvider.registerWithEmailAndPassword(
                              email: state.email,
                              password: state.password,
                              fullName: state.username,
                            );
                          }
                        },
                        buttonText: provider.state is RegisterLoading
                            ? Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              )
                            : Text(
                                "Iniciar Sessiòn",
                                style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal! * 6,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                      );
                    },
                  ),
                  TextSignUpOrSingIn(
                    phrase: 'Ya tines una cuenta! ',
                    singInOrSingUpText: 'Iniciar Sessión',
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPageView(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
