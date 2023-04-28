import 'package:avangenio/features/auth/presentation/blocs/authentication/authentication_provider.dart';
import 'package:avangenio/features/auth/presentation/blocs/login/login_provider.dart';
import 'package:avangenio/features/auth/presentation/blocs/login/login_state.dart';
import 'package:avangenio/features/home/presentation/profile_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../../core/utils/size_config.dart';
import '../../cubit/login_text_fields_helper_cubit.dart';
import '../../widgets/login_button.dart';
import '../../widgets/text_signup_or_singin.dart';
import '../register_page/register_page_view.dart';
import 'widgets/forgot_password.dart';
import 'widgets/logo.dart';
import 'widgets/text_field.dart';
import 'package:provider/provider.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: _LoginPageBody(),
    );
  }
}

class _LoginPageBody extends StatefulWidget {
  const _LoginPageBody({
    Key? key,
  }) : super(key: key);

  @override
  State<_LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<_LoginPageBody> {
  @override
  Widget build(BuildContext context) {
    final logicProvider = context.watch<LoginProvider>();
    final authProv = context.read<AutheticationProvider>();

    final formKey = GlobalKey<FormState>();
    return Consumer<LoginProvider>(
      builder: (context, provider, _) {
        var state = provider.state;

        () {
          if (state is LoginError) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              SnackBar snackBar = SnackBar(content: Text(state.message!));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });
          }

          if (state is LoginSussess) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              authProv.loggedInUser(state.user);

              var route = MaterialPageRoute(
                builder: (context) {
                  return const ProfilePageView();
                },
              );
              Navigator.of(context).pushReplacement(route);
            });
          }
        }();

        return SingleChildScrollView(
          child: Column(
            children: [
              const LogoImage(),
              Form(
                key: formKey,
                child: const LoginTextField(),
              ),
              const ForgotPassword(),
              Builder(
                builder: (context) {
                  final state =
                      context.watch<LoginTextFieldsHelperCubit>().state;

                  return AuthButonColor(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await logicProvider.logInWithEmailAndPassword(
                          email: state.email,
                          password: state.password,
                        );
                      }
                    },
                    buttonText: provider.state is LoginLoading
                        ? Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Flexible(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
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
                phrase: "¿No tienes una cuenta? ",
                singInOrSingUpText: 'Registrar',
                onPressed: () {
                  provider.changeToINitialState();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPageView(),
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
